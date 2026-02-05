// BodhiEnlightenmentCourse.swift
// Complete guide to Buddhist awakening
// End suffering, see clearly ☸️

import SwiftUI

struct BodhiEnlightenmentCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                courseHeader
                fourNobleTruths
                eightfoldPath
                
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: BodhiLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                dailyPracticeSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Bodhi Enlightenment")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color.orange, lineWidth: 2)
                    .frame(width: 100, height: 100)
                
                Text("☸️")
                    .font(.system(size: 50))
            }
            
            Text("Bodhi Enlightenment")
                .font(.system(size: 28, weight: .black))
                .foregroundColor(.white)
            
            Text("The Buddhist Path to Awakening")
                .font(.system(size: 14))
                .foregroundColor(.orange)
            
            Text("2,500 years of refined wisdom on ending suffering, seeing reality clearly, and awakening to your true nature.")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                infoPill("10 Lessons", .orange)
                infoPill("Intermediate", .yellow)
                infoPill("~3 Hours", .green)
            }
        }
        .padding()
    }
    
    private func infoPill(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(color)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .cornerRadius(12)
    }
    
    private var fourNobleTruths: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE FOUR NOBLE TRUTHS")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.orange)
            
            VStack(spacing: 8) {
                truthRow(1, "Dukkha", "Life contains suffering", .red)
                truthRow(2, "Samudaya", "Suffering has a cause: craving", .orange)
                truthRow(3, "Nirodha", "Suffering can end", .green)
                truthRow(4, "Magga", "The Eightfold Path leads to its end", .blue)
            }
            
            Text("Buddha's core teaching: suffering is real, has a cause, can end, and there's a path to end it.")
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .italic()
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func truthRow(_ num: Int, _ pali: String, _ meaning: String, _ color: Color) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 28, height: 28)
                Text("\(num)")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 1) {
                Text(pali)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                Text(meaning)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    private var eightfoldPath: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE NOBLE EIGHTFOLD PATH")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.blue)
            
            VStack(spacing: 6) {
                pathSection("WISDOM (Paññā)", [
                    ("Right View", "Samma ditthi"),
                    ("Right Intention", "Samma sankappa")
                ], .purple)
                
                pathSection("ETHICS (Sīla)", [
                    ("Right Speech", "Samma vaca"),
                    ("Right Action", "Samma kammanta"),
                    ("Right Livelihood", "Samma ajiva")
                ], .green)
                
                pathSection("CONCENTRATION (Samādhi)", [
                    ("Right Effort", "Samma vayama"),
                    ("Right Mindfulness", "Samma sati"),
                    ("Right Concentration", "Samma samadhi")
                ], .blue)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(16)
        .padding(.horizontal)
    }
    
    private func pathSection(_ title: String, _ items: [(String, String)], _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(color)
            
            ForEach(items, id: \.0) { item in
                HStack(spacing: 8) {
                    Circle()
                        .fill(color)
                        .frame(width: 6, height: 6)
                    Text(item.0)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    Text("(\(item.1))")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private func lessonRow(_ lesson: BodhiLesson, index: Int) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.color.opacity(0.2))
                    .frame(width: 48, height: 48)
                Text("\(index + 1)")
                    .font(.system(size: 18, weight: .bold))
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
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    private var dailyPracticeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "calendar.circle.fill")
                    .foregroundColor(.green)
                Text("DAILY PRACTICE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            VStack(spacing: 8) {
                practiceRow("Morning", "Sitting meditation 10-20 min")
                practiceRow("Throughout Day", "Mindfulness of activities")
                practiceRow("Evening", "Reflection + Metta practice 10 min")
                practiceRow("Weekly", "Study Buddhist texts, connect with Sangha")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func practiceRow(_ time: String, _ practice: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(time)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.green)
                .frame(width: 90, alignment: .leading)
            Text(practice)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            Spacer()
        }
    }
    
    // MARK: - Lessons
    
    private var lessons: [BodhiLesson] {
        [
            BodhiLesson(
                title: "What Is Enlightenment?",
                subtitle: "Understanding Buddhist awakening",
                color: .orange,
                content: """
                ## Bodhi: Awakening
                
                Bodhi (Sanskrit/Pali) = awakening, enlightenment
                
                The Buddha wasn't a god—he was a man who woke up. "Buddha" means "the awakened one." What he awakened to, you can awaken to.
                
                ---
                
                ## The Historical Buddha
                
                **Siddhartha Gautama** (c. 563-483 BCE):
                
                - Born a prince in what is now Nepal
                - Sheltered from suffering by his father
                - At 29, encountered old age, sickness, death, and a wandering monk
                - Left palace to seek liberation
                - Practiced extreme asceticism (didn't work)
                - Sat under Bodhi tree, vowed not to move until enlightened
                - At 35, achieved full awakening
                - Spent next 45 years teaching
                - Died at 80, entering final nirvana
                
                **His realization:** The nature of reality and the path to freedom from suffering.
                
                ---
                
                ## What Did He Realize?
                
                **Three Marks of Existence:**
                
                1. **Dukkha** (suffering/unsatisfactoriness)
                   - All conditioned existence is ultimately unsatisfying
                   - Not pessimism—realistic assessment
                
                2. **Anicca** (impermanence)
                   - Everything changes
                   - Nothing you can cling to is permanent
                
                3. **Anatta** (non-self)
                   - There is no fixed, permanent self
                   - What you think is "you" is a process, not a thing
                
                **Seeing these clearly = enlightenment.**
                
                ---
                
                ## Levels of Awakening
                
                **Theravada tradition (four stages):**
                
                1. **Stream-enterer (Sotāpanna):**
                   - First glimpse of nirvana
                   - Doubt in Buddha/Dharma/Sangha ended
                   - No more than 7 rebirths
                
                2. **Once-returner (Sakadāgāmin):**
                   - Weakened sensual desire and ill-will
                   - One more human rebirth maximum
                
                3. **Non-returner (Anāgāmin):**
                   - Sensual desire and ill-will eliminated
                   - Won't be reborn in human realm
                
                4. **Arahant:**
                   - Full enlightenment
                   - All fetters destroyed
                   - No more rebirth
                
                **Mahayana tradition:**
                - Emphasizes Bodhisattva path
                - Awakening for benefit of all beings
                - Buddhahood as ultimate goal
                
                ---
                
                ## What Enlightenment Is NOT
                
                - Not supernatural powers (though they may arise)
                - Not being perfect
                - Not being emotionless
                - Not escaping life
                - Not just intellectual understanding
                
                **What it IS:**
                - Clear seeing of reality
                - Freedom from craving and aversion
                - End of identification with ego
                - Unconditional peace
                - Boundless compassion
                
                ---
                
                ## The Same Truth
                
                What Buddhism calls enlightenment, other traditions describe:
                
                - **Hinduism:** Moksha (liberation)
                - **Taoism:** Returning to the Tao
                - **Christianity:** Union with God, Christ consciousness
                - **Sufism:** Fana (annihilation of ego)
                
                Same destination, different vehicles. We all the same. ☸️
                """,
                keyTakeaway: "Buddhist enlightenment (Bodhi) is awakening to the nature of reality: impermanence, suffering, and non-self. It's not supernatural but a clear seeing that ends craving and brings peace. The Buddha was a human who achieved this—and taught that you can too.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Learn the Four Noble Truths (memorize them)
                2. Begin sitting meditation (10 min daily)
                3. Notice: Where do you resist impermanence?
                
                **Journaling prompt:**
                What is your current relationship with suffering? Do you avoid it, fight it, or investigate it?
                """
            ),
            BodhiLesson(
                title: "Mindfulness Basics",
                subtitle: "The foundation of practice",
                color: .green,
                content: """
                ## What Is Mindfulness?
                
                **Sati** (Pali) = mindfulness, awareness, remembering
                
                Mindfulness is:
                - Paying attention on purpose
                - In the present moment
                - Without judgment
                
                It's not:
                - Thinking about the present
                - Emptying the mind
                - Being relaxed (though relaxation may come)
                
                ---
                
                ## The Four Foundations
                
                The Buddha taught four objects of mindfulness (**Satipatthana**):
                
                **1. Body (Kaya)**
                - Breath awareness
                - Body sensations
                - Postures
                - Activities
                
                **2. Feelings (Vedana)**
                - Pleasant
                - Unpleasant
                - Neutral
                - (Not emotions—raw feeling tone)
                
                **3. Mind (Citta)**
                - Mental states
                - Quality of awareness
                - Contracted or expanded
                
                **4. Dharmas (Mental Objects)**
                - Thoughts
                - Hindrances
                - Factors of enlightenment
                - Four Noble Truths
                
                ---
                
                ## Basic Breath Meditation
                
                **Instructions:**
                
                1. **Sit comfortably**
                   - Spine straight but not rigid
                   - Chair, cushion, or bench
                   - Hands resting naturally
                
                2. **Settle**
                   - Take a few deep breaths
                   - Release tension
                   - Arrive in the present
                
                3. **Find the breath**
                   - Notice where you feel it most clearly
                   - Nostrils, chest, or belly
                   - Don't control—just observe
                
                4. **Stay with it**
                   - Feel each inhale and exhale
                   - Notice beginning, middle, end
                   - Count breaths 1-10 if helpful
                
                5. **When mind wanders (it will)**
                   - Notice you've wandered
                   - No judgment
                   - Gently return to breath
                   - This IS the practice
                
                6. **Continue**
                   - 5-10 minutes to start
                   - Build to 20-45 minutes
                
                ---
                
                ## What You're Training
                
                **Not** trying to stop thoughts.
                
                **Training:**
                - Attention: Where is my mind?
                - Recognition: I've wandered
                - Non-judgment: That's okay
                - Return: Back to breath
                
                Every time you notice you've wandered and return, you're doing a mental "rep." This builds:
                - Concentration
                - Self-awareness
                - Emotional regulation
                - Present-moment stability
                
                ---
                
                ## Daily Life Mindfulness
                
                **Extend practice off the cushion:**
                
                - **Walking:** Feel feet touching ground
                - **Eating:** Taste, texture, chewing
                - **Driving:** Hands on wheel, visual field
                - **Listening:** Full attention, no planning response
                - **Working:** One task, present focus
                - **Waiting:** Breath, body, instead of phone
                
                **The key:** Whatever you're doing, know that you're doing it.
                
                ---
                
                ## Common Obstacles
                
                **1. "I can't stop my thoughts"**
                You're not supposed to. Notice thoughts, return to breath.
                
                **2. "I keep falling asleep"**
                Try open eyes, sitting up straighter, earlier in day.
                
                **3. "I don't have time"**
                5 minutes counts. Everyone has 5 minutes.
                
                **4. "It's boring"**
                Investigate boredom. What does it feel like?
                
                **5. "I'm not doing it right"**
                If you're noticing breath and returning when wandered, you're doing it right.
                """,
                keyTakeaway: "Mindfulness is present-moment awareness without judgment. The breath is the classic anchor. When mind wanders (it will), notice and return—this IS the practice. Extend mindfulness to daily activities. Consistency matters more than duration.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Breath meditation: 10 min every morning
                2. One daily activity with full mindfulness (eating, walking)
                3. Notice moments of automatic pilot throughout day
                
                **Journaling prompt:**
                What do you notice about your mind during meditation? Busy? Calm? Resistant?
                """
            ),
            BodhiLesson(
                title: "Vipassana: Insight Meditation",
                subtitle: "Seeing things as they are",
                color: .blue,
                content: """
                ## Beyond Calm: Insight
                
                **Samatha** = calm, concentration (settling the mind)
                **Vipassana** = insight (seeing clearly)
                
                Mindfulness of breath develops samatha. Vipassana uses that stable attention to investigate reality.
                
                ---
                
                ## What You're Seeing
                
                Vipassana reveals the three characteristics directly:
                
                **1. Impermanence (Anicca)**
                - Watch sensations arise and pass
                - See thoughts appear and disappear
                - Notice constant change
                
                **2. Suffering (Dukkha)**
                - Observe how clinging causes suffering
                - See how resisting reality hurts
                - Notice unsatisfactoriness in all experience
                
                **3. Non-self (Anatta)**
                - Where is the "experiencer"?
                - Who is aware?
                - Is there a fixed self, or just a process?
                
                ---
                
                ## Body Scanning Technique
                
                **Classic Goenka-style Vipassana:**
                
                1. Start at top of head
                2. Move attention slowly down body
                3. Notice every sensation (heat, cold, tingling, pressure, nothing)
                4. Don't react—just observe
                5. See sensations arise and pass
                6. Reach feet, sweep back up
                7. Continue for session duration
                
                **What you learn:**
                - All sensations are impermanent
                - Reactions to sensations cause suffering
                - With equanimity, suffering lessens
                
                ---
                
                ## Noting Practice
                
                **Mahasi Sayadaw tradition:**
                
                1. Sit with attention on abdomen
                2. Note "rising" on inhale, "falling" on exhale
                3. When anything else arises, note it:
                   - "Thinking" (thoughts)
                   - "Hearing" (sounds)
                   - "Itching" (sensations)
                   - "Planning" (mental activity)
                   - "Feeling" (emotions)
                4. Return to rising/falling
                
                **The note:**
                - Silent mental label
                - Light touch, not forced
                - Creates space between experience and reaction
                
                **What you learn:**
                - All experience is made of momentary events
                - Nothing needs to be pushed away or clung to
                - Awareness can be non-reactive
                
                ---
                
                ## The Progress of Insight
                
                Classic Vipassana traditions map stages of insight:
                
                1. **Knowledge of Mind and Body** - Seeing they're separate
                2. **Cause and Effect** - Seeing dependent origination
                3. **Three Characteristics** - Seeing anicca, dukkha, anatta
                4. **Arising and Passing** - Seeing rapid change (often with rapture)
                5. **Dissolution** - Only endings visible (can feel unpleasant)
                6. **Fear, Misery, Disgust** - The "Dark Night"
                7. **Desire for Deliverance** - Wanting out
                8. **Re-observation** - Working through the difficult stages
                9. **Equanimity** - Deep peace, things become lighter
                10. **Path Moment** - Actual glimpse of nirvana
                11. **Fruition** - Established in insight
                12. **Review** - Looking back at what happened
                
                **Note:** Not everyone experiences these in order or at all. Don't chase stages.
                
                ---
                
                ## The Dark Night
                
                **Between stages 5-8:**
                
                Some meditators experience difficult territory:
                - Anxiety, fear
                - Sense of meaninglessness
                - Depression-like states
                - Desire to quit practice
                
                **This is normal on the path.** It's not a sign you're doing it wrong—it's purification happening.
                
                **How to work with it:**
                - Continue practice with teacher support
                - Metta (loving-kindness) as balance
                - Grounding activities
                - Don't over-identify with stages
                - It passes with continued equanimity
                
                ---
                
                ## Safety Note
                
                Deep Vipassana practice can be destabilizing. Having support (teacher, sangha) is important. If you have trauma history or mental health conditions, work with teachers who understand these.
                """,
                keyTakeaway: "Vipassana uses stable attention to directly see impermanence, suffering, and non-self. Body scanning and noting are classic techniques. The progress of insight includes both beautiful and difficult stages. Teacher support matters for deep practice.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Try body scanning: 15 min (head to feet and back)
                2. Experiment with noting for one session
                3. Notice impermanence throughout day (sounds, sensations, moods)
                
                **Journaling prompt:**
                What's your relationship with impermanence? Do you resist change or flow with it?
                """
            ),
            BodhiLesson(
                title: "Metta: Loving-Kindness",
                subtitle: "Opening the heart",
                color: .pink,
                content: """
                ## Beyond Analysis: Love
                
                Buddhism isn't just about wisdom—it's about compassion. **Metta** (loving-kindness) balances insight with heart.
                
                The Buddha taught four "divine abodes" (Brahmaviharas):
                1. **Metta** - Loving-kindness
                2. **Karuna** - Compassion
                3. **Mudita** - Sympathetic joy
                4. **Upekkha** - Equanimity
                
                ---
                
                ## Why Metta?
                
                **Benefits:**
                - Softens the heart
                - Counters anger and fear
                - Reduces self-criticism
                - Improves relationships
                - Balances dry insight practice
                - Creates happiness in the present
                
                **From the suttas:**
                "One sleeps easily, wakes easily, dreams no evil dreams. One is dear to human beings, dear to non-human beings. The devas protect one. Neither fire, poison, nor weapons can touch one."
                
                ---
                
                ## Basic Metta Practice
                
                **1. Self:**
                Start by directing loving-kindness to yourself:
                
                *"May I be happy.
                May I be healthy.
                May I be safe.
                May I live with ease."*
                
                Repeat slowly. Feel the intention. Don't force feeling—plant seeds.
                
                **2. Benefactor:**
                Someone who naturally brings warmth (teacher, grandmother, pet):
                
                *"May you be happy..."*
                
                **3. Friend:**
                Someone you care about:
                
                *"May you be happy..."*
                
                **4. Neutral person:**
                Someone you neither like nor dislike (cashier, neighbor):
                
                *"May you be happy..."*
                
                **5. Difficult person:**
                Someone you have conflict with (start mild):
                
                *"May you be happy..."*
                
                **6. All beings:**
                Expand to all beings everywhere:
                
                *"May all beings be happy.
                May all beings be healthy.
                May all beings be safe.
                May all beings live with ease."*
                
                ---
                
                ## Working With Difficulty
                
                **"I don't feel anything":**
                That's okay. Metta is intention, not emotion. Keep practicing.
                
                **"I can't do self-metta":**
                Very common. Start with benefactor, circle back. Or imagine yourself as a child deserving love.
                
                **"I can't wish well for difficult person":**
                Start with mildly annoying person, build up. Or recognize: if they were happy and at peace, they wouldn't cause harm.
                
                **"It feels fake":**
                Repetition creates reality. Fake it till you make it is valid here.
                
                ---
                
                ## Metta In Daily Life
                
                **Quick practices:**
                
                - Walking: "May you be happy" to each person you pass
                - Traffic: Metta for other drivers
                - Conflict: Pause, wish them well silently
                - Social media: Before commenting, metta
                - Morning: First thought be metta for self
                
                **Extended:**
                
                - Metta for challenging people in your life
                - Metta for groups (political opponents, etc.)
                - Metta for beings you'll never meet
                
                ---
                
                ## Other Brahmaviharas
                
                **Karuna (Compassion):**
                Wishing beings be free from suffering
                *"May you be free from pain and sorrow"*
                
                **Mudita (Sympathetic Joy):**
                Delighting in others' happiness
                *"May your happiness and good fortune continue"*
                
                **Upekkha (Equanimity):**
                Balanced, non-reactive love
                *"You are the owner of your actions. May you find peace."*
                
                ---
                
                ## We All The Same
                
                Every tradition has a practice of opening the heart:
                
                - **Hinduism:** Bhakti (devotional love)
                - **Christianity:** Agape (unconditional love)
                - **Sufism:** Ishq (divine love)
                - **Judaism:** Chesed (loving-kindness)
                
                Love is universal. Metta is one technology for cultivating it. ☸️💗
                """,
                keyTakeaway: "Metta (loving-kindness) meditation cultivates unconditional friendliness toward self and others. It balances insight practice with heart opening. Start with self, expand outward to all beings. Intention matters more than emotion—keep practicing.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Metta meditation: 10-15 min daily
                2. Focus on self-metta until it feels authentic
                3. One metta wish for a difficult person
                
                **Journaling prompt:**
                Who do you have the hardest time wishing well? Why? What would change if you could?
                """
            ),
            BodhiLesson(
                title: "The Five Precepts",
                subtitle: "Ethical foundation for practice",
                color: .purple,
                content: """
                ## Why Ethics?
                
                Meditation without ethics is incomplete. The Buddha taught that awakening requires wisdom (meditation/insight) AND morality (how we live).
                
                **The connection:**
                - Harmful actions agitate the mind
                - Agitated mind can't concentrate
                - Without concentration, no insight
                - Without insight, no liberation
                
                Ethics create the conditions for meditation to work.
                
                ---
                
                ## The Five Precepts
                
                **1. I undertake the training to refrain from taking life**
                
                - Not killing any sentient being
                - Includes animals
                - Not just action—intention matters
                - Extended: Protect and cherish life
                
                **2. I undertake the training to refrain from taking what is not given**
                
                - Not stealing
                - Includes tax evasion, piracy, etc.
                - Not just things—time, energy, attention
                - Extended: Practice generosity
                
                **3. I undertake the training to refrain from sexual misconduct**
                
                - Not causing harm through sexuality
                - Adultery, exploitation, coercion
                - Consent and honesty
                - Extended: Contentment, appropriate relationships
                
                **4. I undertake the training to refrain from false speech**
                
                - Not lying
                - Also: divisive speech, harsh speech, idle chatter
                - Extended: Speak truth, kindly, helpfully
                
                **5. I undertake the training to refrain from intoxicants that cause heedlessness**
                
                - Alcohol, drugs that cloud the mind
                - They lead to breaking other precepts
                - Extended: Maintain clarity, consume mindfully
                
                ---
                
                ## Training Rules, Not Commandments
                
                **Key distinction:**
                
                These are not commandments from a deity. They're training rules you voluntarily undertake because you understand their benefit.
                
                - Breaking them isn't "sin"—it's unskillful
                - No divine punishment—natural consequences
                - If you break them, recommit and continue
                
                **The spirit matters:**
                You can follow the letter while violating the spirit. The precepts are about non-harm and positive cultivation.
                
                ---
                
                ## Working With Precepts
                
                **Daily reflection:**
                
                At day's end:
                - Have I refrained from harming?
                - Have I been honest?
                - Have I been generous?
                - How is my speech?
                - Is my consumption mindful?
                
                **When you slip:**
                - Notice without harsh judgment
                - Understand the conditions
                - Recommit
                - Make amends if appropriate
                
                **Edge cases:**
                Life is complex. The precepts are guidelines, not absolutes. Use wisdom.
                
                ---
                
                ## Extended Ethics
                
                **Eight Precepts (for intensive practice/retreat):**
                
                Add:
                6. No eating after noon
                7. No entertainment, adornment
                8. No high/luxurious beds
                
                **Ten Precepts (novice monastics):**
                
                Add more restrictions for renunciates.
                
                **For laypeople:**
                The five are sufficient. Live them deeply.
                
                ---
                
                ## Generosity (Dana)
                
                **First step on the path:**
                
                Before ethics, before meditation: giving.
                
                - Give material things
                - Give time and energy
                - Give attention
                - Give fearlessness
                - Give the Dharma
                
                Generosity loosens attachment and opens the heart.
                
                ---
                
                ## The Same Truth
                
                Every tradition has ethical guidelines:
                
                - **Judaism/Christianity:** Ten Commandments
                - **Islam:** Five Pillars include zakat (charity)
                - **Hinduism:** Yamas and Niyamas
                - **Secular:** Golden Rule
                
                Non-harm and positive cultivation are universal. 🙏
                """,
                keyTakeaway: "The Five Precepts (no killing, stealing, sexual misconduct, lying, intoxicants) are training rules that create conditions for meditation to work. They're not commandments but voluntary commitments to non-harm. Generosity is the foundation. Ethics and meditation support each other.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Memorize the Five Precepts
                2. Evening reflection: How did I do today?
                3. One act of generosity (time, money, or attention)
                
                **Journaling prompt:**
                Which precept is most challenging for you? What conditions make it hard to keep?
                """
            ),
            BodhiLesson(
                title: "Impermanence Contemplation",
                subtitle: "Seeing change directly",
                color: .teal,
                content: """
                ## The Central Insight
                
                **Anicca** (Pali) = impermanence, change
                
                Everything conditioned:
                - Arises
                - Persists briefly
                - Passes away
                
                This isn't philosophy—it's observable fact. Realizing it deeply is liberating.
                
                ---
                
                ## Why Contemplate Impermanence?
                
                **Our suffering comes from treating impermanent things as permanent:**
                
                - We cling to pleasures (they end)
                - We resist pain (it changes)
                - We identify with self (it shifts)
                - We fear death (it's natural)
                
                **Seeing impermanence clearly:**
                - Reduces clinging
                - Decreases fear
                - Increases presence
                - Opens compassion
                - Approaches liberation
                
                ---
                
                ## Death Contemplation
                
                **Traditional practice (Maranasati):**
                
                The Buddha recommended contemplating death daily:
                
                *"Of all the footprints, that of the elephant is supreme. Similarly, of all mindfulness meditation, that on death is supreme."*
                
                **Five Recollections:**
                
                1. "I am of the nature to age. There is no way to escape aging."
                2. "I am of the nature to have ill health. There is no way to escape ill health."
                3. "I am of the nature to die. There is no way to escape death."
                4. "All that is dear to me and everyone I love are of the nature to change. There is no way to escape being separated from them."
                5. "My actions are my only true belongings. I cannot escape the consequences of my actions. They are the ground upon which I stand."
                
                **How to practice:**
                - Recite each morning
                - Let them sink in
                - Not morbid—honest
                
                ---
                
                ## Charnel Ground Contemplation
                
                **Traditional nine cemetery contemplations:**
                
                Monks would contemplate corpses in various stages of decay:
                
                1. Bloated
                2. Discolored
                3. Festered
                4. Cut up
                5. Gnawed
                6. Scattered
                7. Hacked and scattered
                8. Bleeding
                9. Worm-infested, skeleton, bones, dust
                
                **Purpose:** Not to be gruesome but to see: this body is subject to this. Not to identify with the impermanent.
                
                **Modern adaptation:**
                - Visit a cemetery, sit with mortality
                - Watch nature documentaries showing death
                - Contemplate the death of loved ones
                - Remember: everyone you see will die
                
                ---
                
                ## Impermanence of Thoughts
                
                **In meditation:**
                
                Watch thoughts arise and pass. Don't engage—just observe:
                
                - Where do they come from?
                - Where do they go?
                - How long do they last?
                - What's between them?
                
                **Insight:** You are not your thoughts. They're weather passing through.
                
                ---
                
                ## Impermanence of Self
                
                **Investigation:**
                
                - Am I my body? (It changes constantly)
                - Am I my feelings? (They shift moment to moment)
                - Am I my thoughts? (They come and go)
                - Am I my personality? (It's evolved over years)
                - What is constant?
                
                **The Buddha's teaching:** There is no unchanging self to be found. What we call "self" is a process, not a thing.
                
                ---
                
                ## Living With Impermanence
                
                **Not nihilism:**
                
                Impermanence doesn't mean life is meaningless. It means:
                - Appreciate now (it won't last)
                - Don't cling (causes suffering)
                - Flow with change (resistance hurts)
                - Prioritize what matters (time is limited)
                
                **The paradox:** Fully accepting impermanence allows you to live more fully.
                
                ---
                
                ## Same Truth
                
                All traditions teach impermanence:
                
                - **Christianity:** "For dust you are and to dust you shall return"
                - **Stoicism:** Memento mori (remember death)
                - **Taoism:** The Tao flows, nothing is fixed
                - **Indigenous traditions:** Cycles of nature
                
                Nothing new here—wisdom traditions agree. 🍂
                """,
                keyTakeaway: "Impermanence is not philosophy but observable fact. Contemplating it (especially death) reduces clinging and fear. Everything changes—body, thoughts, self. Accepting this fully allows more presence and less suffering.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Five Recollections: morning and evening
                2. In meditation, note arising and passing of phenomena
                3. Notice three things that changed today
                
                **Journaling prompt:**
                What are you clinging to that is impermanent? What would change if you accepted its impermanence?
                """
            ),
            BodhiLesson(
                title: "Non-Self Investigation",
                subtitle: "The deepest teaching",
                color: .indigo,
                content: """
                ## The Hardest Teaching
                
                **Anatta** (Pali) = non-self, no fixed self
                
                This is Buddhism's most radical and misunderstood teaching. It doesn't mean "you don't exist"—it means what you think of as "you" is not what you assume.
                
                ---
                
                ## What We Usually Assume
                
                **The default belief:**
                
                There's a "me" that is:
                - Continuous (same person over time)
                - Unified (one coherent self)
                - Autonomous (in control)
                - Essential (the "real me" underneath)
                
                **The Buddha's observation:**
                
                When you look closely, you can't find any such thing.
                
                ---
                
                ## The Five Aggregates (Skandhas)
                
                The Buddha analyzed "self" into five processes:
                
                **1. Form (Rupa)**
                - The physical body
                - Made of elements (earth, water, fire, air)
                - Constantly changing
                - Is this the self? (No—I say "my body," implying I'm separate from it)
                
                **2. Feeling (Vedana)**
                - Pleasant, unpleasant, or neutral tone
                - Arises with every experience
                - Constantly changing
                - Is this the self? (No—feelings come and go)
                
                **3. Perception (Sañña)**
                - Recognition, labeling
                - "This is red," "that's a chair"
                - Constantly changing
                - Is this the self? (No—perceptions shift)
                
                **4. Mental Formations (Sankhara)**
                - Intentions, emotions, habits
                - Volition, will
                - Constantly changing
                - Is this the self? (No—moods and intentions shift)
                
                **5. Consciousness (Viññana)**
                - Awareness of sense objects
                - Six types (five senses + mind)
                - Constantly changing
                - Is this the self? (No—consciousness flickers)
                
                **Conclusion:** None of the aggregates is self. They're all impermanent, and what's impermanent can't be a stable "self."
                
                ---
                
                ## The Investigation
                
                **Direct inquiry:**
                
                In meditation, ask:
                
                - Who is aware right now?
                - Where is the "I"?
                - If I am the thinker, why can I observe thoughts?
                - What remains when thoughts stop?
                - Can I find an owner of experience?
                
                **Don't answer intellectually.** Look directly. What do you find?
                
                ---
                
                ## What Anatta Doesn't Mean
                
                **NOT:**
                - Nihilism (nothing exists)
                - You should be a doormat
                - Personality is bad
                - Memory/continuity don't function
                - Moral responsibility doesn't apply
                
                **DOES MEAN:**
                - What you call "self" is a process
                - It's dependent on conditions
                - It's not as solid as assumed
                - Identification with it causes suffering
                
                **Analogy:** A river appears continuous but is actually new water flowing constantly. The "river" is a convenient label for a process.
                
                ---
                
                ## Conventional vs Ultimate Truth
                
                **Two levels:**
                
                **Conventional (sammuti):**
                - "I" and "you" are useful labels
                - We function with sense of self
                - Normal language and responsibility apply
                
                **Ultimate (paramattha):**
                - No fixed self can be found
                - Just processes arising and passing
                - Liberation comes from seeing this
                
                Both are valid in their domain. Don't use ultimate truth to escape conventional responsibility.
                
                ---
                
                ## Who Gets Enlightened?
                
                **Common question:** If there's no self, who practices? Who gets enlightened?
                
                **Answer:** Practice happens. Enlightenment happens. There was never a separate self doing it—just the process assuming it was a self.
                
                Like asking "who grows the plant?"—it just grows, conditions coming together.
                
                ---
                
                ## Same Truth
                
                Other traditions point to this:
                
                - **Hinduism:** "Atman is Brahman"—individual self is cosmic self
                - **Christianity:** "Not I, but Christ in me"
                - **Sufism:** Fana—ego annihilates into God
                - **Taoism:** "The Tao that can be named is not the Tao"
                
                The ego-dissolution moment is universal. 🌊
                """,
                keyTakeaway: "Anatta (non-self) means no fixed, unchanging self can be found—just five aggregates constantly changing. This isn't nihilism but freedom from over-identification. Direct investigation in meditation reveals this. Both conventional self and ultimate non-self are valid in their domains.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Study the five aggregates—can you identify them in experience?
                2. In meditation, ask "Who is aware?" Don't answer—look.
                3. Notice how "self" is constructed in daily life
                
                **Journaling prompt:**
                Who do you think you are? Where did that idea come from? Is it accurate?
                """
            ),
            BodhiLesson(
                title: "Working With Hindrances",
                subtitle: "Obstacles on the path",
                color: .red,
                content: """
                ## The Five Hindrances
                
                Every meditator encounters these obstacles. The Buddha named them clearly so we can work with them:
                
                1. **Sensual Desire** (Kamacchanda)
                2. **Ill-Will** (Vyapada)
                3. **Sloth and Torpor** (Thina-middha)
                4. **Restlessness and Worry** (Uddhacca-kukkucca)
                5. **Doubt** (Vicikiccha)
                
                ---
                
                ## 1. Sensual Desire
                
                **What it is:**
                Mind pulled toward pleasant sense experiences—food, sex, comfort, entertainment.
                
                **How it manifests:**
                - Planning meals during meditation
                - Sexual fantasies arising
                - Craving for music, movies, etc.
                - General "wanting mind"
                
                **Antidotes:**
                - Contemplate impermanence of pleasure
                - Contemplate the body (reduces lust)
                - Note "wanting, wanting"
                - Practice contentment
                - Remember: desire satisfied just creates more desire
                
                ---
                
                ## 2. Ill-Will (Aversion)
                
                **What it is:**
                Mind pushing away unpleasant experiences—anger, irritation, hatred, judgment.
                
                **How it manifests:**
                - Replaying conflicts
                - Irritation at sounds, sensations
                - Self-criticism
                - Judging others
                
                **Antidotes:**
                - Metta practice (especially for difficult person)
                - See the suffering behind the behavior
                - Note "aversion, aversion"
                - Ask: What is this anger protecting?
                - Remember: Holding anger hurts YOU
                
                ---
                
                ## 3. Sloth and Torpor
                
                **What it is:**
                Heaviness, drowsiness, dullness, lack of energy.
                
                **How it manifests:**
                - Falling asleep in meditation
                - Mind feels foggy
                - Can't muster effort
                - Just want to lie down
                
                **Antidotes:**
                - Open eyes, raise gaze
                - Stand or walk
                - Splash cold water
                - Brighten the light
                - Take deep breaths
                - Contemplate inspiring topics
                - Check: Are you getting enough sleep?
                
                ---
                
                ## 4. Restlessness and Worry
                
                **What it is:**
                Agitation, inability to settle, obsessive thinking about future or past.
                
                **How it manifests:**
                - Can't sit still
                - Planning, planning, planning
                - Ruminating on mistakes
                - Mind jumping everywhere
                - Body tension
                
                **Antidotes:**
                - Count breaths
                - Body scan to ground
                - Walking meditation
                - Longer exhales
                - Note "restless, restless"
                - Remember: The future isn't real, the past is gone
                
                ---
                
                ## 5. Doubt
                
                **What it is:**
                Uncertainty about the practice, the teaching, or oneself.
                
                **How it manifests:**
                - "Is this working?"
                - "Am I doing it right?"
                - "Is this path for me?"
                - "What if it's all nonsense?"
                - Decision paralysis
                
                **Antidotes:**
                - Study the teachings (reduce ignorance)
                - Talk to a teacher
                - Remember: Practice to find out, not because you're certain
                - Note "doubt, doubt"
                - Reflect on benefits you've already experienced
                
                ---
                
                ## The Meta-Approach
                
                **Best strategy:**
                
                Don't fight hindrances—study them.
                
                1. **Recognize:** "Ah, sloth is here"
                2. **Accept:** "This is just what's arising now"
                3. **Investigate:** "What does it feel like? Where in the body?"
                4. **Non-identify:** "This is not me, it's a passing state"
                5. **Natural release:** It will pass
                
                **RAIN:**
                - Recognize
                - Accept/Allow
                - Investigate
                - Non-identification
                
                ---
                
                ## The Factors of Awakening
                
                **Counter to hindrances:**
                
                Seven factors that support awakening:
                
                1. **Mindfulness** (Sati) - counters all hindrances
                2. **Investigation** (Dhamma-vicaya) - counters sloth
                3. **Energy** (Viriya) - counters sloth
                4. **Joy** (Pīti) - counters aversion
                5. **Tranquility** (Passaddhi) - counters restlessness
                6. **Concentration** (Samādhi) - counters restlessness
                7. **Equanimity** (Upekkhā) - counters desire and aversion
                
                Cultivate these, and hindrances naturally diminish.
                """,
                keyTakeaway: "The five hindrances (desire, aversion, sloth, restlessness, doubt) are universal obstacles. Don't fight them—recognize, accept, investigate, and let them pass. RAIN technique works well. Cultivate the seven factors of awakening as antidotes.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Identify your primary hindrance (we all have a main one)
                2. Practice RAIN when it arises
                3. Apply specific antidote from lesson
                
                **Journaling prompt:**
                Which hindrance is your constant companion? What are you learning about it?
                """
            ),
            BodhiLesson(
                title: "Retreat Practice",
                subtitle: "Deepening through intensive meditation",
                color: .cyan,
                content: """
                ## Why Retreat?
                
                Daily practice is foundation. Retreat is acceleration.
                
                **What changes on retreat:**
                - Continuity of practice (no gaps)
                - Less distraction
                - Mind settles deeper
                - Insights arise more readily
                - Support of silence, structure, community
                
                ---
                
                ## Types of Retreats
                
                **1. One-day (daylong):**
                - Good introduction
                - 6-10 hours of practice
                - Return home at night
                
                **2. Weekend (2-3 days):**
                - Deeper than daylong
                - Mind starts to settle
                - Taste of sustained practice
                
                **3. Week-long (5-10 days):**
                - Classic intensive
                - Real transformation possible
                - Mind goes through phases
                - Goenka 10-day is famous
                
                **4. Long retreat (2 weeks - 3 months):**
                - Deep dive
                - Significant shifts possible
                - Usually at established center
                
                **5. Self-retreat:**
                - At home or rented space
                - Requires strong self-discipline
                - Best with teacher support
                
                ---
                
                ## What to Expect
                
                **Day 1-2:**
                - Excitement or resistance
                - Body adjusting to sitting
                - Mind still active with life concerns
                
                **Day 3-4:**
                - Often hardest days
                - Resistance peaks
                - Boredom, doubt, restlessness
                - Urge to leave
                
                **Day 5-7:**
                - Mind begins to settle
                - Concentration deepens
                - More presence, less thinking
                - Possible insights
                
                **Day 8-10:**
                - Deeper states more accessible
                - Clear seeing may arise
                - Integration begins
                - Gratitude common
                
                **Note:** Everyone's experience is different. Don't compare.
                
                ---
                
                ## Noble Silence
                
                **Most retreats observe silence:**
                
                - No talking
                - No eye contact (or minimal)
                - No reading, writing, phones
                - No entertainment
                
                **Why:**
                - Reduces stimulation
                - Prevents social performance
                - Turns attention inward
                - Conserves energy
                
                **Functional speech:** Questions to teacher, safety concerns are allowed.
                
                ---
                
                ## Retreat Schedule (Example)
                
                **Typical day:**
                
                5:00 - Wake
                5:30 - Sitting meditation
                6:30 - Walking meditation
                7:00 - Breakfast (mindful, silent)
                8:00 - Sitting
                9:00 - Walking
                9:30 - Sitting
                10:30 - Walking
                11:00 - Sitting
                12:00 - Lunch
                1:00 - Rest/walking
                2:00 - Sitting
                3:00 - Walking
                3:30 - Sitting
                4:30 - Walking
                5:00 - Sitting
                6:00 - Supper/tea
                7:00 - Dharma talk or sitting
                8:00 - Sitting
                9:00 - Sleep
                
                **8-10+ hours of meditation daily.**
                
                ---
                
                ## Choosing a Retreat
                
                **Questions to ask:**
                
                - What tradition/technique?
                - Teacher qualifications?
                - Student reviews?
                - Cost/dana basis?
                - Accommodation (private/shared)?
                - Physical demands?
                - Support available?
                
                **Good traditions:**
                - Insight Meditation Society (IMS)
                - Spirit Rock
                - Goenka centers (free, donation-based)
                - Zen centers
                - Thai forest tradition
                
                ---
                
                ## After Retreat
                
                **Integration is crucial:**
                
                - Ease back into life
                - Maintain practice
                - Be patient with "re-entry"
                - Don't judge normal life
                - Stay connected to sangha
                - Plan next retreat
                
                **Warning:** "Retreat high" can fade. The practice is daily life, not peak experiences.
                
                ---
                
                ## Can't Retreat?
                
                **Alternatives:**
                
                - Half-day sits monthly
                - Annual day-long
                - Morning session before work
                - "Urban retreat" (practice periods at home)
                - Online retreats (became common post-COVID)
                
                Any sustained practice helps.
                """,
                keyTakeaway: "Retreat accelerates practice through continuity and reduced distraction. Expect phases—initial excitement, mid-retreat difficulty, then deepening. Choose retreats carefully (tradition, teacher, reviews). Integration after retreat matters as much as the retreat itself.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Research one retreat center in your tradition
                2. Try a "mini retreat" at home (3-4 hours silent practice)
                3. Notice what arises with sustained practice
                
                **Journaling prompt:**
                What's stopping you from going on retreat? Is it real or resistance?
                """
            ),
            BodhiLesson(
                title: "Living the Dharma",
                subtitle: "Taking practice into the world",
                color: .yellow,
                content: """
                ## Off the Cushion
                
                Meditation creates conditions. Life is the test.
                
                **The Buddha didn't teach:**
                - Escape from life
                - Monasticism for everyone
                - Retreat from the world
                
                **He taught:**
                - Liberation while living
                - Ethical engagement
                - Wisdom in action
                - Compassion in relationships
                
                ---
                
                ## The Sangha
                
                **Three Jewels:**
                - Buddha (the teacher/awakened nature)
                - Dharma (the teaching/truth)
                - Sangha (the community)
                
                **Why community matters:**
                - Support when practice is hard
                - Accountability
                - Shared wisdom
                - Preventing isolation
                - Modeling possibility
                
                **Find sangha:**
                - Local meditation center
                - Online communities
                - Dharma friends
                - Retreat connections
                
                ---
                
                ## Engaged Buddhism
                
                **Practice serving the world:**
                
                The Dharma isn't just personal—it's social.
                
                **Areas:**
                - Environmental action
                - Social justice
                - Prison dharma
                - Hospice work
                - Mental health support
                - Conflict resolution
                
                **Teachers:**
                - Thich Nhat Hanh (peace activism)
                - Bernie Glassman (street retreats, social action)
                - Joanna Macy (environmental grief work)
                
                **The insight:** Personal awakening and collective healing are connected.
                
                ---
                
                ## Mindful Work
                
                **Right Livelihood:**
                
                Work that doesn't cause harm:
                - No weapons
                - No intoxicants
                - No exploitation
                - No deception
                
                **Bringing practice to work:**
                - Pausing before responding
                - Listening fully
                - Acting with integrity
                - Not letting ego run meetings
                - Service orientation
                
                **Question:** Does your work help or harm? If it harms, is transition possible?
                
                ---
                
                ## Mindful Relationships
                
                **Practice with others:**
                
                - Listen without planning response
                - Speak truthfully and kindly
                - Notice reactive patterns
                - See others' suffering
                - Practice forgiveness
                - Set boundaries mindfully
                
                **Difficult relationships as practice:**
                - The person who triggers you is your teacher
                - Relationships reveal where you're stuck
                - Metta for difficult people
                
                ---
                
                ## Daily Integration
                
                **Weaving practice through the day:**
                
                **Morning:**
                - Sit before the day begins
                - Set intention
                - Recollections or vows
                
                **Throughout:**
                - Awareness bells (phone alarm, etc.)
                - Mindful transitions
                - Three breaths before speaking
                - "Is this necessary?" before acting
                
                **Evening:**
                - Review the day
                - What was skillful?
                - What could improve?
                - Metta before sleep
                
                ---
                
                ## Study and Practice
                
                **Balance both:**
                
                **Study without practice:**
                - Becomes intellectual game
                - Misses embodied wisdom
                - Can inflate ego
                
                **Practice without study:**
                - Can miss key insights
                - Might reinvent wheel
                - Limited by personal experience
                
                **Recommended texts:**
                - Dhammapada (Buddha's sayings)
                - Satipatthana Sutta (mindfulness discourse)
                - Heart Sutra (Mahayana emptiness)
                - Modern teachers' books
                
                ---
                
                ## We All the Same
                
                Every tradition says: enlightenment isn't escape—it's engagement.
                
                - **Christianity:** Love your neighbor
                - **Judaism:** Tikkun olam (repair the world)
                - **Islam:** Service to humanity
                - **Hinduism:** Karma yoga (action as offering)
                
                Awakening naturally leads to service. If it doesn't, something's incomplete.
                
                ---
                
                ## The Endless Path
                
                Enlightenment isn't a destination where practice stops. Awakened beings still practice:
                
                - Deepening
                - Integrating
                - Serving
                - Teaching
                - Learning
                
                The Buddha taught for 45 years after his awakening.
                
                **The path continues. The practice is the reward. ☸️**
                """,
                keyTakeaway: "Real practice is lived off the cushion—in relationships, work, and social engagement. Sangha supports the path. Study and practice together. The awakened life isn't escape but fuller engagement. The path never ends—practice continues forever.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Find one sangha connection (local or online)
                2. Choose one relationship to practice with mindfully
                3. Review: How is practice showing up in daily life?
                
                **Journaling prompt:**
                How has your practice changed your life? What still needs work? What's next?
                """
            )
        ]
    }
}

// MARK: - Models and Views

struct BodhiLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let content: String
    let keyTakeaway: String
    let practiceGuide: String
}

struct BodhiLessonView: View {
    let lesson: BodhiLesson
    let index: Int
    @State private var showPractice = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Lesson \(index)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(lesson.color)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(lesson.color.opacity(0.2))
                        .cornerRadius(8)
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(lesson.subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(lesson.color)
                        Text("KEY TAKEAWAY")
                            .font(.system(size: 12, weight: .black))
                            .foregroundColor(lesson.color)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding()
                .background(lesson.color.opacity(0.1))
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Button(action: { withAnimation { showPractice.toggle() } }) {
                        HStack {
                            Image(systemName: "figure.mind.and.body")
                                .foregroundColor(.green)
                            Text("PRACTICE GUIDE")
                                .font(.system(size: 12, weight: .black))
                                .foregroundColor(.green)
                            Spacer()
                            Image(systemName: showPractice ? "chevron.up" : "chevron.down")
                                .foregroundColor(.green)
                        }
                    }
                    
                    if showPractice {
                        Text(lesson.practiceGuide)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(4)
                    }
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BodhiEnlightenmentCourse()
    }
}
