// DivineInspirationDecodedCourse.swift
// DIVINE INSPIRATION DECODED
// "Who Gave You the Bible? And What Is Inspiration Really?"
// ☀️ SunFlow: Reignited
//
// "The Bible didn't fall from the sky.
//  Humans wrote it. A committee selected it.
//  An institution promoted it.
//  And the experience it tries to describe
//  exists in EVERY culture on Earth.
//  The question isn't 'which book is right?'
//  The question is 'what experience are they
//  ALL trying to describe?'"
//
// This course traces:
// 1. How the Bible was actually assembled (who decided, when, why)
// 2. The authority problem (who says it's true, and why you should care)
// 3. What "divine inspiration" actually means (not dictation — experience)
// 4. Cosmic consciousness across ALL traditions (same experience, different language)
// 5. Why your cultural programming limits how you express awakening
// 6. The universal truth underneath all the labels
//
// Sources: Alan Watts lectures, Council of Nicaea history,
// Synod of Jamnia (c. 100 AD), Synod of Rome (382 AD),
// Upanishads, Diamond Sutra, Dao De Jing, Kabir

import SwiftUI

struct DivineInspirationDecodedCourse {
    
    static let courseTitle = "Divine Inspiration Decoded"
    static let courseSubtitle = "Who Gave You the Bible — and What Is Inspiration Really?"
    static let courseEmoji = "📜"
    static let accentColor = Color(red: 0.85, green: 0.75, blue: 0.45) // Parchment gold
    
    static let lessons: [DivineInspirationLesson] = [
        
        // ═══════════════════════════════════════════════════
        // LESSON 1: HOW WE GOT THE BIBLE
        // ═══════════════════════════════════════════════════
        
        DivineInspirationLesson(
            id: "how_we_got_bible",
            number: 1,
            title: "How We Actually Got the Bible",
            subtitle: "It didn't fall from the sky",
            emoji: "📖",
            
            sections: [
                .init(
                    heading: "Most Westerners Don't Know This",
                    body: "Ask the average Christian where the Bible came from and they'll say 'from God.' Push further and they'll say 'it was written by prophets and apostles.' Push even further and you'll get blank stares.\n\nBecause here's what they were never taught: the Bible as we know it was ASSEMBLED by the Catholic Church. Not by God. Not by angels. By a committee of men who voted on which books to include and which to reject.\n\nThis isn't conspiracy theory. This is documented church history that the church itself acknowledges."
                ),
                .init(
                    heading: "The Old Testament",
                    body: "Even by the time of Jesus, the Jews had not finalized which books belonged in their scriptures. The Hebrew canon wasn't officially closed until approximately 100 AD at the Council of Jamnia (Yavneh).\n\nThat's AFTER Jesus lived and died. The scriptures Jesus would have read were still being debated during his lifetime.\n\nThe earliest complete copy of this finalized Hebrew text — the Masoretic Text — dates from the 10th century AD. That's nearly 1,000 years after Jesus. Before that, we have fragments, translations, and copies of copies of copies.\n\nThe Old Testament wasn't handed down on stone tablets in its current form. It was curated over centuries by human scribes, editors, and religious authorities."
                ),
                .init(
                    heading: "The New Testament",
                    body: "The books to be included in the New Testament were not finalized until 382 AD at the Synod of Rome under Pope Damasus I.\n\nThat's 382 years after Jesus. Nearly four centuries of debate, disagreement, and political maneuvering before anyone officially said 'THESE are the books.'\n\nDuring those four centuries, there were DOZENS of gospels, epistles, and apocalypses circulating among early Christians. The Gospel of Thomas. The Gospel of Mary. The Gospel of Judas. The Apocalypse of Peter. The Shepherd of Hermas.\n\nSome of these were beloved by entire communities for centuries. They were read in churches, studied by scholars, considered scripture by millions. Then a committee voted them out.\n\nThe books that made it in weren't necessarily the oldest or most authentic. They were the ones that aligned with the theological and political positions of the group that won the debate."
                ),
                .init(
                    heading: "The Church's Own Claim",
                    body: "Here's what's remarkable: the Catholic Church itself has always been transparent about this. Their position is explicit:\n\n'WE are giving you these scriptures on OUR authority and by the authority of the informal tradition that has existed among us from the beginning, inspired by the Holy Spirit.'\n\nIn other words: the Bible is true because WE say it's true. The church came first. The Bible came from the church. Therefore the church has the authority to interpret it.\n\nYou can take that or leave it. But understand what's being said: the authority of the Bible is not based on the Bible itself. The authority comes from the institution that assembled it."
                ),
                .init(
                    heading: "The Circular Authority Problem",
                    body: "This creates a fascinating logical loop:\n\n'The Bible is the word of God.'\n'How do you know?'\n'Because the Bible says so.'\n'But who says the Bible is reliable?'\n'The church.'\n'And who gave the church authority?'\n'God, as described in the Bible.'\n\nThe judge and the advocate are the same person. As Alan Watts pointed out: you wouldn't want that in a court of law.\n\nAnyone can write a book and declare within it that the book is the word of God. You're at liberty to believe them or not. Hindus believe the Vedas are divinely revealed. Muslims believe the Quran is divinely inspired. Some Buddhists believe their sutras have transcendent origin. The Japanese believe ancient Shinto texts are divinely authored.\n\nWho is the impartial judge? There isn't one. Because everyone has already been influenced by one tradition or another. Nobody is truly neutral."
                )
            ],
            
            patternInsight: "The Bible is a remarkable collection of human attempts to describe encounters with something beyond ordinary experience. But it didn't materialize from heaven. Men wrote it. Men selected it. Men promoted it. And men used it as a tool of authority for centuries. Knowing this doesn't destroy the Bible's value — it puts it in proper context. The EXPERIENCE the writers were trying to describe may be genuine. The INSTITUTION that claimed ownership of that experience is a human creation.",
            
            sources: ["Synod of Jamnia / Council of Yavneh (c. 100 AD)", "Synod of Rome under Pope Damasus I (382 AD)", "Bart Ehrman — Misquoting Jesus (2005)", "Alan Watts — lecture on Biblical authority"]
        ),
        
        // ═══════════════════════════════════════════════════
        // LESSON 2: THE AUTHORITY PROBLEM
        // ═══════════════════════════════════════════════════
        
        DivineInspirationLesson(
            id: "authority_problem",
            number: 2,
            title: "The Authority Problem",
            subtitle: "Who decides what's true — and why should you believe them?",
            emoji: "⚖️",
            
            sections: [
                .init(
                    heading: "The Judge and the Advocate",
                    body: "If I say 'thinking it all over, I find that Jesus Christ is the greatest being who ever came onto this Earth' — by what standards am I judging?\n\nObviously, by the moral standards given to me as somebody brought up in a Christian culture.\n\nThere is nobody truly impartial who can decide between all the religions. Everyone has been shaped by one tradition or another. Even atheists carry the moral frameworks of the culture they rejected.\n\nSo when the church says 'the Bible is true,' it finally comes down to: are you going to believe the church? And if nobody believes the church, it becomes perfectly plain that the church has no authority.\n\nBecause the people are always the source of authority."
                ),
                .init(
                    heading: "The People Are the Source",
                    body: "This is a profound insight that applies far beyond religion: authority only exists because people grant it.\n\nA government only has power because citizens recognize it. A church only has authority because followers believe in it. A holy book only has weight because readers treat it as sacred.\n\nRemove the believers and the book is just paper and ink.\n\nAs Tocqueville said: the people get the government they deserve. The same applies to religion: a population gets the spiritual authority it accepts.\n\nThis doesn't mean there's no truth. It means YOU are the final authority on what you accept as true. Not a book. Not a church. Not a priest. Not a tradition. You.\n\nThat's terrifying for most people. It's also the beginning of real sovereignty."
                ),
                .init(
                    heading: "The Day of Judgment Argument",
                    body: "Some will say: 'God himself is the authority. Wait for the Day of Judgment and you'll find out.'\n\nBut at this moment, there is no evidence for the Day of Judgment. It remains, until there IS evidence, simply an opinion. And there is nothing else to go on except the opinions of other people who hold the same view — and whose opinions you've adopted.\n\nThis isn't a dismissal. Anyone has the right to hold these opinions. You may believe the Bible is literally true and dictated by God. That's your liberty.\n\nBut understand clearly: it IS an opinion. And building your entire worldview on an opinion that was handed to you before you could evaluate it — that's not faith. That's programming."
                )
            ],
            
            patternInsight: "Authority is not inherent. It is GRANTED. The Bible has authority because billions of people grant it authority. The church has authority because millions of people recognize it. Remove the recognition and the authority evaporates. This is true for every institution — religious, political, educational. The moment you realize YOU are the one granting authority, you reclaim the power to evaluate what deserves it.",
            
            sources: ["Alexis de Tocqueville — Democracy in America (1835)", "Alan Watts — The Book: On the Taboo Against Knowing Who You Are (1966)"]
        ),
        
        // ═══════════════════════════════════════════════════
        // LESSON 3: WHAT DIVINE INSPIRATION ACTUALLY IS
        // ═══════════════════════════════════════════════════
        
        DivineInspirationLesson(
            id: "what_inspiration_is",
            number: 3,
            title: "What Divine Inspiration Actually Is",
            subtitle: "It's not dictation. It's something far more profound.",
            emoji: "✨",
            
            sections: [
                .init(
                    heading: "Inspiration ≠ Dictation",
                    body: "Most people imagine divine inspiration like this: God speaks words, a human writes them down. Like a secretary taking dictation from the boss.\n\nBut real inspiration almost never comes in words.\n\nConsider this: have you ever read 'channeled' writing? Messages supposedly received from spirits, angels, or higher beings? Most of it is remarkably thin. When psychics try to write about deep mysteries instead of telling you about your grandmother, the content gets superficial.\n\nPsychically communicated philosophy is never as interesting as philosophy carefully thought out.\n\nDivine inspiration is something utterly different from receiving a dictated message."
                ),
                .init(
                    heading: "What Inspiration Actually Feels Like",
                    body: "Divine inspiration is — for example — to feel, for reasons you can't fully understand, that you LOVE people.\n\nDivine inspiration is a wisdom which is very difficult to put into words — like mystical experience itself.\n\nIt might come through dreams. Through archetypal messages from what Jung called the collective unconscious. Through sudden moments of clarity that seem to come from nowhere and everywhere at once.\n\nA person who writes out of THAT experience could genuinely be said to be 'divinely inspired.' But here's the critical point:"
                ),
                .init(
                    heading: "The Sound System Problem",
                    body: "Since inspiration always comes through a human vehicle, it is liable to be distorted.\n\nImagine someone speaking profound truth through a broken sound system. The truth might be real, but the sound system warps it. You might mishear. You might misunderstand. The distortion becomes part of the message.\n\nEvery person who receives divine inspiration expresses it within the limits of what language they know. And by 'language' this doesn't just mean English or Hebrew or Sanskrit. It means: what terms are available to you? What religious framework were you raised in? What metaphors does your culture provide?\n\nIf you grew up in the Bible Belt and had a genuine mystical experience of unity with God, the only words available to you might be: 'I am Jesus Christ.'\n\nIf you grew up reading the Upanishads, you'd say: 'Atman is Brahman — the individual soul is the universal soul.' And nobody would bat an eye, because that's standard Hindu theology.\n\nSame experience. Different sound system. Completely different reception."
                ),
                .init(
                    heading: "The Arkansas Mystic",
                    body: "If you came out of Arkansas and the only religion you knew was Bible Belt Christianity, and you had a genuine cosmic consciousness experience where you discovered you are one with God — you're liable to say: 'I'm Jesus Christ.'\n\nAnd lots of people do.\n\nBut the culture can't allow it. There was only ONE Jesus Christ. And scripture says when he comes back there'll be no doubt — legions of angels, the whole heavens opening up. You're not doing that. You're just old Joe Bloggs that everyone knew years ago.\n\n'Well,' he says, 'when Jesus said he was God, nobody believed him either. And you don't believe me now.'\n\nYou can't answer that argument. But the REASON he's saying it this way is because he's trying to express what happened to him in the only religious language available to him — the Holy Bible.\n\nHe's never read the Upanishads. He's never read the Diamond Sutra. He's never read the Tibetan Book of the Dead, the I Ching, or the Tao Te Ching.\n\nIf he had read the Upanishads, he would have had no difficulty. And neither would the society around him — because the Upanishads say plainly: WE ARE ALL incarnations of God."
                )
            ],
            
            patternInsight: "The experience is real. The sound system distorts it. Every mystic, prophet, and saint in history was trying to describe the SAME encounter with something beyond ordinary consciousness. But each one could only express it through the language, culture, and religious framework they inherited. The Bible is one sound system. The Upanishads are another. The Dao De Jing is another. The experience they're all trying to describe? That's universal. That's the signal. The rest is cultural noise.",
            
            sources: ["Alan Watts — multiple lectures on mystical experience", "Carl Jung — The Archetypes and the Collective Unconscious (1959)", "Aldous Huxley — The Perennial Philosophy (1945)"]
        ),
        
        // ═══════════════════════════════════════════════════
        // LESSON 4: COSMIC CONSCIOUSNESS IS UNIVERSAL
        // ═══════════════════════════════════════════════════
        
        DivineInspirationLesson(
            id: "cosmic_consciousness",
            number: 4,
            title: "Cosmic Consciousness Is Universal",
            subtitle: "The same experience. Every culture. Every era. Every tradition.",
            emoji: "🌀",
            
            sections: [
                .init(
                    heading: "It Can Hit Anyone, Anytime",
                    body: "Jesus of Nazareth was a human being — like Buddha, like Sri Ramakrishna, like Ramana Maharshi — who early in life had a colossal experience of what we call cosmic consciousness.\n\nYou don't have to be any particular kind of religion to get this experience. It can hit anyone, anytime.\n\nSometimes it comes after long practice of meditation and spiritual discipline. Sometimes it comes for no reason anyone can determine. Traditions call it 'the grace of God' — it arrives unbidden.\n\nIt's found all over the world. In every century. In every culture. Among the educated and uneducated. Among believers and atheists. Among the young and the old."
                ),
                .init(
                    heading: "What the Experience Feels Like",
                    body: "When it hits, you KNOW. There comes this overwhelming conviction:\n\nYou have mistaken your identity.\n\nWhat you thought was 'you' — your name, your history, your personality — is revealed to be just a character in a play. A role being performed. Completely superficial.\n\nUnderneath that character, you discover that you are an expression of an eternal Something — a nameless X — so fundamental that language can't contain it. As the name of God was considered unspeakable among the Hebrews: I AM.\n\nAnd suddenly you understand WHY everything is the way it is. It becomes perfectly clear.\n\nFurthermore: you no longer feel any boundary between what you DO and what HAPPENS to you. Everything going on is simultaneously your doing and the universe's doing — because you and the universe are not separate.\n\nIs your breathing voluntary or involuntary? Do you do it, or does it happen to you? You can feel it both ways. In cosmic consciousness, you feel EVERYTHING like breathing."
                ),
                .init(
                    heading: "Same Experience, Different Names",
                    body: "If you have the name 'God' in your background, you will say: 'This is God. This is the will of God. This is the doing of God.'\n\nIf you don't have that word, you might say with the Chinese: 'It is the flowing of the Dao.'\n\nIf you're Hindu, you might say: 'It is the Maya of Brahman' — the magical power, the creative illusion, the divine play of the ultimate reality.\n\nDifferent words. Different frameworks. Same experience.\n\nChristian mystics called it 'union with God.'\nSufis called it 'fana' — dissolution into the Divine.\nBuddhists called it 'satori' or 'kensho' — seeing your true nature.\nHindus called it 'moksha' — liberation.\nDaoists called it 'wu wei' — effortless action in harmony with the Dao.\n\nThe mystic poet Kabir, when he was very old, used to look around at people and say: 'To whom shall I preach?' — because he saw the Beloved in ALL eyes."
                ),
                .init(
                    heading: "Everyone Is Playing Their Part",
                    body: "Here's where it gets truly mind-expanding: every person, in their own peculiar way, is acting out an essential part in a colossal cosmic drama.\n\nNot just the saints. Not just the prophets. Not just the 'spiritual' people.\n\nEveryone.\n\nThe businessman. The criminal. The child. The tyrant. The artist. The person scrolling their phone right now. Every single expression of consciousness is the universe exploring itself from a unique angle.\n\nThis doesn't mean everything everyone does is 'good.' It means everything is PART of the whole. Like every note in a symphony — including the dissonant ones — is part of the music.\n\nYou're not watching the cosmic drama. You're IN it. You're not separate from God watching God's creation. You ARE God's creation watching itself. You ARE the process by which the universe becomes conscious of itself.\n\nThat's what every mystic in every tradition has been trying to say. And that's what the Bible, at its deepest level, is pointing toward — underneath all the cultural noise, the institutional politics, and the centuries of distortion."
                )
            ],
            
            patternInsight: "The experience that inspired the Bible is the SAME experience that inspired the Upanishads, the Diamond Sutra, the Dao De Jing, and the poetry of Rumi. It's cosmic consciousness — the direct experience that your individual self is an expression of something infinite. No single tradition owns it. No single book captures it. No single language can express it. But the experience itself is available to anyone, anywhere, anytime. Including you. Right now. That's not belief. That's an invitation.",
            
            sources: ["Richard Maurice Bucke — Cosmic Consciousness (1901)", "Alan Watts — The Book: On the Taboo Against Knowing Who You Are (1966)", "Aldous Huxley — The Perennial Philosophy (1945)", "Upanishads — Chandogya, Brihadaranyaka", "Kabir — Songs of Kabir (trans. Tagore)", "Lao Tzu — Dao De Jing"]
        ),
        
        // ═══════════════════════════════════════════════════
        // LESSON 5: THE PERENNIAL TRUTH
        // ═══════════════════════════════════════════════════
        
        DivineInspirationLesson(
            id: "perennial_truth",
            number: 5,
            title: "The Perennial Truth",
            subtitle: "What ALL traditions are pointing at — underneath the labels",
            emoji: "☀️",
            
            sections: [
                .init(
                    heading: "The Perennial Philosophy",
                    body: "Aldous Huxley called it 'The Perennial Philosophy' — the idea that underneath all the world's religions, there is a single core truth that keeps being rediscovered:\n\nThere is an infinite, eternal reality that is the ground of all existence.\n\nThis reality is not separate from you — it IS you, at the deepest level.\n\nMost human suffering comes from the illusion of being separate from this reality.\n\nDirect experience of this reality (not belief, not faith — EXPERIENCE) is available to anyone.\n\nEvery major mystical tradition has independently arrived at this same conclusion:\n\nHinduism: 'Tat tvam asi' — Thou art That. You are the ultimate reality.\n\nBuddhism: Your true nature is Buddha-nature. Enlightenment is recognizing what you already are.\n\nChristian mysticism: 'The Kingdom of God is within you.' (Luke 17:21)\n\nIslam (Sufism): 'Ana al-Haqq' — I am the Truth. (Mansur al-Hallaj, executed for saying this)\n\nDaoism: The Dao that can be named is not the eternal Dao. You ARE the Dao flowing.\n\nJudaism (Kabbalah): Ein Sof — the Infinite — manifests through all creation. You are a spark of the divine."
                ),
                .init(
                    heading: "Why This Was Hidden",
                    body: "If this truth is so universal, why doesn't everyone know it?\n\nBecause institutions need followers, not free people.\n\nIf you realize you have DIRECT access to the divine — that you don't need a priest, a church, a book, or a sacrament to connect with the infinite — then the institution loses its purpose.\n\nEvery organized religion began with someone having a direct experience. Then followers gathered. Then an institution formed to manage the followers. Then the institution declared itself the ONLY valid path to the experience. Then the institution began suppressing anyone who claimed to have the experience directly.\n\nJesus had the experience → Christianity formed → The Church claimed sole authority → Mystics who said 'I found God directly' were burned as heretics.\n\nBuddha had the experience → Buddhism formed → Monastic institutions claimed authority → Zen masters who said 'kill the Buddha' were considered dangerous.\n\nThe pattern repeats in every tradition. The institution replaces the experience with doctrine. And doctrine can be controlled."
                ),
                .init(
                    heading: "What This Means for You",
                    body: "You don't need permission to wake up.\n\nYou don't need a priest to connect with the divine. You don't need a book to validate your experience. You don't need a tradition to frame what you feel.\n\nIf you've ever had a moment — even a flash — where:\n\n• Everything seemed ALIVE and interconnected\n• You felt a love for everything that made no logical sense\n• The boundary between 'you' and 'the world' dissolved\n• You understood something you couldn't put into words\n• Time seemed to stop or expand\n• You felt simultaneously tiny and infinite\n\n...then you've tasted what every scripture in every tradition is trying to describe.\n\nYou don't need to call it God. You don't need to call it enlightenment. You don't need to call it anything.\n\nBut you should know: that experience is what the Bible, the Upanishads, the Quran, the Dao De Jing, the Diamond Sutra, and every mystical text ever written is pointing toward.\n\nThey're all fingers pointing at the same moon. Don't worship the finger."
                )
            ],
            
            patternInsight: "The Prussian education system taught you to identify with one tradition and reject the others. The institutional church taught you that THEIR book is the only valid one. But the mystics of EVERY tradition — including Christianity — have said the same thing: you are an expression of the infinite, and you can experience this directly.\n\nThe Bible is not wrong. It's incomplete. Not because it lacks pages, but because NO book can contain what it's pointing at. The experience is bigger than any language. Bigger than any tradition. Bigger than any institution.\n\nAnd it's available to you right now. Not because SunFlow says so. Because every awakened being in human history has said so.\n\nYou don't need a new belief. You need to see through the old ones. ☀️",
            
            sources: ["Aldous Huxley — The Perennial Philosophy (1945)", "Alan Watts — The Book (1966)", "Mansur al-Hallaj (858-922 AD)", "Meister Eckhart — Sermons", "Kabir — Songs of Kabir", "Luke 17:21", "Chandogya Upanishad — 'Tat Tvam Asi'", "Diamond Sutra", "Lao Tzu — Dao De Jing, Chapter 1"]
        ),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODEL
// ═══════════════════════════════════════════════════════════

struct DivineInspirationLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let sections: [LessonSection]
    let patternInsight: String
    let sources: [String]
    
    struct LessonSection: Identifiable {
        let id = UUID()
        let heading: String
        let body: String
    }
}

// MARK: - ═══════════════════════════════════════════════════
// COURSE VIEW
// ═══════════════════════════════════════════════════════════

struct DivineInspirationDecodedCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: Int = 0
    @State private var expandedSections: Set<String> = []
    
    private let course = DivineInspirationDecodedCourse.self
    private let lessons = DivineInspirationDecodedCourse.lessons
    private let accent = DivineInspirationDecodedCourse.accentColor
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.05).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        lessonSelector
                        lessonContent(lessons[selectedLesson])
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("📜").font(.system(size: 14))
                        Text("Divine Inspiration").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("📜").font(.system(size: 48)).shadow(color: accent.opacity(0.3), radius: 15)
            Text("DIVINE INSPIRATION\nDECODED").font(.system(size: 22, weight: .black)).tracking(1)
                .foregroundColor(.white).multilineTextAlignment(.center)
            Text("Who gave you the Bible — and what is inspiration really?")
                .font(.system(size: 12, weight: .bold)).foregroundColor(accent.opacity(0.6))
            
            HStack(spacing: 12) {
                statBadge("5", "Lessons")
                statBadge("6+", "Traditions")
                statBadge("2000+", "Years of History")
            }
            .padding(.top, 4)
        }
    }
    
    private func statBadge(_ value: String, _ label: String) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 14, weight: .black)).foregroundColor(accent)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.2))
        }
        .padding(.horizontal, 10).padding(.vertical, 6)
        .background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.03)))
    }
    
    // MARK: - Lesson Selector
    
    private var lessonSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { selectedLesson = index }
                    } label: {
                        VStack(spacing: 3) {
                            Text(lesson.emoji).font(.system(size: 16))
                            Text("\(lesson.number)").font(.system(size: 9, weight: .black))
                                .foregroundColor(selectedLesson == index ? .black : .white.opacity(0.3))
                        }
                        .frame(width: 44, height: 44)
                        .background(Circle().fill(selectedLesson == index ? accent.opacity(0.8) : Color.white.opacity(0.03)))
                    }
                }
            }
        }
    }
    
    // MARK: - Lesson Content
    
    private func lessonContent(_ lesson: DivineInspirationLesson) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Lesson header
            VStack(alignment: .leading, spacing: 4) {
                Text("LESSON \(lesson.number)").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                Text(lesson.title).font(.system(size: 18, weight: .black)).foregroundColor(.white)
                Text(lesson.subtitle).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
            }
            
            // Sections
            ForEach(lesson.sections) { section in
                sectionCard(section)
            }
            
            // Pattern insight
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text("☀️").font(.system(size: 10))
                    Text("PATTERN INSIGHT").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(accent)
                }
                Text(lesson.patternInsight).font(.system(size: 12, weight: .medium))
                    .foregroundColor(accent.opacity(0.6)).lineSpacing(3)
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.08), lineWidth: 1)))
            
            // Sources
            VStack(alignment: .leading, spacing: 4) {
                Text("SOURCES").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.1))
                ForEach(lesson.sources, id: \.self) { source in
                    Text("• \(source)").font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.1))
                }
            }
            
            // Navigation
            HStack {
                if selectedLesson > 0 {
                    Button { withAnimation { selectedLesson -= 1 } } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left").font(.system(size: 10))
                            Text("Previous").font(.system(size: 11, weight: .bold))
                        }.foregroundColor(.white.opacity(0.3))
                    }
                }
                Spacer()
                if selectedLesson < lessons.count - 1 {
                    Button { withAnimation { selectedLesson += 1 } } label: {
                        HStack(spacing: 4) {
                            Text("Next Lesson").font(.system(size: 11, weight: .bold))
                            Image(systemName: "chevron.right").font(.system(size: 10))
                        }.foregroundColor(accent)
                    }
                }
            }.padding(.top, 8)
        }
    }
    
    // MARK: - Section Card
    
    private func sectionCard(_ section: DivineInspirationLesson.LessonSection) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    let id = section.id.uuidString
                    if expandedSections.contains(id) { expandedSections.remove(id) }
                    else { expandedSections.insert(id) }
                }
            } label: {
                HStack {
                    Text(section.heading).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Image(systemName: expandedSections.contains(section.id.uuidString) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                }.padding(12)
            }
            
            if expandedSections.contains(section.id.uuidString) {
                Text(section.body).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.55)).lineSpacing(3)
                    .padding(.horizontal, 12).padding(.bottom, 12)
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.02), lineWidth: 1)))
    }
}
