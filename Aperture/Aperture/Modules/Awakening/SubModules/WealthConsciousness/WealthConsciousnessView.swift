// WealthConsciousnessView.swift
// Wealth Consciousness - The Science of Generating Wealth
// Breaking free from scarcity programming

import SwiftUI

// MARK: - Wealth Consciousness View
struct WealthConsciousnessView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gold/wealth gradient
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a0a"), Color(hex: "0a1a0a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Picker("Section", selection: $selectedTab) {
                        Text("Truth").tag(0)
                        Text("5 Traps").tag(1)
                        Text("Shift").tag(2)
                        Text("Practice").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedTab) {
                        truthTab.tag(0)
                        trapsTab.tag(1)
                        shiftTab.tag(2)
                        practiceTab.tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("💰 Wealth Consciousness")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    // MARK: - Truth Tab
    private var truthTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("💰")
                        .font(.system(size: 60))
                    
                    Text("The Science of Wealth")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("It's not about your vocation—it's about your mindset")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                }
                .padding(.vertical, 20)
                
                // The Wrong Question
                VStack(alignment: .leading, spacing: 16) {
                    Text("❌ THE WRONG QUESTION")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "E74C3C"))
                        .tracking(2)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        questionCard(
                            question: "What do they DO that they can afford that?",
                            answer: "This assumes career/job creates wealth",
                            isWrong: true
                        )
                        
                        Text("When you see people driving nice cars, living in beautiful homes, flying first class—most people ask about their JOB. This is scarcity thinking.")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .padding()
                .background(Color(hex: "E74C3C").opacity(0.1))
                .cornerRadius(12)
                
                // The Right Question
                VStack(alignment: .leading, spacing: 16) {
                    Text("✅ THE RIGHT QUESTION")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "27AE60"))
                        .tracking(2)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        questionCard(
                            question: "What are they THINKING that allows this abundance?",
                            answer: "This recognizes consciousness creates reality",
                            isWrong: false
                        )
                        
                        Text("Ask: How do they show up with their finances? What do they believe about money? What is their internal relationship with wealth?")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .padding()
                .background(Color(hex: "27AE60").opacity(0.1))
                .cornerRadius(12)
                
                // Your Money Story
                VStack(alignment: .leading, spacing: 16) {
                    Text("📖 YOUR MONEY STORY")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("Every person has a money story—beliefs formed from:")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        storySource("How your parents talked (or didn't talk) about money")
                        storySource("Your culture and religion's teachings")
                        storySource("Impactful events in your life")
                        storySource("What society told you about wealth")
                        storySource("Watching people around you struggle or succeed")
                    }
                    
                    Text("These created—usually SUBCONSCIOUSLY—your beliefs about money that are now reflected in your financial reality.")
                        .font(.caption)
                        .italic()
                        .foregroundStyle(Color(hex: "FFD700"))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Core Truth
                keyInsight(
                    text: "The same thinking that created your current results will NOT create new results.",
                    subtext: "As you begin to think DIFFERENTLY about money, you rewire your brain, create new neural pathways, new beliefs, new actions—and therefore new results."
                )
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - 5 Traps Tab
    private var trapsTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("⚠️ 5 SCARCITY TRAPS")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "E74C3C"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Trap 1: Lack
                scarcityTrap(
                    number: 1,
                    title: "LACK THINKING",
                    subtitle: "\"There's Never Enough\"",
                    description: "This looks like: 'I can't afford it', 'I don't have enough money', constantly feeling paycheck to paycheck, wondering how you'll pay bills.",
                    symptom: "You're constantly paycheque to paycheque, wondering how to afford anything",
                    truth: "As long as your thinking is 'there's not enough', that will continue to be your experience",
                    color: Color(hex: "E74C3C")
                )
                
                // Trap 2: Zero-Sum
                scarcityTrap(
                    number: 2,
                    title: "ZERO-SUM THINKING",
                    subtitle: "\"If I Win, Someone Loses\"",
                    description: "Believing if you build wealth, it comes out of a limited pie. Someone else must suffer for you to succeed.",
                    symptom: "You feel guilty about success, think wealthy people are greedy, fear 'taking too much'",
                    truth: "Wealth is not a fixed pie. Your abundance doesn't diminish someone else's potential",
                    color: Color(hex: "9B59B6")
                )
                
                // Trap 3: Hard Work
                scarcityTrap(
                    number: 3,
                    title: "HARD WORK MYTH",
                    subtitle: "\"I Have to Hustle to Earn\"",
                    description: "Believing the ONLY way to build wealth is to work longer, harder, faster. Reinforced by hustle culture.",
                    symptom: "Life feels like a struggle. You sacrifice freedom, family, health for money",
                    truth: "Working smart beats working hard. Wealth flows from alignment, not exhaustion",
                    color: Color(hex: "3498DB")
                )
                
                // Trap 4: Worthiness
                scarcityTrap(
                    number: 4,
                    title: "WORTHINESS BLOCK",
                    subtitle: "\"People Like Me Don't Get Rich\"",
                    description: "A false belief that you don't DESERVE to be wealthy. Limiting self-identity around what you're capable of.",
                    symptom: "You sabotage success, feel 'undeserving', have ceiling on what you allow yourself",
                    truth: "Worthiness is not earned—it is your birthright. You are worthy NOW",
                    color: Color(hex: "F39C12")
                )
                
                // Trap 5: Survival
                scarcityTrap(
                    number: 5,
                    title: "SURVIVAL FEAR",
                    subtitle: "\"I Might Lose Everything\"",
                    description: "Scared to spend or invest. Feeling like you're risking security. Must hoard to protect family.",
                    symptom: "You hang onto everything, afraid to take risks, feel constant financial anxiety",
                    truth: "Security comes from consciousness, not accumulation. Trust the flow",
                    color: Color(hex: "27AE60")
                )
                
                // Self Assessment
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔍 SELF-ASSESSMENT")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    Text("Which of these resonate with you? Chances are you have 1, 2, 3 or maybe ALL 5 operating in your life.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text("Just because you have these patterns doesn't mean you're stuck. Awareness is the first step to transformation.")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Shift Tab
    private var shiftTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🔄 THE SHIFT")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "9B59B6"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Interrupt Pattern
                VStack(alignment: .leading, spacing: 16) {
                    Text("⚡ INTERRUPT THE PATTERN")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("When you notice scarcity thinking:")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        shiftStep(num: 1, text: "NOTICE: 'That's a scarcity thought'")
                        shiftStep(num: 2, text: "INTERRUPT: Stop the thought pattern")
                        shiftStep(num: 3, text: "ASK NEW QUESTIONS: Challenge the belief")
                        shiftStep(num: 4, text: "REPLACE: Install new programming")
                    }
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                // New Questions
                VStack(alignment: .leading, spacing: 16) {
                    Text("❓ NEW QUESTIONS TO ASK")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    newQuestion("What if I DID believe I deserved wealth?")
                    newQuestion("What if I could work LESS and earn MORE?")
                    newQuestion("What would change if I saw money as unlimited?")
                    newQuestion("What are wealthy people THINKING that I'm not?")
                    newQuestion("How can I show up differently with my finances?")
                    newQuestion("What would I do if I knew I couldn't fail financially?")
                }
                
                // Neural Rewiring
                VStack(alignment: .leading, spacing: 16) {
                    Text("🧠 THE SCIENCE OF CHANGE")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("When you think differently about money:")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    HStack(spacing: 0) {
                        rewiringStep(label: "New\nThoughts", color: Color(hex: "3498DB"))
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white.opacity(0.3))
                        rewiringStep(label: "Neural\nPathways", color: Color(hex: "9B59B6"))
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white.opacity(0.3))
                        rewiringStep(label: "New\nBeliefs", color: Color(hex: "F39C12"))
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white.opacity(0.3))
                        rewiringStep(label: "New\nActions", color: Color(hex: "27AE60"))
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white.opacity(0.3))
                        rewiringStep(label: "New\nResults", color: Color(hex: "FFD700"))
                    }
                    
                    Text("Client after client doubles their income, attracts dream homes, cars, vacations—flying first class—because they changed their THINKING about money first.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Results
                VStack(alignment: .leading, spacing: 12) {
                    Text("✨ WHAT'S POSSIBLE")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    resultItem("Work less, earn more")
                    resultItem("Financial freedom and time freedom")
                    resultItem("Do what you love and get paid abundantly")
                    resultItem("Money flows easily when aligned")
                    resultItem("Security from consciousness, not accumulation")
                }
                .padding()
                .background(Color(hex: "27AE60").opacity(0.1))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Practice Tab
    private var practiceTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🎯 DAILY PRACTICE")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "FFD700"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Morning Practice
                practiceBlock(
                    title: "🌅 MORNING WEALTH ACTIVATION",
                    steps: [
                        "Before getting out of bed, feel grateful for abundance already present",
                        "Visualize your ideal financial situation—FEEL it as real",
                        "Set intention: 'Today I am open to receive'",
                        "Affirm: 'Money flows to me easily and abundantly'",
                        "Notice any resistance—that's your old programming"
                    ]
                )
                
                // Throughout Day
                practiceBlock(
                    title: "☀️ THROUGHOUT THE DAY",
                    steps: [
                        "Catch scarcity thoughts: 'I notice that thought'",
                        "Ask: 'What would abundant-me think instead?'",
                        "When you see wealthy people, bless them (not envy)",
                        "Say 'thank you' when money leaves (it returns multiplied)",
                        "Treat money with respect—organize it, appreciate it"
                    ]
                )
                
                // Evening
                practiceBlock(
                    title: "🌙 EVENING INTEGRATION",
                    steps: [
                        "Review: Where did abundance show up today?",
                        "Notice any scarcity patterns that surfaced",
                        "Forgive yourself for any old programming",
                        "Visualize your wealth vision before sleep",
                        "Fall asleep in the FEELING of having it now"
                    ]
                )
                
                // Affirmations
                VStack(alignment: .leading, spacing: 16) {
                    Text("💎 WEALTH AFFIRMATIONS")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    affirmationCard("I am worthy of wealth and abundance")
                    affirmationCard("Money flows to me from expected and unexpected sources")
                    affirmationCard("I release all blocks to receiving wealth")
                    affirmationCard("My income increases constantly")
                    affirmationCard("I am a magnet for financial opportunities")
                    affirmationCard("Wealth allows me to serve more people")
                }
                
                // Final Wisdom
                keyInsight(
                    text: "What's your money story? Is it creating the results you want?",
                    subtext: "If not, start changing the thinking you have around money—and watch new results appear."
                )
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Helper Views
    private func questionCard(question: String, answer: String, isWrong: Bool) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\"\(question)\"")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(isWrong ? Color(hex: "E74C3C") : Color(hex: "27AE60"))
            Text(answer)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
        }
    }
    
    private func storySource(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundStyle(Color(hex: "FFD700"))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
    
    private func keyInsight(text: String, subtext: String) -> some View {
        VStack(spacing: 12) {
            Text("💡")
                .font(.title)
            Text(text)
                .font(.headline)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            Text(subtext)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(hex: "FFD700").opacity(0.1))
        .cornerRadius(12)
    }
    
    private func scarcityTrap(number: Int, title: String, subtitle: String, description: String, symptom: String, truth: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("\(number)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(width: 36, height: 36)
                    .background(color)
                    .cornerRadius(18)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(color)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            
            Text(description)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top, spacing: 6) {
                    Text("😰")
                    Text(symptom)
                        .font(.caption2)
                        .foregroundStyle(.white.opacity(0.7))
                }
                
                HStack(alignment: .top, spacing: 6) {
                    Text("✨")
                    Text(truth)
                        .font(.caption2)
                        .foregroundStyle(color)
                }
            }
        }
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func shiftStep(num: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(num)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(width: 24, height: 24)
                .background(Color(hex: "9B59B6"))
                .cornerRadius(12)
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func newQuestion(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("?")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "F39C12"))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding(.vertical, 4)
    }
    
    private func rewiringStep(label: String, color: Color) -> some View {
        VStack {
            Circle()
                .fill(color)
                .frame(width: 40, height: 40)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func resultItem(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("✓")
                .foregroundStyle(Color(hex: "27AE60"))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func practiceBlock(title: String, steps: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
            
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 8) {
                    Text("\(index + 1).")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                    Text(step)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func affirmationCard(_ text: String) -> some View {
        Text("✨ \(text)")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.9))
            .padding(.vertical, 4)
    }
}

#Preview {
    WealthConsciousnessView()
}
