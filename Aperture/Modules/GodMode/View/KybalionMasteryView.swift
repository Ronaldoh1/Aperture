// KybalionMasteryView.swift
// GodMode - The Kybalion Interactive Mastery System
// "The Principles of Truth are Seven; he who knows these, understandingly, possesses the Magic Key."

import SwiftUI

// MARK: - Kybalion Chapter
struct KybalionChapter: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let principle: String?
    let coreTeaching: String
    let explanation: String
    let practiceExercise: String
    let dailyApplication: String
    let keyQuote: String
}

// MARK: - Kybalion Data
struct KybalionData {
    static let chapters: [KybalionChapter] = [
        KybalionChapter(
            number: 1,
            title: "The Hermetic Philosophy",
            principle: nil,
            coreTeaching: "Hermes Trismegistus is the source of all esoteric wisdom. The Kybalion serves as a Master-Key to reconcile all occult teachings.",
            explanation: "Ancient Egypt gave birth to Hermetic philosophy through Hermes Trismegistus, the 'Thrice-Great.' This wisdom predates and underlies all major spiritual traditions. The Kybalion distills these teachings into practical principles.",
            practiceExercise: "Spend 10 minutes researching the influence of Hermeticism on one religion or philosophy you're familiar with. Note the connections.",
            dailyApplication: "When encountering any spiritual teaching today, ask: 'What universal principle does this reflect?'",
            keyQuote: "The lips of wisdom are closed, except to the ears of Understanding."
        ),
        KybalionChapter(
            number: 2,
            title: "The Seven Hermetic Principles",
            principle: nil,
            coreTeaching: "Seven principles form the foundation of all reality: Mentalism, Correspondence, Vibration, Polarity, Rhythm, Cause and Effect, and Gender.",
            explanation: "These seven principles are the keys to understanding how the universe operates. Master them, and you hold the tools to navigate any situation in life.",
            practiceExercise: "Write each principle on a card. Throughout the day, draw one randomly and find three examples of it in your experience.",
            dailyApplication: "Before any decision, ask: 'Which principle is most relevant here?'",
            keyQuote: "The Principles of Truth are Seven; he who knows these, understandingly, possesses the Magic Key before whose touch all the Doors of the Temple fly open."
        ),
        KybalionChapter(
            number: 3,
            title: "Mental Transmutation",
            principle: nil,
            coreTeaching: "The mind can be transmuted from state to state, degree to degree, condition to condition. This is true Hermetic Alchemy.",
            explanation: "Mental Transmutation is the practical application of Hermetic philosophy. By understanding mental states as vibrational patterns, you can deliberately shift your consciousness and experience.",
            practiceExercise: "Choose one negative mental state you experienced today. Identify its polar opposite. Consciously shift your focus toward that opposite for 5 minutes.",
            dailyApplication: "When you notice an unwanted mental state, say: 'I am the Master of this state. I choose to transmute it.'",
            keyQuote: "Mind (as well as metals and elements) may be transmuted, from state to state; degree to degree; condition to condition; pole to pole; vibration to vibration. True Hermetic Transmutation is a Mental Art."
        ),
        KybalionChapter(
            number: 4,
            title: "The All",
            principle: "MENTALISM",
            coreTeaching: "THE ALL is Infinite Living Mind—unknowable, eternal Spirit. The Universe is a Mental Creation held in the Mind of THE ALL.",
            explanation: "Everything that exists is a thought within an Infinite Mind. You, the world, all experience—all are mental phenomena within this ultimate consciousness.",
            practiceExercise: "Sit in silence for 10 minutes. Contemplate: 'If I am a thought in the mind of THE ALL, what does that make my thoughts?'",
            dailyApplication: "Treat every experience as if it were placed there specifically for your growth by an infinitely wise Mind.",
            keyQuote: "THE ALL is MIND; The Universe is Mental."
        ),
        KybalionChapter(
            number: 5,
            title: "The Mental Universe",
            principle: "MENTALISM",
            coreTeaching: "The Universe is Mental—held in the Mind of THE ALL. Understanding this transforms your relationship with reality.",
            explanation: "If the universe is mental, then your mind participates in the same creative process as THE ALL. Your thoughts are not separate from reality—they are reality in formation.",
            practiceExercise: "Choose a small intention. Hold it in your mind with the conviction that you are using the same creative power as THE ALL, just at a smaller scale.",
            dailyApplication: "Treat your imagination as the workshop where reality is assembled.",
            keyQuote: "The Universe is Mental—held in the Mind of THE ALL."
        ),
        KybalionChapter(
            number: 6,
            title: "The Divine Paradox",
            principle: nil,
            coreTeaching: "From the Absolute perspective, the Universe is illusion. From the Relative perspective, it is real. Both are true. Live accordingly.",
            explanation: "The wise understand that ultimate reality transcends the manifest world, yet they engage fully with the relative world. They are 'in the world but not of it.'",
            practiceExercise: "When something troubles you, practice shifting between perspectives: 'From the Absolute, this doesn't exist. From the Relative, how shall I respond skillfully?'",
            dailyApplication: "Hold both the vastness of your true nature and the practicality of your daily responsibilities.",
            keyQuote: "The Universe IS NOT, still IT IS. The half-wise, recognizing the comparative unreality of the Universe, imagine that they may defy its Laws—such are vain and presumptuous fools."
        ),
        KybalionChapter(
            number: 7,
            title: "The All in All",
            principle: nil,
            coreTeaching: "THE ALL is in all things, and all things are in THE ALL. Divine presence permeates everything.",
            explanation: "Nothing exists outside THE ALL. Every atom, every thought, every being is an expression of the Infinite. This is divine immanence—God is not separate from creation.",
            practiceExercise: "Look at an ordinary object. Contemplate how it contains and is contained by THE ALL. Extend this contemplation to yourself.",
            dailyApplication: "Treat every person, creature, and object as a face of THE ALL.",
            keyQuote: "While All is in THE ALL, it is equally true that THE ALL is in All."
        ),
        KybalionChapter(
            number: 8,
            title: "Planes of Correspondence",
            principle: "CORRESPONDENCE",
            coreTeaching: "As above, so below; as below, so above. The same patterns repeat across all planes of existence.",
            explanation: "The physical, mental, and spiritual planes mirror each other. Understanding one gives insight into the others. Your inner state reflects in your outer world.",
            practiceExercise: "Identify a pattern in your external life. Look for its correspondence in your mental/emotional life. What does this reveal?",
            dailyApplication: "When you want to change your outer world, first change the corresponding pattern within.",
            keyQuote: "As above, so below; as below, so above."
        ),
        KybalionChapter(
            number: 9,
            title: "Vibration",
            principle: "VIBRATION",
            coreTeaching: "Nothing rests; everything moves; everything vibrates. The difference between matter, energy, and spirit is vibration rate.",
            explanation: "All things are in motion. What appears solid is actually vibrating energy. Thoughts, emotions, and spirit all have their vibrational signatures.",
            practiceExercise: "Tune into the 'vibration' of your current emotional state. Consciously raise it by thinking of something that evokes gratitude or love. Notice the shift.",
            dailyApplication: "Before important interactions, consciously raise your vibration through breath, thought, or movement.",
            keyQuote: "Nothing rests; everything moves; everything vibrates."
        ),
        KybalionChapter(
            number: 10,
            title: "Polarity",
            principle: "POLARITY",
            coreTeaching: "Everything has poles; everything has its pair of opposites. Opposites are identical in nature, different only in degree.",
            explanation: "Hot and cold are the same thing—temperature—at different degrees. Love and hate are the same thing—emotion—at different poles. This understanding enables transmutation.",
            practiceExercise: "Take a quality you dislike in yourself. Find its polar opposite, which is also within you. Consciously cultivate movement toward that pole.",
            dailyApplication: "When facing negative emotions, remember they are just the 'cold' end of a spectrum you can move along.",
            keyQuote: "Everything is Dual; everything has poles; everything has its pair of opposites; like and unlike are the same; opposites are identical in nature, but different in degree."
        ),
        KybalionChapter(
            number: 11,
            title: "Rhythm",
            principle: "RHYTHM",
            coreTeaching: "Everything flows, out and in; everything has its tides. The pendulum swing manifests in everything.",
            explanation: "Life moves in cycles. After expansion comes contraction. After highs come lows. The master learns to use these rhythms rather than being used by them.",
            practiceExercise: "Observe your energy throughout the day. Note the natural rhythm of highs and lows. Plan important activities during your natural high points.",
            dailyApplication: "During low points, remind yourself: 'This is just the pendulum. It will swing back.'",
            keyQuote: "Everything flows, out and in; everything has its tides; all things rise and fall; the pendulum-swing manifests in everything."
        ),
        KybalionChapter(
            number: 12,
            title: "Cause and Effect",
            principle: "CAUSE AND EFFECT",
            coreTeaching: "Every cause has its effect; every effect has its cause. Nothing escapes the Law. The Master becomes a Cause rather than an Effect.",
            explanation: "Most people are pawns, moved by external causes. The Master moves on the higher plane, becoming a cause rather than being merely affected. Will, intention, and consciousness raise you above mechanical causation.",
            practiceExercise: "Identify one area where you feel like a victim of circumstance. Ask: 'How can I become a cause in this situation rather than an effect?'",
            dailyApplication: "Before reacting to anything, pause and choose your response consciously. Become a cause.",
            keyQuote: "Every Cause has its Effect; every Effect has its Cause; everything happens according to Law; Chance is but a name for Law not recognized."
        ),
        KybalionChapter(
            number: 13,
            title: "Gender",
            principle: "GENDER",
            coreTeaching: "Gender is in everything; everything has its Masculine and Feminine aspects. Gender manifests on all planes.",
            explanation: "Gender is not just physical sex—it is the interplay of active (masculine) and receptive (feminine) forces in all creation. Both are needed for creation on any plane.",
            practiceExercise: "In your creative projects, identify the masculine (active, projective) and feminine (receptive, nurturing) phases. Are you balancing both?",
            dailyApplication: "Create through the balance of will (masculine) and imagination (feminine).",
            keyQuote: "Gender is in everything; everything has its Masculine and Feminine Principles; Gender manifests on all planes."
        ),
        KybalionChapter(
            number: 14,
            title: "Mental Gender",
            principle: "GENDER",
            coreTeaching: "The mind has masculine ('I') and feminine ('Me') aspects. The 'I' is will and direction; the 'Me' is the creative imagination.",
            explanation: "Your 'I' (the conscious will) directs your 'Me' (the subconscious creative faculty). Most people let their 'Me' run undirected. The Master uses 'I' to consciously guide 'Me.'",
            practiceExercise: "Identify a goal. Use your 'I' to direct your 'Me' to visualize this goal as already achieved. Feel the imagination (Me) respond to the will (I).",
            dailyApplication: "Throughout the day, practice saying 'I direct my mind to...' and notice the subconscious responding.",
            keyQuote: "The 'I' represents the Masculine Principle of Mental Gender—the 'Me' represents the Female Principle."
        ),
        KybalionChapter(
            number: 15,
            title: "Hermetic Axioms",
            principle: nil,
            coreTeaching: "Practical axioms for daily application of Hermetic wisdom. These are the tools for walking the path.",
            explanation: "The Kybalion concludes with actionable statements that condense the teachings into memorable guidelines for living.",
            practiceExercise: "Choose one axiom each day. Write it on a card. Refer to it throughout the day and apply it consciously.",
            dailyApplication: "The Master applies these axioms until they become second nature.",
            keyQuote: "To change your mood or mental state—change your vibration. To destroy an undesirable rate of mental vibration, concentrate upon the opposite pole."
        )
    ]
    
    static let axioms: [String] = [
        "To change your mood or mental state—change your vibration.",
        "To destroy an undesirable rate of mental vibration, concentrate upon the opposite pole.",
        "Mind (as well as metals) may be transmuted from state to state.",
        "The Master polarizes himself at the point at which he desires to rest.",
        "Will is superior to conscious reasoning in mastering the moods.",
        "The wise ones serve on the higher planes, but rule on the lower.",
        "The possession of Knowledge, unless accompanied by expression in Action, is like the hoarding of precious metals.",
        "To change the polarity of your mind, refuse to express the lower emotions.",
        "Remember that you are to USE the principles, not be USED by them.",
        "Nothing escapes the Principle of Cause and Effect, but you may rise to the higher plane.",
        "The majority of people are carried along on the pendulum of circumstance.",
        "The Masters, by Will, attain a degree of Poise and Mental Firmness."
    ]
}

// MARK: - Main View
struct KybalionMasteryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedChapter: KybalionChapter?
    @State private var showQuiz = false
    @State private var completedChapters: Set<Int> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a3a"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        headerSection
                        
                        // Progress
                        progressSection
                        
                        // Chapters List
                        chaptersSection
                        
                        // Axioms Section
                        axiomsSection
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("📜 The Kybalion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showQuiz = true }) {
                        Image(systemName: "brain.head.profile")
                            .foregroundStyle(Color(hex: "00BFFF"))
                    }
                }
            }
            .sheet(item: $selectedChapter) { chapter in
                ChapterDetailView(chapter: chapter, onComplete: {
                    completedChapters.insert(chapter.number)
                })
            }
            .sheet(isPresented: $showQuiz) {
                KybalionQuizView()
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("⚗️")
                .font(.system(size: 50))
            
            Text("The Kybalion")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("Hermetic Philosophy of Ancient Egypt and Greece")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
            
            Text("\"The lips of wisdom are closed, except to the ears of Understanding.\"")
                .font(.caption)
                .italic()
                .foregroundStyle(Color(hex: "FFD700").opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .padding(.vertical, 20)
    }
    
    private var progressSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Mastery Progress")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
                Spacer()
                Text("\(completedChapters.count)/15 Chapters")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "FFD700"))
            }
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "FFD700"), Color(hex: "FF6B00")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * CGFloat(completedChapters.count) / 15)
                }
            }
            .frame(height: 8)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private var chaptersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📚 15 CHAPTERS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
            
            ForEach(KybalionData.chapters) { chapter in
                ChapterRow(
                    chapter: chapter,
                    isCompleted: completedChapters.contains(chapter.number)
                ) {
                    selectedChapter = chapter
                }
            }
        }
    }
    
    private var axiomsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("💎 HERMETIC AXIOMS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
            
            VStack(spacing: 12) {
                ForEach(KybalionData.axioms.indices, id: \.self) { index in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "FFD700"))
                            .frame(width: 20)
                        
                        Text(KybalionData.axioms[index])
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.vertical, 8)
                    
                    if index < KybalionData.axioms.count - 1 {
                        Divider().background(Color.white.opacity(0.1))
                    }
                }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
}

// MARK: - Chapter Row
struct ChapterRow: View {
    let chapter: KybalionChapter
    let isCompleted: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Chapter Number
                ZStack {
                    Circle()
                        .fill(isCompleted ? Color(hex: "27AE60") : Color.white.opacity(0.1))
                        .frame(width: 40, height: 40)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundStyle(.white)
                    } else {
                        Text("\(chapter.number)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(chapter.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    if let principle = chapter.principle {
                        Text(principle)
                            .font(.caption2)
                            .foregroundStyle(Color(hex: "FFD700"))
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Chapter Detail View
struct ChapterDetailView: View {
    let chapter: KybalionChapter
    let onComplete: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a3a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(spacing: 8) {
                            Text("Chapter \(chapter.number)")
                                .font(.caption)
                                .foregroundStyle(Color(hex: "FFD700"))
                            
                            Text(chapter.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            if let principle = chapter.principle {
                                Text("Principle: \(principle)")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(hex: "00BFFF"))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        
                        // Key Quote
                        VStack(spacing: 8) {
                            Text("💎 KEY QUOTE")
                                .font(.caption2)
                                .foregroundStyle(.white.opacity(0.5))
                            
                            Text("\"\(chapter.keyQuote)\"")
                                .font(.body)
                                .italic()
                                .foregroundStyle(Color(hex: "FFD700"))
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "FFD700").opacity(0.1))
                        .cornerRadius(12)
                        
                        // Core Teaching
                        sectionCard(title: "📖 CORE TEACHING", content: chapter.coreTeaching)
                        
                        // Explanation
                        sectionCard(title: "🔍 EXPLANATION", content: chapter.explanation)
                        
                        // Practice Exercise
                        sectionCard(title: "🎯 PRACTICE EXERCISE", content: chapter.practiceExercise, color: Color(hex: "27AE60"))
                        
                        // Daily Application
                        sectionCard(title: "☀️ DAILY APPLICATION", content: chapter.dailyApplication, color: Color(hex: "F39C12"))
                        
                        // Complete Button
                        Button(action: {
                            onComplete()
                            dismiss()
                        }) {
                            Text("✅ Mark as Complete")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "27AE60"))
                                .cornerRadius(12)
                        }
                        .padding(.top, 20)
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    private func sectionCard(title: String, content: String, color: Color = .white) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(color.opacity(0.8))
            
            Text(content)
                .font(.body)
                .foregroundStyle(.white.opacity(0.9))
                .lineSpacing(4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Quiz View
struct KybalionQuizView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: Int?
    
    let questions: [(question: String, answers: [String], correct: Int)] = [
        ("What is the First Hermetic Principle?", ["Vibration", "Mentalism", "Polarity", "Rhythm"], 1),
        ("'As above, so below' refers to which principle?", ["Mentalism", "Gender", "Correspondence", "Cause and Effect"], 2),
        ("According to the Kybalion, what is THE ALL?", ["The Universe", "Infinite Living Mind", "Energy", "Matter"], 1),
        ("What can be transmuted from pole to pole?", ["Matter only", "Energy only", "Mental states", "Physical objects"], 2),
        ("The pendulum swing manifests in which principle?", ["Polarity", "Vibration", "Rhythm", "Gender"], 2),
        ("What distinguishes the Master from the masses?", ["Knowledge alone", "Being a Cause not Effect", "Physical strength", "Age"], 1),
        ("The 'I' and 'Me' relate to which principle?", ["Correspondence", "Mental Gender", "Polarity", "Vibration"], 1),
        ("What is true Hermetic Transmutation?", ["Physical alchemy", "A Mental Art", "Chemical change", "Magic spells"], 1),
        ("Hot and cold are examples of which principle?", ["Rhythm", "Vibration", "Polarity", "Mentalism"], 2),
        ("The Kybalion teaches that the Universe is:", ["Physical", "Mental", "Spiritual only", "Non-existent"], 1)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "0a0a1a").ignoresSafeArea()
                
                if showResult {
                    resultView
                } else {
                    questionView
                }
            }
            .navigationTitle("🧠 Kybalion Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    private var questionView: some View {
        VStack(spacing: 24) {
            // Progress
            Text("Question \(currentQuestion + 1) of \(questions.count)")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
            
            // Question
            Text(questions[currentQuestion].question)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
            
            // Answers
            VStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { index in
                    Button(action: {
                        selectedAnswer = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            if index == questions[currentQuestion].correct {
                                score += 1
                            }
                            if currentQuestion < questions.count - 1 {
                                currentQuestion += 1
                                selectedAnswer = nil
                            } else {
                                showResult = true
                            }
                        }
                    }) {
                        Text(questions[currentQuestion].answers[index])
                            .font(.body)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                selectedAnswer == index
                                    ? (index == questions[currentQuestion].correct ? Color.green : Color.red)
                                    : Color.white.opacity(0.1)
                            )
                            .cornerRadius(12)
                    }
                    .disabled(selectedAnswer != nil)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding(.top, 40)
    }
    
    private var resultView: some View {
        VStack(spacing: 24) {
            Text(score >= 7 ? "🏆" : score >= 5 ? "👍" : "📚")
                .font(.system(size: 60))
            
            Text("Quiz Complete!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("\(score)/\(questions.count)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "FFD700"))
            
            Text(score >= 7 ? "Excellent! You understand the Hermetic principles well." :
                 score >= 5 ? "Good progress! Review the chapters for deeper mastery." :
                 "Keep studying! The Kybalion's wisdom awaits.")
                .font(.body)
                .foregroundStyle(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Done") { dismiss() }
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "FFD700"))
                .cornerRadius(12)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    KybalionMasteryView()
}
