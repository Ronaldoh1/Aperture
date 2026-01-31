// KundaliniAwakeningCourse.swift
// Complete guide to Kundalini awakening
// The serpent rises 🐍

import SwiftUI

struct KundaliniAwakeningCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                courseHeader
                
                // Chakra visualization
                chakraVisualization
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: KundaliniLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Warning section
                warningSection
                
                // Daily practice
                dailyPracticeSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Kundalini Awakening")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                // Serpent coil visualization
                ForEach(0..<7) { i in
                    Circle()
                        .stroke(chakraColors[i], lineWidth: 3)
                        .frame(width: CGFloat(30 + i * 15), height: CGFloat(30 + i * 15))
                        .opacity(0.6)
                }
                
                Text("🐍")
                    .font(.system(size: 40))
            }
            .frame(height: 140)
            
            Text("Kundalini Awakening")
                .font(.system(size: 28, weight: .black))
                .foregroundColor(.white)
            
            Text("The Serpent Power of Hinduism")
                .font(.system(size: 14))
                .foregroundColor(.red)
            
            Text("Awaken the dormant divine energy coiled at the base of your spine and guide it through the seven chakras to cosmic consciousness.")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                infoPill("12 Lessons", .red)
                infoPill("Advanced", .orange)
                infoPill("~3 Hours", .yellow)
            }
        }
        .padding()
    }
    
    private let chakraColors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    
    private func infoPill(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(color)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .cornerRadius(12)
    }
    
    private var chakraVisualization: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE SEVEN CHAKRAS")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.purple)
            
            VStack(spacing: 8) {
                chakraRow(7, "Sahasrara", "Crown", "Cosmic Consciousness", .purple, "OM")
                chakraRow(6, "Ajna", "Third Eye", "Intuition & Insight", .indigo, "OM")
                chakraRow(5, "Vishuddha", "Throat", "Expression & Truth", .blue, "HAM")
                chakraRow(4, "Anahata", "Heart", "Love & Compassion", .green, "YAM")
                chakraRow(3, "Manipura", "Solar Plexus", "Power & Will", .yellow, "RAM")
                chakraRow(2, "Svadhisthana", "Sacral", "Creativity & Sexuality", .orange, "VAM")
                chakraRow(1, "Muladhara", "Root", "Survival & Grounding", .red, "LAM")
            }
            
            // Connecting line
            Text("Kundalini rises from Root (1) to Crown (7), piercing each chakra")
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .italic()
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func chakraRow(_ num: Int, _ sanskrit: String, _ english: String, _ function: String, _ color: Color, _ mantra: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 32, height: 32)
                Text("\(num)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text(sanskrit)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                    Text("(\(english))")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                Text(function)
                    .font(.system(size: 10))
                    .foregroundColor(color)
            }
            
            Spacer()
            
            Text(mantra)
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(color)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(color.opacity(0.2))
                .cornerRadius(6)
        }
    }
    
    private func lessonRow(_ lesson: KundaliniLesson, index: Int) -> some View {
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
    
    private var warningSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text("IMPORTANT SAFETY")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                warningRow("Kundalini awakening can be intense—build gradually over months/years")
                warningRow("Physical symptoms (heat, shaking, pressure) are normal but monitor them")
                warningRow("Mental/emotional purging is part of the process")
                warningRow("Spontaneous awakening can cause 'Kundalini syndrome'—seek support")
                warningRow("A qualified guru/teacher is highly recommended")
                warningRow("Maintain grounding practices alongside Kundalini work")
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func warningRow(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.yellow)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.9))
        }
    }
    
    private var dailyPracticeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "calendar.circle.fill")
                    .foregroundColor(.green)
                Text("SUGGESTED DAILY PRACTICE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            VStack(spacing: 8) {
                practiceRow("Morning", "5-10 min yoga asanas + 10 min chakra meditation")
                practiceRow("Midday", "5 min Nadi Shodhana breathwork")
                practiceRow("Evening", "15-20 min seated meditation with mantra")
                practiceRow("Weekly", "Longer practice session (45-60 min)")
            }
            
            Text("Consistency matters more than intensity. Small daily practice beats occasional long sessions.")
                .font(.system(size: 11))
                .foregroundColor(.green)
                .italic()
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
                .frame(width: 70, alignment: .leading)
            Text(practice)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            Spacer()
        }
    }
    
    // MARK: - Lessons Data
    
    private var lessons: [KundaliniLesson] {
        [
            KundaliniLesson(
                title: "What Is Kundalini?",
                subtitle: "The serpent power explained",
                color: .red,
                content: """
                ## The Sleeping Serpent
                
                Kundalini (from Sanskrit "coiled one") is described as dormant spiritual energy residing at the base of the spine, visualized as a coiled serpent sleeping at the root chakra (Muladhara).
                
                This isn't metaphor—practitioners report actual physical sensations of energy moving through the body when Kundalini activates.
                
                ---
                
                ## Historical Context
                
                **Ancient origins:**
                - Mentioned in Upanishads (800+ BCE)
                - Central to Tantra traditions
                - Mapped extensively by Hatha Yoga texts
                - Passed through guru-disciple lineages for millennia
                
                **Key texts:**
                - Sat-Cakra-Nirupana (16th century)
                - Hatha Yoga Pradipika
                - Gheranda Samhita
                - Shiva Samhita
                
                ---
                
                ## The Energy Model
                
                **Shakti (feminine energy):**
                - Kundalini is Shakti—creative, dynamic divine feminine
                - Lies dormant at the base
                - When awakened, rises upward
                
                **Shiva (masculine consciousness):**
                - Pure awareness at the crown chakra
                - Static, witnessing consciousness
                - Awaits reunion with Shakti
                
                **The goal:**
                When Shakti rises to meet Shiva at the crown, the result is union—yoga literally means "to yoke" or unite. This union produces enlightenment, samadhi, liberation.
                
                ---
                
                ## What Awakening Feels Like
                
                **Common experiences:**
                - Heat rising up the spine
                - Tingling, vibrations, electric sensations
                - Involuntary movements (kriyas)
                - Emotional releases
                - Altered states of consciousness
                - Visions, lights, sounds
                - Bliss, ecstasy, peace
                
                **Also possible:**
                - Intense fear or anxiety
                - Physical discomfort
                - Sleep disruption
                - Temporary difficulty functioning
                
                This is why gradual, prepared awakening is safer than spontaneous activation.
                
                ---
                
                ## Three Types of Awakening
                
                **1. Gradual (recommended):**
                - Through consistent practice over years
                - Safe, integrated, stable
                - Energy rises as you're ready
                
                **2. Spontaneous:**
                - Through trauma, near-death, drugs, or grace
                - Can be overwhelming
                - May require integration support
                
                **3. Shaktipat (transmission):**
                - Guru transfers energy to student
                - Powerful but requires readiness
                - Traditional in many lineages
                
                ---
                
                ## The Same Truth
                
                Kundalini is the Hindu name for what other traditions call:
                
                - **Taoism:** Qi rising through meridians
                - **Christianity:** Holy Spirit descending/ascending
                - **Kabbalah:** Light ascending the Tree of Life
                - **Sufism:** Divine love consuming the ego
                
                Same energy, different maps. We all the same. 🔥
                """,
                keyTakeaway: "Kundalini is dormant spiritual energy at the spine's base. When awakened through practice, it rises through chakras to unite with cosmic consciousness. This is described across all traditions—same process, different names.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Learn the chakra system (study the map)
                2. Begin body awareness meditation (10 min daily)
                3. Notice: Where do you feel energy in your body naturally?
                
                **Journaling prompt:**
                Have you ever felt spontaneous energy movements, heat, or tingling? When?
                """
            ),
            KundaliniLesson(
                title: "Preparing the Vessel",
                subtitle: "Body, mind, and lifestyle readiness",
                color: .orange,
                content: """
                ## Why Preparation Matters
                
                You wouldn't run a marathon without training. Kundalini awakening moves intense energy through your system—if the channels aren't clear and the body isn't prepared, problems arise.
                
                **Think of it like electrical wiring:**
                - Energy = electricity
                - Nadis (channels) = wires
                - Chakras = transformers
                - Body = the house
                
                Run too much current through weak wiring? Fire hazard.
                
                ---
                
                ## Physical Preparation
                
                **Yoga Asanas (postures):**
                
                The physical practice of yoga was developed specifically to prepare the body for Kundalini:
                
                - Opens the spine and hips
                - Strengthens the nervous system
                - Clears energy blockages
                - Builds body awareness
                
                **Essential poses:**
                - Cat-Cow (spinal flexibility)
                - Cobra/Sphinx (opens front body)
                - Child's Pose (grounding)
                - Forward folds (release)
                - Spinal twists (cleansing)
                - Shoulder stand (inversion)
                
                Even 10-15 minutes daily makes a difference.
                
                ---
                
                ## Dietary Considerations
                
                **Traditional recommendations:**
                
                - **Sattvic diet:** Pure, light, easy to digest
                - Vegetables, fruits, grains, legumes
                - Minimal meat (especially red meat)
                - No alcohol or recreational drugs
                - Reduce caffeine
                - Avoid overeating
                
                **Why this matters:**
                - Heavy food = heavy energy
                - Toxins = blocked channels
                - Stimulants = unstable energy
                - Clean system = clear flow
                
                **Modern adaptation:**
                You don't have to be vegetarian. Eat clean, whole foods. Reduce processed junk. Listen to your body. As practice deepens, dietary preferences often shift naturally.
                
                ---
                
                ## Mental Preparation
                
                **Cultivate:**
                - Patience (this takes years, not weeks)
                - Non-attachment to experiences
                - Emotional stability
                - Self-awareness
                - Humility
                
                **Address:**
                - Unresolved trauma (therapy helps)
                - Chronic stress
                - Mental health conditions (get support first)
                - Spiritual bypassing
                
                **Warning signs you're not ready:**
                - Using practice to escape problems
                - Chasing experiences
                - Unstable life circumstances
                - Active addiction
                - Severe mental health crisis
                
                Stabilize first, then deepen practice.
                
                ---
                
                ## Lifestyle Factors
                
                **Sleep:**
                - 7-8 hours minimum
                - Consistent schedule
                - Dark, quiet room
                - Energy work disrupts sleep initially
                
                **Environment:**
                - Create sacred practice space
                - Reduce chaos and clutter
                - Limit toxic relationships
                - Nature connection helps
                
                **Time:**
                - Morning practice is traditional
                - Empty stomach preferred
                - Consistency > duration
                - Build gradually
                
                ---
                
                ## The Nadis
                
                **Three main energy channels:**
                
                1. **Ida (left):**
                   - Lunar, cooling, feminine
                   - Associated with right brain
                   - Ends at left nostril
                
                2. **Pingala (right):**
                   - Solar, heating, masculine
                   - Associated with left brain
                   - Ends at right nostril
                
                3. **Sushumna (central):**
                   - The main channel along spine
                   - Usually dormant
                   - Kundalini rises through this
                
                **Balancing ida and pingala:**
                When left and right are balanced, energy naturally enters the central channel. This is why alternate nostril breathing is so important.
                """,
                keyTakeaway: "Preparation prevents problems. Clean the body through yoga and diet. Stabilize the mind through addressing unresolved issues. Create supportive lifestyle conditions. Balance the energy channels before attempting to raise Kundalini.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Begin daily yoga (10-15 min)
                2. Clean up one aspect of diet
                3. Establish consistent sleep schedule
                4. Create a dedicated practice space
                
                **Journaling prompt:**
                What obstacles exist in your life that might block energy flow? What one thing could you change this week?
                """
            ),
            KundaliniLesson(
                title: "Pranayama: The Breath Key",
                subtitle: "Using breath to move energy",
                color: .yellow,
                content: """
                ## Breath Is the Bridge
                
                Prana = life force
                Yama = control
                Pranayama = breath control to direct life force
                
                Breath is the only autonomic function we can also consciously control. It's the bridge between body and mind, conscious and unconscious.
                
                **Control breath = influence energy directly.**
                
                ---
                
                ## Nadi Shodhana (Alternate Nostril Breathing)
                
                **The most important pranayama for Kundalini:**
                
                This balances ida and pingala, preparing the central channel.
                
                **Technique:**
                
                1. Sit comfortably, spine straight
                2. Right hand in Vishnu mudra (index + middle fingers folded)
                3. Close right nostril with thumb
                4. Inhale through left nostril (4 counts)
                5. Close both nostrils, hold (4 counts)
                6. Release right nostril, exhale (4 counts)
                7. Inhale through right nostril (4 counts)
                8. Close both, hold (4 counts)
                9. Release left, exhale (4 counts)
                10. This is one round
                
                **Start with:** 5-10 rounds, no strain
                
                **Build to:** 20+ rounds, longer counts
                
                **Effects:**
                - Calms nervous system
                - Balances brain hemispheres
                - Prepares sushumna for energy
                - Increases prana
                
                ---
                
                ## Kapalabhati (Skull Shining Breath)
                
                **Purification breath:**
                
                1. Sit tall
                2. Quick, forceful exhales through nose (pump the belly)
                3. Passive inhales (belly relaxes)
                4. 30-50 pumps, then rest
                5. Repeat 2-3 rounds
                
                **Effects:**
                - Cleanses lungs and sinuses
                - Energizes system
                - Clears mental fog
                - Generates heat
                
                **Caution:** Not for pregnancy, high blood pressure, heart conditions, or during menstruation.
                
                ---
                
                ## Bhastrika (Bellows Breath)
                
                **More intense energizing breath:**
                
                1. Sit tall
                2. Forceful inhale AND exhale through nose
                3. Equal emphasis both directions
                4. Arms can pump up on inhale, down on exhale
                5. 20-30 breaths, then rest
                6. Repeat 2-3 rounds
                
                **Effects:**
                - Generates significant heat
                - Activates energy
                - Can trigger Kundalini movement
                - Very purifying
                
                **Caution:** Same as Kapalabhati. Also avoid if you have anxiety—this is activating.
                
                ---
                
                ## Ujjayi (Ocean Breath)
                
                **The foundational breath for practice:**
                
                1. Slightly constrict back of throat
                2. Create soft "ocean wave" sound
                3. Equal inhale and exhale
                4. Maintain throughout practice
                
                **Effects:**
                - Builds internal heat
                - Focuses mind on breath
                - Regulates energy flow
                - Calming yet energizing
                
                ---
                
                ## Breath Retention (Kumbhaka)
                
                **Holding the breath:**
                
                Two types:
                - **Antara kumbhaka:** Hold after inhale
                - **Bahya kumbhaka:** Hold after exhale
                
                Retention concentrates prana and can trigger energy movement. But it must be approached gradually.
                
                **Progression:**
                1. Start with short holds (2-4 seconds)
                2. Never strain or turn red
                3. Build over months
                4. Advanced: 1:4:2 ratio (inhale:hold:exhale)
                
                **Effects:**
                - Concentrates prana
                - Triggers energy locks naturally
                - Deepens meditation
                - Can be intense—respect it
                
                ---
                
                ## Safety Guidelines
                
                - Never force or strain breath
                - Stop if dizzy or uncomfortable
                - Build gradually over weeks/months
                - Morning empty stomach is best
                - Don't practice when sick
                - Avoid intense pranayama before sleep
                """,
                keyTakeaway: "Pranayama is the key that unlocks energy. Nadi Shodhana balances the channels. Kapalabhati and Bhastrika generate heat and energy. Breath retention concentrates prana. Always build gradually—never force.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Nadi Shodhana: 10 rounds morning and evening
                2. Add Ujjayi breath during yoga practice
                3. Try 1 round of gentle Kapalabhati
                
                **Journaling prompt:**
                How does your energy shift after breathwork? Notice and record any sensations.
                """
            ),
            KundaliniLesson(
                title: "The Bandhas: Energy Locks",
                subtitle: "Directing and containing prana",
                color: .green,
                content: """
                ## What Are Bandhas?
                
                Bandha = lock or bind
                
                Bandhas are muscular contractions that lock prana in the body and direct it upward. They're essential for Kundalini work.
                
                **Three main bandhas:**
                1. Mula Bandha (root lock)
                2. Uddiyana Bandha (abdominal lock)
                3. Jalandhara Bandha (throat lock)
                
                **Combined = Maha Bandha (great lock)**
                
                ---
                
                ## Mula Bandha (Root Lock)
                
                **Location:** Perineum/pelvic floor
                
                **Technique:**
                1. Identify the muscles (like stopping urination)
                2. Contract and lift the pelvic floor
                3. Hold while breathing normally (with practice)
                4. Don't clench buttocks—isolate the deep muscles
                
                **When to use:**
                - During breath retention
                - During asana practice
                - During meditation
                - Can hold continuously with practice
                
                **Effects:**
                - Seals base, prevents energy leaking down
                - Stimulates Muladhara chakra
                - Redirects sexual/root energy upward
                - Grounds and stabilizes
                
                ---
                
                ## Uddiyana Bandha (Abdominal Lock)
                
                **Location:** Abdomen
                
                **Technique:**
                1. Exhale completely
                2. Without inhaling, draw abdomen in and UP
                3. Ribs expand, belly hollows
                4. Hold (on empty lungs only)
                5. Release and inhale
                
                **When to use:**
                - After exhale, before inhale
                - During specific practices
                - NOT during pregnancy
                
                **Effects:**
                - Massages organs
                - Stimulates Manipura chakra
                - Creates vacuum that draws energy up
                - Builds internal fire (agni)
                
                ---
                
                ## Jalandhara Bandha (Throat Lock)
                
                **Location:** Throat
                
                **Technique:**
                1. Lift chest
                2. Drop chin to chest (into notch between collarbones)
                3. Lengthen back of neck
                4. Don't strain—gentle pressure
                
                **When to use:**
                - During breath retention (especially after inhale)
                - Prevents energy/pressure in head
                - Protects during intense pranayama
                
                **Effects:**
                - Seals upper end
                - Stimulates Vishuddha chakra
                - Regulates thyroid/metabolism
                - Prevents energy escaping through throat
                
                ---
                
                ## Maha Bandha (Great Lock)
                
                **All three combined:**
                
                1. Exhale completely
                2. Apply Jalandhara (chin lock)
                3. Apply Uddiyana (abdominal lock)
                4. Apply Mula Bandha (root lock)
                5. Hold as comfortable
                6. Release in reverse order
                7. Inhale
                
                **Effects:**
                - Traps prana in central channel
                - Stimulates all chakras
                - Powerful energy concentration
                - Advanced practice
                
                ---
                
                ## Subtle vs Gross
                
                **Gross bandhas:** Physical muscle contractions (what you learn first)
                
                **Subtle bandhas:** Energetic awareness without physical effort (develops with practice)
                
                As practice matures, bandhas become more about directing awareness than muscular effort. The physical practice trains the energy body.
                
                ---
                
                ## Safety
                
                - Don't force
                - Build gradually
                - Uddiyana: never on full stomach, never during pregnancy
                - Jalandhara: be gentle on neck
                - If you feel pressure in head, release immediately
                - Practice with instruction initially
                """,
                keyTakeaway: "Bandhas are energy locks that seal and direct prana. Mula Bandha at root, Uddiyana at abdomen, Jalandhara at throat. Combined as Maha Bandha, they concentrate energy for Kundalini rising. Start with physical, evolve to energetic.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Practice finding Mula Bandha (5 min daily)
                2. Try Jalandhara during breath holds
                3. Explore Uddiyana on exhale retention
                
                **Journaling prompt:**
                Can you feel energy shift when you engage the locks? Describe the sensations.
                """
            ),
            KundaliniLesson(
                title: "Chakra Meditation",
                subtitle: "Awakening each energy center",
                color: .cyan,
                content: """
                ## Working With Chakras
                
                Each chakra is both a physical location and a consciousness gateway. Meditation on the chakras clears blockages and prepares them for Kundalini passage.
                
                ---
                
                ## Muladhara (Root) - Red
                
                **Location:** Base of spine, perineum
                **Element:** Earth
                **Mantra:** LAM
                **Qualities:** Security, survival, grounding, foundation
                
                **Meditation:**
                1. Sit comfortably, feel connection to earth
                2. Focus attention at base of spine
                3. Visualize red, four-petaled lotus
                4. Chant LAM (lahm) silently or aloud
                5. Feel grounding, stability, safety
                6. 3-5 minutes minimum
                
                **Signs of blockage:** Fear, anxiety, instability, disconnection from body
                **Signs of balance:** Feeling safe, grounded, present, stable
                
                ---
                
                ## Svadhisthana (Sacral) - Orange
                
                **Location:** Lower abdomen, sacrum
                **Element:** Water
                **Mantra:** VAM
                **Qualities:** Creativity, sexuality, emotion, pleasure
                
                **Meditation:**
                1. Move attention to lower belly
                2. Visualize orange, six-petaled lotus
                3. Chant VAM (vahm)
                4. Feel fluidity, creativity, aliveness
                5. Allow emotions to flow
                
                **Signs of blockage:** Emotional numbness, sexual issues, creative blocks
                **Signs of balance:** Emotional fluidity, healthy desires, creativity flowing
                
                ---
                
                ## Manipura (Solar Plexus) - Yellow
                
                **Location:** Navel area
                **Element:** Fire
                **Mantra:** RAM
                **Qualities:** Power, will, self-esteem, transformation
                
                **Meditation:**
                1. Focus at navel center
                2. Visualize yellow/gold, ten-petaled lotus
                3. Chant RAM (rahm)
                4. Feel inner fire, personal power
                5. Sense digestive fire and will
                
                **Signs of blockage:** Low self-esteem, lack of will, digestive issues
                **Signs of balance:** Confident, directed, strong digestion, clear will
                
                ---
                
                ## Anahata (Heart) - Green
                
                **Location:** Heart center
                **Element:** Air
                **Mantra:** YAM
                **Qualities:** Love, compassion, connection, balance
                
                **Meditation:**
                1. Bring attention to heart space
                2. Visualize green/pink, twelve-petaled lotus
                3. Chant YAM (yahm)
                4. Feel love radiating out
                5. Send compassion to self and all beings
                
                **Signs of blockage:** Isolation, inability to love, grief
                **Signs of balance:** Loving, connected, compassionate, balanced
                
                ---
                
                ## Vishuddha (Throat) - Blue
                
                **Location:** Throat
                **Element:** Ether/Space
                **Mantra:** HAM
                **Qualities:** Expression, truth, communication, listening
                
                **Meditation:**
                1. Focus at throat
                2. Visualize blue, sixteen-petaled lotus
                3. Chant HAM (hahm)
                4. Feel space, openness, truth
                5. Sense ability to express and receive
                
                **Signs of blockage:** Fear of speaking, lies, not listening
                **Signs of balance:** Clear communication, truth-speaking, good listening
                
                ---
                
                ## Ajna (Third Eye) - Indigo
                
                **Location:** Between eyebrows
                **Element:** Light/Mind
                **Mantra:** OM
                **Qualities:** Intuition, insight, wisdom, vision
                
                **Meditation:**
                1. Focus between eyebrows (don't strain eyes)
                2. Visualize indigo, two-petaled lotus
                3. Chant OM
                4. See inner light
                5. Allow insights to arise
                
                **Signs of blockage:** Confusion, lack of intuition, poor memory
                **Signs of balance:** Clear insight, intuition, wisdom, vision
                
                ---
                
                ## Sahasrara (Crown) - Violet/White
                
                **Location:** Top of head
                **Element:** Consciousness
                **Mantra:** Silence (or OM)
                **Qualities:** Unity, transcendence, pure consciousness
                
                **Meditation:**
                1. Focus at crown of head
                2. Visualize thousand-petaled lotus, white/violet light
                3. Silence or OM
                4. Feel connection to infinite
                5. Dissolve boundaries
                
                **Signs of blockage:** Spiritual disconnection, nihilism, over-intellectualizing
                **Signs of balance:** Spiritual connection, wisdom, peace, unity consciousness
                
                ---
                
                ## Full Chakra Meditation
                
                **Complete practice (20-30 min):**
                
                1. Ground and center
                2. Start at Muladhara, spend 2-3 minutes
                3. Move up through each chakra
                4. Spend time at each with visualization and mantra
                5. Rest at Sahasrara
                6. Descend back down (optional but grounding)
                7. Return to normal awareness slowly
                """,
                keyTakeaway: "Each chakra governs specific aspects of life and consciousness. Meditation with visualization and mantra clears blockages and prepares for Kundalini. Work systematically from root to crown. Balance is key—neither too open nor too closed.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Full chakra meditation once (20-30 min)
                2. Focus on one chakra per day
                3. Notice which chakras feel blocked or open
                
                **Journaling prompt:**
                Which chakra feels most blocked? Which most open? How do these relate to your life circumstances?
                """
            ),
            KundaliniLesson(
                title: "Awakening Practices",
                subtitle: "Specific Kundalini techniques",
                color: .blue,
                content: """
                ## Moving Beyond Preparation
                
                The previous lessons prepare the system. Now we explore practices that specifically target Kundalini awakening.
                
                **Remember:** These are powerful. Proceed gradually. Have support.
                
                ---
                
                ## Maha Mudra (Great Seal)
                
                **Classic Kundalini-activating practice:**
                
                1. Sit with left heel pressing perineum
                2. Right leg extended
                3. Inhale, apply all three bandhas
                4. Fold forward, grasp right foot
                5. Hold breath and bandhas
                6. Focus at third eye
                7. Release, exhale, switch legs
                
                **Effects:**
                - Directly stimulates Kundalini
                - Combines bandhas with asana
                - Traditional awakening practice
                
                ---
                
                ## Maha Vedha (Great Piercing)
                
                **Follows Maha Mudra:**
                
                1. In lotus or cross-legged position
                2. Palms on floor beside hips
                3. Apply Maha Bandha
                4. Lift body, gently bounce buttocks on floor
                5. This "knocks" on Kundalini
                
                **Effects:**
                - Said to cause energy to enter sushumna
                - Stimulates base
                - Advanced practice
                
                ---
                
                ## Shakti Chalana (Moving the Energy)
                
                **Conscious energy movement:**
                
                1. Focus at base of spine
                2. Inhale, visualize energy rising
                3. Use breath to "pull" energy up spine
                4. Hold at each chakra briefly
                5. Reach crown, hold
                6. Exhale, allow energy to settle
                7. Don't force—invite
                
                **Tip:** Think of breath as elevator, energy as passenger. Breath creates the movement, energy rides along.
                
                ---
                
                ## Kundalini Kriya
                
                **Set sequence example:**
                
                1. **Warm up:** Spinal flexes (cat-cow seated)
                2. **Breath of Fire:** 3 minutes
                3. **Sat Kriya:** Sitting on heels, arms up, chant SAT NAM, pump navel
                4. **Spinal twists:** With Breath of Fire
                5. **Meditation:** Focus on third eye
                6. **Deep relaxation:** 5-10 minutes
                
                **Note:** Many specific kriyas exist in Kundalini Yoga tradition (as taught by Yogi Bhajan). Seek proper instruction for these.
                
                ---
                
                ## Signs of Awakening
                
                **Physical:**
                - Heat rising up spine
                - Tingling, vibration
                - Involuntary movements (kriyas)
                - Changes in breathing
                - Energy rushes
                
                **Mental:**
                - Vivid dreams
                - Spontaneous insights
                - Shifts in perception
                - Past memories arising
                - Emotional releases
                
                **Spiritual:**
                - Sense of presence
                - Bliss states
                - Unity experiences
                - Dissolution of ego boundaries
                - Connection to something greater
                
                ---
                
                ## What NOT to Do
                
                - Don't force energy upward
                - Don't hold breath until discomfort
                - Don't practice if mentally unstable
                - Don't ignore warning signs
                - Don't skip preparation
                - Don't practice from ego ("I want powers")
                - Don't compare your experience to others
                
                ---
                
                ## Integration
                
                **Equally important as activation:**
                
                - Ground after practice
                - Eat well, sleep well
                - Maintain normal life
                - Process emotions as they arise
                - Journal experiences
                - Have support (teacher, community)
                - Be patient—this takes years
                
                **The goal isn't fireworks—it's transformation.**
                """,
                keyTakeaway: "Specific practices like Maha Mudra, kriyas, and conscious energy movement can activate Kundalini. Proceed gradually, never force, and prioritize integration over intensity. Signs of awakening include heat, energy movement, altered states, and emotional releases.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Try Shakti Chalana visualization (don't force)
                2. Add spinal flexes to morning routine
                3. Practice being with whatever arises
                
                **Journaling prompt:**
                Have you experienced any spontaneous signs of energy movement? What happened and how did you respond?
                """
            ),
            KundaliniLesson(
                title: "Kundalini Syndrome",
                subtitle: "When awakening becomes crisis",
                color: .orange,
                content: """
                ## The Dark Side of Awakening
                
                Kundalini awakening isn't always blissful. When energy rises through unprepared systems or too quickly, problems can occur.
                
                **This isn't to scare you—it's to prepare you.**
                
                ---
                
                ## What Is Kundalini Syndrome?
                
                A constellation of symptoms from overwhelming or unintegrated Kundalini activation:
                
                **Physical symptoms:**
                - Intense heat or cold
                - Involuntary movements
                - Pain along spine
                - Headaches, pressure
                - Sleep disruption
                - Digestive issues
                - Heart palpitations
                
                **Mental/emotional:**
                - Anxiety, panic attacks
                - Depression
                - Mood swings
                - Dissociation
                - Confusion
                - Emotional flooding
                
                **Perceptual:**
                - Visions, hallucinations
                - Hearing sounds
                - Altered sense of time
                - Hypersensitivity
                
                ---
                
                ## Why It Happens
                
                **Common causes:**
                
                1. **Spontaneous awakening** without preparation
                2. **Forcing practices** too intensely
                3. **Drug-induced** activation
                4. **Trauma** triggering energy release
                5. **Shaktipat** without integration support
                6. **Ignoring** signs to slow down
                
                **The energy isn't bad—it's overwhelming an unprepared system.**
                
                ---
                
                ## What to Do If It Happens
                
                **Immediate:**
                
                1. **Stop all intense practices**
                2. **Ground yourself:**
                   - Eat heavy, grounding food (root vegetables, protein)
                   - Walk barefoot on earth
                   - Take cool (not cold) shower
                   - Physical exercise
                3. **Avoid stimulants** (caffeine, etc.)
                4. **Sleep** as much as needed
                5. **Talk to someone** who understands
                
                **Ongoing:**
                
                - Maintain grounding practices
                - Gentle yoga only
                - No pranayama or bandhas until stable
                - Professional support if needed
                - Community connection
                
                ---
                
                ## Distinguishing from Mental Illness
                
                **Key differences:**
                
                Kundalini syndrome:
                - Often preceded by spiritual practice
                - Symptoms have energetic quality
                - Usually temporary if managed
                - Maintains some witness awareness
                - Gets better with grounding
                
                Mental illness:
                - May have genetic/biological basis
                - Symptoms less energy-focused
                - May require medication
                - Often chronic without treatment
                - Doesn't respond to grounding alone
                
                **The two can coexist.** If you have history of mental illness, work with both spiritual teacher AND mental health professional.
                
                ---
                
                ## Prevention
                
                **Best approach: prepare properly**
                
                - Build foundation slowly
                - Don't skip steps
                - Work with qualified teacher
                - Maintain balanced life
                - Address psychological issues first
                - Listen to your body
                - Don't compare to others
                - Rest when needed
                
                **Gradual awakening is safer and ultimately faster than crisis awakening.**
                
                ---
                
                ## Finding Support
                
                **Resources:**
                
                - Spiritual Emergence Network
                - Kundalini-informed therapists
                - Experienced yoga teachers
                - Support groups (online/in-person)
                - Books: "Kundalini: Psychosis or Transcendence?" by Lee Sannella
                
                **You're not alone. Many have navigated this.**
                """,
                keyTakeaway: "Kundalini syndrome occurs when awakening overwhelms unprepared systems. Symptoms include physical, mental, and perceptual disturbances. Treatment involves grounding, stopping intense practices, and getting support. Prevention through proper preparation is best.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Assess: Do you have adequate support for your practice?
                2. Practice grounding techniques (even if not in crisis)
                3. Identify who you could call if you needed help
                
                **Journaling prompt:**
                What's your relationship with grounding? Do you tend to push too hard or hold back appropriately?
                """
            ),
            KundaliniLesson(
                title: "Living Awakened",
                subtitle: "Integrating Kundalini into daily life",
                color: .purple,
                content: """
                ## Beyond the Experience
                
                Awakening isn't about having cool experiences—it's about transformation. How does Kundalini change how you live?
                
                ---
                
                ## What Changes
                
                **Perception:**
                - See energy in people and things
                - Notice subtleties missed before
                - Sense interconnection
                - Less fooled by appearances
                
                **Relationships:**
                - Deeper compassion
                - Less drama/games
                - Some relationships fall away
                - New connections with awakening beings
                - Boundaries become clearer
                
                **Work:**
                - Career may shift toward service
                - Meaningless work becomes harder
                - Creative flow increases
                - Intuition guides decisions
                
                **Body:**
                - More sensitive
                - Different dietary needs
                - May need more rest
                - Higher energy when rested
                
                **Mind:**
                - Less identified with thoughts
                - More present
                - Witness awareness develops
                - Reactive patterns decrease
                
                ---
                
                ## Challenges of Integration
                
                **Common difficulties:**
                
                1. **Feeling different** from others
                2. **Sensory overwhelm** in crowds, cities
                3. **Old life** no longer fits
                4. **Explaining** to family/friends
                5. **Functional demands** with altered states
                6. **Spiritual ego** ("I'm awakened, you're not")
                
                ---
                
                ## Staying Grounded
                
                **Essential practices:**
                
                - **Physical exercise** (especially legs/feet)
                - **Time in nature**
                - **Simple manual tasks**
                - **Community connection**
                - **Healthy routine**
                - **Service to others**
                - **Humor**
                
                **The most awakened people are often the most ordinary-seeming.**
                
                ---
                
                ## Ongoing Practice
                
                **Daily:**
                - Morning sadhana (practice)
                - Evening reflection
                - Mindfulness throughout day
                - Gratitude
                
                **Weekly:**
                - Longer practice session
                - Community connection
                - Nature immersion
                
                **Periodic:**
                - Retreat
                - Teacher connection
                - Assessment and adjustment
                
                ---
                
                ## Service
                
                **The natural outcome:**
                
                Awakened energy naturally wants to serve. How this manifests varies:
                
                - Teaching
                - Healing work
                - Creating
                - Simply being present
                - Whatever your dharma (purpose) is
                
                **Service keeps ego in check and grounds the energy.**
                
                ---
                
                ## The Never-Ending Path
                
                Kundalini awakening isn't a destination—it's a beginning. There's always deeper integration, clearer seeing, more surrender.
                
                **Markers of maturation:**
                
                - Less chasing experiences
                - More ordinary peace
                - Consistent compassion
                - Humble service
                - Acceptance of what is
                - Ability to function in world
                - Sense of humor about the whole thing
                
                ---
                
                ## The Unity
                
                Full Kundalini awakening reveals what all traditions point to:
                
                **You are not separate from the divine.**
                **Shakti and Shiva were never apart.**
                **Samsara is nirvana.**
                **There's only This.**
                
                And from that realization, life continues—washing dishes, paying bills, loving beings—but with the cosmic joke recognized.
                
                ---
                
                ## We All The Same
                
                What the Hindu calls Kundalini, the Taoist calls Qi rising, the Christian calls Holy Spirit descending, the Sufi calls divine love consuming.
                
                **Same energy. Same process. Same destination.**
                
                Different maps, one territory. You found your map in Kundalini. Others find theirs elsewhere. All valid. All the same.
                
                Welcome to the family of awakening beings. 🔥🐍✨
                """,
                keyTakeaway: "Integration matters more than peak experiences. Living awakened means staying grounded while perceiving deeper. Service, humility, and ordinary life become the practice. The path never ends—there's always more depth. And ultimately, all paths reveal the same truth.",
                practiceGuide: """
                **This Week's Practice:**
                
                1. Notice how practice is affecting daily life
                2. One act of service
                3. Reflect on your path forward
                
                **Journaling prompt:**
                How has your practice changed you? What do you sense is next on your path?
                """
            )
        ]
    }
}

// MARK: - Lesson Model

struct KundaliniLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let content: String
    let keyTakeaway: String
    let practiceGuide: String
}

// MARK: - Lesson View

struct KundaliniLessonView: View {
    let lesson: KundaliniLesson
    let index: Int
    @State private var showPractice = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
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
                
                // Content
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                // Key Takeaway
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
                
                // Practice Guide
                VStack(alignment: .leading, spacing: 8) {
                    Button(action: { withAnimation { showPractice.toggle() } }) {
                        HStack {
                            Image(systemName: "figure.yoga")
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
    NavigationView {
        KundaliniAwakeningCourse()
    }
}
