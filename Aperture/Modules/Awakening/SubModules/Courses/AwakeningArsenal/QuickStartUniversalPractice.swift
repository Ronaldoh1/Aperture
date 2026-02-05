// QuickStartUniversalPractice.swift
// The core practices that appear in EVERY tradition
// Start here before choosing a specific path

import SwiftUI

struct QuickStartUniversalPracticeView: View {
    @State private var expandedPractice: String? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                headerSection
                
                // The Five Universals
                fiveUniversalsSection
                
                // 7-Day Challenge
                sevenDayChallengeSection
                
                // After You Start
                afterYouStartSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Quick Start")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "play.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("Start Here")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("5 practices found in EVERY tradition")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text("Master these before choosing a specific path")
                .font(.system(size: 12))
                .foregroundColor(.cyan)
        }
        .padding()
    }
    
    // MARK: - Five Universals
    
    private var fiveUniversalsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("THE FIVE UNIVERSALS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            // Practice Cards
            universalPracticeCard(
                number: "1",
                title: "Conscious Breathing",
                icon: "wind",
                color: .cyan,
                traditions: "Pranayama • Qigong • Hesychasm • Zazen • Dhikr",
                whatItDoes: "Activates the parasympathetic nervous system, quiets the mind, and opens the door to altered states. Breath is the bridge between body and consciousness.",
                howToDo: [
                    "Sit comfortably with spine straight",
                    "Close your eyes or soften your gaze",
                    "Breathe in slowly through your nose for 4 counts",
                    "Hold gently for 4 counts",
                    "Exhale slowly through nose for 6 counts",
                    "Repeat for 5-10 minutes daily"
                ],
                tips: "Morning is ideal. Don't force—let breath be smooth. If you get dizzy, return to normal breathing.",
                scienceNote: "Research shows conscious breathing reduces cortisol, increases heart rate variability, and activates the prefrontal cortex."
            )
            
            universalPracticeCard(
                number: "2",
                title: "Stillness / Meditation",
                icon: "leaf.fill",
                color: .green,
                traditions: "Zazen • Vipassana • Contemplative Prayer • Dhyana • Silence",
                whatItDoes: "Creates space between stimulus and response. Reveals the nature of mind. Allows deeper patterns to surface and dissolve.",
                howToDo: [
                    "Find a quiet place where you won't be disturbed",
                    "Sit comfortably—chair, cushion, or floor",
                    "Set a timer (start with 5-10 minutes)",
                    "Close your eyes. Simply observe what arises",
                    "When thoughts come, note them and return to breath",
                    "Don't fight thoughts—just don't follow them"
                ],
                tips: "Consistency matters more than duration. Same time daily builds habit. Wandering mind isn't failure—noticing is the practice.",
                scienceNote: "Meditation physically changes brain structure—increases gray matter in prefrontal cortex and reduces amygdala reactivity."
            )
            
            universalPracticeCard(
                number: "3",
                title: "Non-Attachment",
                icon: "hand.raised.slash",
                color: .orange,
                traditions: "Vairagya • Wu Wei • Surrender • Tawakkul • Letting Go",
                whatItDoes: "Breaks the cycle of craving and aversion that causes suffering. Reveals that you are not your thoughts, emotions, or circumstances.",
                howToDo: [
                    "Notice when you're grasping (wanting something to happen)",
                    "Notice when you're resisting (pushing something away)",
                    "Pause and observe the sensation in your body",
                    "Ask: 'Can I let this go?' or 'Can I allow this?'",
                    "Practice with small things first (traffic, minor annoyances)",
                    "Gradually apply to bigger attachments"
                ],
                tips: "Non-attachment isn't not caring—it's not clinging. You can prefer outcomes without demanding them. Start with physical objects.",
                scienceNote: "Attachment activates the brain's reward circuitry and creates dependency patterns. Non-attachment rewires these circuits."
            )
            
            universalPracticeCard(
                number: "4",
                title: "Compassion / Love",
                icon: "heart.fill",
                color: .pink,
                traditions: "Metta • Agape • Chesed • Ishq • Ubuntu • Karuna",
                whatItDoes: "Opens the heart center. Dissolves the illusion of separation. Transforms both the giver and receiver. Is considered the highest practice in most traditions.",
                howToDo: [
                    "Begin with yourself: 'May I be happy, may I be at peace'",
                    "Extend to someone you love easily",
                    "Extend to a neutral person (stranger)",
                    "Extend to a difficult person (start mild)",
                    "Extend to all beings everywhere",
                    "One act of kindness daily—without expectation"
                ],
                tips: "Self-compassion isn't selfish—it's necessary. If sending love to difficult people is too hard, start with 'May they be free from suffering.'",
                scienceNote: "Loving-kindness meditation increases vagal tone, positive emotions, and social connection while reducing implicit bias."
            )
            
            universalPracticeCard(
                number: "5",
                title: "Self-Inquiry",
                icon: "magnifyingglass",
                color: .purple,
                traditions: "Atma Vichara • Koan • Contemplation • Muhasaba • Shadow Work",
                whatItDoes: "Turns attention back on the observer. Questions assumed identities. Reveals that what you truly are cannot be found as an object.",
                howToDo: [
                    "When a thought arises, ask: 'Who is thinking this?'",
                    "When emotion arises, ask: 'Who is feeling this?'",
                    "Trace attention back to its source",
                    "Journal: 'Who am I without my story?'",
                    "Question beliefs: 'Is this true? Can I absolutely know it's true?'",
                    "Notice the awareness that notices everything"
                ],
                tips: "This isn't intellectual—it's experiential. Don't try to answer with words. Let the question dissolve the questioner.",
                scienceNote: "Self-referential processing activates the default mode network. Self-inquiry interrupts these patterns, similar to psychedelic states."
            )
        }
        .padding(.bottom, 16)
        .background(Color.white.opacity(0.02))
    }
    
    private func universalPracticeCard(
        number: String,
        title: String,
        icon: String,
        color: Color,
        traditions: String,
        whatItDoes: String,
        howToDo: [String],
        tips: String,
        scienceNote: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header (always visible)
            Button(action: {
                withAnimation(.spring()) {
                    if expandedPractice == title {
                        expandedPractice = nil
                    } else {
                        expandedPractice = title
                    }
                }
            }) {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(color.opacity(0.3))
                            .frame(width: 44, height: 44)
                        Image(systemName: icon)
                            .foregroundColor(color)
                            .font(.system(size: 18))
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text("#\(number)")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(color)
                            Text(title)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        }
                        Text(traditions)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    Image(systemName: expandedPractice == title ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            
            // Expanded content
            if expandedPractice == title {
                VStack(alignment: .leading, spacing: 16) {
                    // What it does
                    VStack(alignment: .leading, spacing: 6) {
                        Text("What It Does:")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(color)
                        Text(whatItDoes)
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    // How to do it
                    VStack(alignment: .leading, spacing: 8) {
                        Text("How To Practice:")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(color)
                        
                        ForEach(howToDo.indices, id: \.self) { i in
                            HStack(alignment: .top, spacing: 8) {
                                Text("\(i + 1).")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(color)
                                    .frame(width: 20, alignment: .leading)
                                Text(howToDo[i])
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    
                    // Tips
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                        Text(tips)
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.7))
                            .italic()
                    }
                    .padding(10)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(8)
                    
                    // Science note
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.cyan)
                            .font(.system(size: 12))
                        Text(scienceNote)
                            .font(.system(size: 10))
                            .foregroundColor(.cyan.opacity(0.8))
                    }
                }
                .padding(.leading, 56)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    // MARK: - 7-Day Challenge
    
    private var sevenDayChallengeSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.green)
                Text("7-DAY STARTER CHALLENGE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            Text("Try all five practices in one week:")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10) {
                challengeDay("Day 1-2", "Conscious Breathing", "5 mins morning, 5 mins evening")
                challengeDay("Day 3-4", "Add Stillness", "10 mins sitting after breathwork")
                challengeDay("Day 5", "Add Compassion", "Send love to 5 people during stillness")
                challengeDay("Day 6", "Add Non-Attachment", "Notice 5 moments of grasping/resisting")
                challengeDay("Day 7", "Add Self-Inquiry", "Ask 'Who is aware?' during practice")
            }
            
            Text("After 7 days, you've touched the core of every major tradition. Choose which resonates most and go deeper.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func challengeDay(_ day: String, _ practice: String, _ instruction: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(day)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.green)
                .frame(width: 55, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(practice)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                Text(instruction)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - After You Start
    
    private var afterYouStartSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.purple)
                Text("WHAT HAPPENS NEXT")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                nextRow("You may feel calmer", "This is normal. You're activating rest-and-digest.")
                nextRow("Emotions may surface", "This is healing. Suppressed material comes up to be released.")
                nextRow("Nothing may happen", "Also normal. Changes can be subtle. Keep practicing.")
                nextRow("You may want more", "Explore the Arsenal. A specific tradition may call you.")
                nextRow("Resistance may arise", "The ego resists its dissolution. This is a good sign.")
            }
            
            Text("The path finds you when you're ready. Your job is to show up consistently. The rest unfolds naturally.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.purple)
                .italic()
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func nextRow(_ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.purple)
                .font(.system(size: 12))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NavigationStack {
        QuickStartUniversalPracticeView()
    }
}
