// AwakeningGuideView.swift
// AWAKENING GUIDE — "You're Not Crazy. You're Waking Up."
// ☀️ SunFlow: Reignited
//
// "I was so lost. So much crying. Nothing made sense.
//  I was like why me, wtf, why did it have to be me.
//  I wish there was someone there to explain it all."
//  — Ron, September 2024
//
// This feature IS that someone. For every person who
// cracks open at 3am with no framework, no guide, no
// understanding of what's happening to their body, mind,
// and soul. We catch them. We hold their hand. We walk
// them through it. Calmly. Privately. With love.
//
// PHASES:
// 1. Emergency Landing — "I think something is happening to me"
// 2. Acute Support (Day 1 - Week 1) — Check-ins, grounding, biology
// 3. Education — Courses, birth chart, synchronicities, chakras
// 4. Integration — Routines, journal, purpose alignment
//
// PRIVACY: All data local-only. Encrypted. No cloud sync.
// This is THEIR moment. Private. Sacred.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// AWAKENING GUIDE HUB
// ═══════════════════════════════════════════════════════════

struct AwakeningGuideView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var state = AwakeningGuideState()
    
    private let glow = Color(red: 0.6, green: 0.8, blue: 1.0)   // Calming blue-white
    private let warm = Color(red: 1.0, green: 0.85, blue: 0.5)   // Warm gold
    private let heal = Color(red: 0.4, green: 0.85, blue: 0.6)   // Healing green
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        switch state.currentPhase {
                        case .landing:        landingView
                        case .mentalHealth:   mentalHealthScreener
                        case .acuteEntry:     acuteEntryView
                        case .acuteSupport:   acuteSupportHub
                        case .education:      educationHub
                        case .integration:    integrationHub
                        }
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
                        Text("🕊️").font(.system(size: 13))
                        Text("Awakening Guide").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .onAppear { state.load() }
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // PHASE 0: LANDING — "Something is happening to me"
    // ═══════════════════════════════════════════════════════
    
    private var landingView: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 30)
            
            // Gentle breathing glow
            ZStack {
                Circle().fill(glow.opacity(0.03)).frame(width: 160, height: 160)
                    .blur(radius: 30)
                Circle().fill(glow.opacity(0.05)).frame(width: 100, height: 100)
                    .blur(radius: 15)
                Text("🕊️").font(.system(size: 50))
            }
            
            Text("You're Safe Here").font(.system(size: 26, weight: .bold)).foregroundColor(.white)
            
            Text("If something feels different — confusing,\noverwhelming, like reality shifted —\nyou're in the right place.")
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.45))
                .multilineTextAlignment(.center).lineSpacing(3)
            
            Text("This is private. Nothing is tracked.\nThis moment is yours and yours only.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(glow.opacity(0.3))
                .multilineTextAlignment(.center)
            
            // Primary action
            Button {
                withAnimation(.easeInOut(duration: 0.4)) { state.currentPhase = .mentalHealth }
            } label: {
                VStack(spacing: 4) {
                    Text("Something is happening to me").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                    Text("I need guidance right now").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                }
                .padding(.vertical, 16).frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 14).fill(glow.opacity(0.08))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(glow.opacity(0.15), lineWidth: 1)))
            }
            
            // Secondary — already past acute
            Button {
                withAnimation { state.currentPhase = .education }
            } label: {
                VStack(spacing: 4) {
                    Text("I'm past the crisis — I want to understand").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.5))
                    Text("Explore courses, birth chart, chakras").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
                .padding(.vertical, 12).frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
            }
            
            // Tertiary — "Am I going crazy?"
            Button {
                withAnimation { state.showSanityCheck = true }
            } label: {
                Text("I think something is wrong with me").font(.system(size: 12, weight: .bold))
                    .foregroundColor(warm.opacity(0.5)).padding(.top, 8)
            }
            
            // Breathing exercise - immediate tool
            VStack(spacing: 6) {
                Text("RIGHT NOW:").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.1))
                Text("Breathe in for 4... hold for 4... out for 4.\nFeel your feet on the ground.\nYou are here. You are real. You are safe.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.25))
                    .multilineTextAlignment(.center).lineSpacing(3)
            }
            .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(glow.opacity(0.015)))
        }
        .sheet(isPresented: $state.showSanityCheck) { sanityCheckSheet }
    }
    
    // MARK: - SANITY CHECK SHEET — "Am I going crazy?"
    
    private var sanityCheckSheet: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("🧠").font(.system(size: 40))
                        Text("You're Not Going Crazy").font(.system(size: 22, weight: .black)).foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            reassurance("What you're experiencing has a name", "It's called a spiritual awakening, a consciousness shift, or in neuroscience terms — a major reorganization of your default mode network. Millions of people have gone through this.")
                            
                            reassurance("Your brain is literally rewiring", "Your amygdala is flooding cortisol because your sense of self is dissolving. That's why you feel like you're dying. You're not. Your neural pathways are reorganizing to accommodate expanded awareness. It's a system reboot.")
                            
                            reassurance("The crying is normal", "Stored emotions — sometimes decades worth — are releasing. Your body is processing grief, anger, confusion, and relief all at once. Let it flow. Don't fight it.")
                            
                            reassurance("The 'downloads' are normal", "Sudden insights, knowing things you shouldn't, seeing patterns everywhere — this is your perception expanding. Your brain's temporal and parietal lobes are activating in new ways.")
                            
                            reassurance("The insomnia is normal", "Your pineal gland is activating. Melatonin production shifts. You may need far less sleep and feel fully rested on 3-4 hours. This is temporary and not dangerous.")
                            
                            reassurance("You're not alone", "Every wisdom tradition describes this. In Christianity: being 'born again.' In Buddhism: 'satori.' In Hinduism: 'kundalini awakening.' In psychology: 'spiritual emergency.' Same experience. Different language.")
                        }
                        
                        Divider().background(Color.white.opacity(0.05))
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("⚠️ WHEN TO SEEK HELP").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.red.opacity(0.5))
                            Text("If you're having thoughts of harming yourself or others, hearing commanding voices, or are unable to care for yourself — please reach out to a professional. This app is not a substitute for medical care.")
                                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3)).lineSpacing(2)
                            
                            Button { } label: {
                                Text("🆘 Crisis Resources").font(.system(size: 12, weight: .bold)).foregroundColor(.red.opacity(0.6))
                                    .padding(10).frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.red.opacity(0.04)))
                            }
                        }
                        
                        Button {
                            state.showSanityCheck = false
                            withAnimation { state.currentPhase = .mentalHealth }
                        } label: {
                            Text("I understand — guide me through this").font(.system(size: 14, weight: .bold))
                                .foregroundColor(.black).padding(14).frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 12).fill(glow))
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
    
    private func reassurance(_ title: String, _ body: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(glow.opacity(0.7))
            Text(body).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(glow.opacity(0.02)))
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // MENTAL HEALTH SCREENER
    // ═══════════════════════════════════════════════════════
    
    private var mentalHealthScreener: some View {
        VStack(spacing: 16) {
            Text("🤝").font(.system(size: 36))
            Text("Quick Check-In").font(.system(size: 20, weight: .bold)).foregroundColor(.white)
            Text("No judgment. This helps us tailor the experience\nso nothing is triggering. Your answers stay on YOUR device.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 10) {
                screenQuestion("Do you have any diagnosed mental health conditions?",
                    options: ["Anxiety", "Depression", "Bipolar", "PTSD/Trauma", "ADHD", "None", "Prefer not to say"],
                    binding: $state.mentalHealthDisclosures)
                
                screenQuestion("Are you currently taking any medication?",
                    options: ["Yes", "No", "Prefer not to say"],
                    binding: $state.medicationStatus)
                
                screenQuestion("Do you have someone you trust to talk to?",
                    options: ["Yes", "No", "Not sure"],
                    binding: $state.hasSupportPerson)
            }
            
            Button {
                state.saveMentalHealth()
                withAnimation(.easeInOut(duration: 0.4)) { state.currentPhase = .acuteEntry }
            } label: {
                Text("Continue →").font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black).padding(14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(glow))
            }
            
            Button {
                withAnimation { state.currentPhase = .acuteEntry }
            } label: {
                Text("Skip for now").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.2))
            }
        }
    }
    
    private func screenQuestion(_ question: String, options: [String], binding: Binding<Set<String>>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(question).font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
            
            FlowLayout(spacing: 6) {
                ForEach(options, id: \.self) { option in
                    Button {
                        if binding.wrappedValue.contains(option) { binding.wrappedValue.remove(option) }
                        else { binding.wrappedValue.insert(option) }
                    } label: {
                        Text(option).font(.system(size: 10, weight: .bold))
                            .foregroundColor(binding.wrappedValue.contains(option) ? .black : .white.opacity(0.4))
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .background(RoundedRectangle(cornerRadius: 6)
                                .fill(binding.wrappedValue.contains(option) ? glow : Color.white.opacity(0.02)))
                    }
                }
            }
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // ACUTE ENTRY — "It just happened"
    // ═══════════════════════════════════════════════════════
    
    private var acuteEntryView: some View {
        VStack(spacing: 18) {
            Spacer().frame(height: 20)
            
            ZStack {
                Circle().fill(glow.opacity(0.04)).frame(width: 120, height: 120).blur(radius: 20)
                Text("💫").font(.system(size: 44))
            }
            
            Text("Take a breath.").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
            
            // Soothing text — this is the voice Ron wished he'd had
            VStack(spacing: 10) {
                calmText("What just happened to you is real.")
                calmText("It might feel like the ground disappeared.")
                calmText("Like everything you believed was wrong.")
                calmText("Like you're dying inside.")
                calmText("You're not dying. You're being reborn.")
                calmText("The old version of you — the one that was built\nby other people's expectations — is dissolving.")
                calmText("What's left will be the REAL you.")
                calmText("Stronger. Clearer. Unafraid.")
                calmText("But right now, it hurts. And that's okay.")
                calmText("We're going to walk through this together.")
            }
            
            // Check-in frequency
            VStack(spacing: 6) {
                Text("HOW OFTEN SHOULD WE CHECK IN?").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                HStack(spacing: 6) {
                    ForEach([5, 10, 30, 60], id: \.self) { mins in
                        Button { state.checkInIntervalMinutes = mins } label: {
                            Text("\(mins)m").font(.system(size: 12, weight: .bold))
                                .foregroundColor(state.checkInIntervalMinutes == mins ? .black : .white.opacity(0.3))
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(state.checkInIntervalMinutes == mins ? glow : Color.white.opacity(0.02)))
                        }
                    }
                }
                Text("We'll gently remind you to check in.\nYou can change this anytime.")
                    .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15)).multilineTextAlignment(.center)
            }
            
            Button {
                state.startAcuteSupport()
                withAnimation(.easeInOut(duration: 0.4)) { state.currentPhase = .acuteSupport }
            } label: {
                Text("🕊️ Walk Me Through This").font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 14).fill(glow))
            }
        }
    }
    
    private func calmText(_ text: String) -> some View {
        Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
            .multilineTextAlignment(.center).lineSpacing(2)
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // ACUTE SUPPORT HUB — Days 1-7
    // ═══════════════════════════════════════════════════════
    
    private var acuteSupportHub: some View {
        VStack(spacing: 14) {
            // Day indicator
            let day = state.daysSinceStart
            HStack {
                Text("DAY \(day)").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(glow.opacity(0.4))
                Spacer()
                Text("🕊️ You're doing great").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
            }
            
            // Current state check
            VStack(spacing: 8) {
                Text("How are you feeling right now?").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                HStack(spacing: 6) {
                    ForEach(AcuteFeeling.allCases, id: \.self) { feeling in
                        Button { state.currentFeeling = feeling } label: {
                            VStack(spacing: 3) {
                                Text(feeling.emoji).font(.system(size: 20))
                                Text(feeling.label).font(.system(size: 7, weight: .bold))
                                    .foregroundColor(state.currentFeeling == feeling ? .white : .white.opacity(0.15))
                            }
                            .frame(maxWidth: .infinity).padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(state.currentFeeling == feeling ? glow.opacity(0.1) : Color.white.opacity(0.015)))
                        }
                    }
                }
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(glow.opacity(0.015)))
            
            // Dynamic response based on feeling
            if let feeling = state.currentFeeling {
                responseCard(for: feeling)
            }
            
            // Quick tools
            VStack(alignment: .leading, spacing: 6) {
                Text("TOOLS FOR RIGHT NOW").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
                
                toolRow("🫁", "Breathing Exercise", "4-4-4 box breathing for immediate calm")
                toolRow("🧠", "What's Happening To Me?", "The biology behind what you're feeling")
                toolRow("💆", "Body Scan", "Find and release where you're holding tension")
                toolRow("🔊", "Soothing Voice", "Listen — you're not alone in this")
                toolRow("📖", "Why This Hurts", "Understanding ego dissolution")
                toolRow("🛡️", "I Think I'm Going Crazy", "You're not — here's the science")
            }
            
            // Progress through acute phase
            if day >= 3 {
                VStack(spacing: 6) {
                    Text("READY FOR MORE?").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(warm.opacity(0.3))
                    Text("When you feel stable enough, there are courses\nthat will help you understand what happened.")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2)).multilineTextAlignment(.center)
                    
                    Button {
                        withAnimation { state.currentPhase = .education }
                    } label: {
                        Text("I'm ready to explore →").font(.system(size: 12, weight: .bold)).foregroundColor(warm)
                            .padding(10).frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 8).fill(warm.opacity(0.04)))
                    }
                }
            }
            
            // Check-in adjustment
            VStack(spacing: 4) {
                Text("Check-ins: every \(state.checkInIntervalMinutes) minutes")
                    .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.1))
                Button {
                    state.checkInIntervalMinutes = min(state.checkInIntervalMinutes + 5, 120)
                } label: {
                    Text("I need less frequent check-ins").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.15))
                }
            }
        }
    }
    
    private func responseCard(for feeling: AcuteFeeling) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(feeling.response).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
            
            if feeling == .terrified || feeling == .crying {
                Text("This is your nervous system recalibrating.\nCortisol is flooding because your sense of self is reorganizing.\nIt will pass. Breathe with me.")
                    .font(.system(size: 10, weight: .medium)).foregroundColor(glow.opacity(0.3)).lineSpacing(2)
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(glow.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(glow.opacity(0.04), lineWidth: 1)))
    }
    
    private func toolRow(_ emoji: String, _ title: String, _ subtitle: String) -> some View {
        Button { /* Navigate to specific tool */ } label: {
            HStack(spacing: 10) {
                Text(emoji).font(.system(size: 18)).frame(width: 28)
                VStack(alignment: .leading, spacing: 1) {
                    Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Text(subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 9)).foregroundColor(.white.opacity(0.08))
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // EDUCATION HUB — Understanding Your Awakening
    // ═══════════════════════════════════════════════════════
    
    private var educationHub: some View {
        VStack(spacing: 14) {
            VStack(spacing: 4) {
                Text("🌅").font(.system(size: 36))
                Text("Understanding Your Awakening").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                Text("Now that you're grounded, let's explore what happened\nand who you're becoming.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
            }
            
            // Course modules
            VStack(alignment: .leading, spacing: 6) {
                Text("COURSES").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.1))
                
                courseCard("🧬", "The Biology of Awakening", "What's happening in your brain, nervous system, and body", .blue)
                courseCard("⚡", "Downloads & Synchronicities", "Why you suddenly 'know' things and see patterns everywhere", warm)
                courseCard("🎵", "Frequencies & Vibrations", "How to raise your energy state — real methods, not woo", .purple)
                courseCard("👁️", "Why People See You Differently", "The perception shift and why some find you intimidating now", .cyan)
                courseCard("🧘", "Being Alone ≠ Being Lonely", "Solitude as the birthplace of your authentic self", heal)
                courseCard("🌀", "Chakras — Your Energy Map", "7 centers, what they mean, why your body hurts, how to heal", .orange)
                courseCard("✡️", "Sacred Geometry", "The mathematical blueprints behind everything", warm)
                courseCard("🌙", "Your Birth Chart", "The cosmic snapshot of who you came here to be", .indigo)
                courseCard("💚", "Heart Chakra Deep Dive", "Why your heart hurts and how to reconnect to Source", heal)
                courseCard("💻", "Code of the Cosmos", "Spirituality through an engineer's lens", glow)
            }
            
            // Back to acute support option
            Button {
                withAnimation { state.currentPhase = .acuteSupport }
            } label: {
                Text("← I need support again").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.2))
            }
            
            // Forward to integration
            if state.coursesExplored >= 3 {
                Button {
                    withAnimation { state.currentPhase = .integration }
                } label: {
                    Text("I'm ready to build my new life →").font(.system(size: 13, weight: .bold)).foregroundColor(warm)
                        .padding(12).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(warm.opacity(0.04)))
                }
            }
        }
    }
    
    private func courseCard(_ emoji: String, _ title: String, _ subtitle: String, _ color: Color) -> some View {
        Button { state.coursesExplored += 1 } label: {
            HStack(spacing: 10) {
                Text(emoji).font(.system(size: 20)).frame(width: 30)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    Text(subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 9)).foregroundColor(color.opacity(0.2))
            }
            .padding(11).background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.015))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(color.opacity(0.04), lineWidth: 1)))
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // INTEGRATION HUB — Building Your New Life
    // ═══════════════════════════════════════════════════════
    
    private var integrationHub: some View {
        VStack(spacing: 14) {
            VStack(spacing: 4) {
                Text("☀️").font(.system(size: 36))
                Text("Building Your New Life").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                Text("The old version dissolved. The new you is emerging.\nLet's build a life aligned with who you really are.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("TOOLS FOR YOUR NEW LIFE").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(warm.opacity(0.2))
                
                integrationCard("📝", "Awakening Journal", "Voice-guided reflection. Process what happened. Find meaning.", warm)
                integrationCard("🔁", "Routine Builder", "Create daily practices aligned with your new self", heal)
                integrationCard("🎯", "Purpose Finder", "What lights you up? Build a life around that.", glow)
                integrationCard("🌳", "Chakra Healing", "Guided healing sessions for each energy center", .orange)
                integrationCard("🗺️", "Birth Chart Explorer", "Deep dive into your cosmic blueprint", .indigo)
                integrationCard("📚", "Knowledge Library", "All of Aperture's awakening courses, at your pace", .purple)
                integrationCard("🫂", "Who to Talk To", "How to navigate relationships post-awakening", .cyan)
                integrationCard("🌅", "Morning Grounding Ritual", "Start each day centered and connected", warm)
            }
            
            // Bridge to main app
            VStack(spacing: 6) {
                Text("You've come so far.").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.4))
                Text("Everything in this app was built to support\nyour continued growth. Explore freely.")
                    .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2)).multilineTextAlignment(.center)
            }
            .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(warm.opacity(0.015)))
        }
    }
    
    private func integrationCard(_ emoji: String, _ title: String, _ subtitle: String, _ color: Color) -> some View {
        Button { } label: {
            HStack(spacing: 10) {
                Text(emoji).font(.system(size: 18)).frame(width: 28)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Text(subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 9)).foregroundColor(color.opacity(0.15))
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.01)))
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FLOW LAYOUT (for tags)
// ═══════════════════════════════════════════════════════════

// FlowLayout provided by QuantumNourish/View/VibeSpectrumView.swift
// Reusing existing FlowLayout from the shared codebase

// MARK: - ═══════════════════════════════════════════════════
// STATE & MODELS
// ═══════════════════════════════════════════════════════════

enum GuidePhase: String, Codable { case landing, mentalHealth, acuteEntry, acuteSupport, education, integration }

enum AcuteFeeling: String, CaseIterable, Codable {
    case terrified, crying, confused, numb, angry, okay
    
    var emoji: String {
        switch self { case .terrified: return "😰"; case .crying: return "😭"; case .confused: return "😵‍💫"
        case .numb: return "😶"; case .angry: return "😤"; case .okay: return "🙂" }
    }
    var label: String {
        switch self { case .terrified: return "Terrified"; case .crying: return "Crying"; case .confused: return "Confused"
        case .numb: return "Numb"; case .angry: return "Angry"; case .okay: return "Okay" }
    }
    var response: String {
        switch self {
        case .terrified: return "Fear is the loudest voice right now because your ego is fighting to survive. It thinks you're in danger. You're not. You're shedding a shell that was never really you. The fear will pass as the new you stabilizes."
        case .crying: return "Let it flow. Don't fight it. These aren't weakness tears — they're release tears. Your body is processing years of stored emotions that your old self suppressed. Every tear is weight leaving your system."
        case .confused: return "Nothing makes sense because your old framework for understanding reality just collapsed. That's disorienting — like waking up in a country where you don't speak the language. A new understanding is forming. Give it time."
        case .numb: return "Numbness is your nervous system protecting you from processing everything at once. It's a circuit breaker, not a failure. Your body is wise — it's giving you a pause before the next wave. Rest in it."
        case .angry: return "The anger is valid. You were told things that weren't true. By people. By institutions. By systems. That betrayal stings. But channel it — anger is energy. Use it to build, not to burn. The rage softens into clarity."
        case .okay: return "That's real progress. 'Okay' after what you've been through is actually strong. Stay here. Ground here. Build from here. The waves may come again, but you know you can ride them now."
        }
    }
}

class AwakeningGuideState: ObservableObject {
    @Published var currentPhase: GuidePhase = .landing
    @Published var showSanityCheck: Bool = false
    @Published var mentalHealthDisclosures: Set<String> = []
    @Published var medicationStatus: Set<String> = []
    @Published var hasSupportPerson: Set<String> = []
    @Published var checkInIntervalMinutes: Int = 10
    @Published var acuteStartDate: Date?
    @Published var currentFeeling: AcuteFeeling?
    @Published var coursesExplored: Int = 0
    
    var daysSinceStart: Int {
        guard let start = acuteStartDate else { return 1 }
        return max(1, Calendar.current.dateComponents([.day], from: start, to: Date()).day ?? 1)
    }
    
    func startAcuteSupport() {
        acuteStartDate = Date()
        save()
        // TODO: Schedule local notifications at checkInIntervalMinutes
    }
    
    func saveMentalHealth() { save() }
    
    func save() {
        let data: [String: Any] = [
            "phase": currentPhase.rawValue,
            "interval": checkInIntervalMinutes,
            "startDate": acuteStartDate?.timeIntervalSince1970 ?? 0,
            "coursesExplored": coursesExplored
        ]
        UserDefaults.standard.set(data, forKey: "aperture_awakening_guide")
    }
    
    func load() {
        guard let data = UserDefaults.standard.dictionary(forKey: "aperture_awakening_guide") else { return }
        if let phase = data["phase"] as? String, let p = GuidePhase(rawValue: phase) { currentPhase = p }
        if let interval = data["interval"] as? Int { checkInIntervalMinutes = interval }
        if let ts = data["startDate"] as? Double, ts > 0 { acuteStartDate = Date(timeIntervalSince1970: ts) }
        if let c = data["coursesExplored"] as? Int { coursesExplored = c }
    }
}
