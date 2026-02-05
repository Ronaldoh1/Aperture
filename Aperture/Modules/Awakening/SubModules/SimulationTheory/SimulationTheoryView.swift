// SimulationTheoryView.swift
// Deep dive into the Simulation Hypothesis
// "Are we living in a simulation? The evidence and arguments."

import SwiftUI

// MARK: - Main Simulation Theory View
struct SimulationTheoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSection = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Matrix-style dark gradient
                LinearGradient(
                    colors: [Color(hex: "000a00"), Color(hex: "001a00"), Color(hex: "000a00")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Matrix rain effect (simplified)
                GeometryReader { geo in
                    ForEach(0..<20, id: \.self) { i in
                        Text("01")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundStyle(Color(hex: "00FF00").opacity(0.1))
                            .position(
                                x: CGFloat.random(in: 0...geo.size.width),
                                y: CGFloat.random(in: 0...geo.size.height)
                            )
                    }
                }
                
                VStack(spacing: 0) {
                    Picker("Section", selection: $selectedSection) {
                        Text("Overview").tag(0)
                        Text("Arguments").tag(1)
                        Text("Evidence").tag(2)
                        Text("Implications").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedSection) {
                        overviewSection.tag(0)
                        argumentsSection.tag(1)
                        evidenceSection.tag(2)
                        implicationsSection.tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("🖥️ Simulation Theory")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "00FF00"))
                }
            }
        }
    }
    
    // MARK: - Overview Section
    private var overviewSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("🖥️")
                        .font(.system(size: 60))
                    
                    Text("Simulation Theory")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Are we living in a computer simulation?")
                        .font(.subheadline)
                        .foregroundStyle(Color(hex: "00FF00").opacity(0.8))
                }
                .padding(.vertical, 20)
                
                // Core Concept
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔮 THE HYPOTHESIS")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "00FF00"))
                        .tracking(2)
                    
                    Text("The Simulation Hypothesis proposes that all of reality, including Earth and the rest of the universe, could be an artificial simulation, such as a computer simulation run by an advanced civilization.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                    
                    Text("This isn't science fiction—it's a serious philosophical and scientific proposition explored by physicists, philosophers, and technologists.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color(hex: "00FF00").opacity(0.1))
                .cornerRadius(12)
                
                // Key Proponents
                VStack(alignment: .leading, spacing: 16) {
                    Text("🧠 KEY PROPONENTS")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    proponentCard(
                        name: "Nick Bostrom",
                        title: "Oxford Philosopher",
                        contribution: "2003 paper 'Are You Living in a Computer Simulation?' established the trilemma that launched modern simulation theory.",
                        quote: "At least one of the following is true: civilizations never reach simulation capability, they choose not to run simulations, or we're almost certainly in a simulation."
                    )
                    
                    proponentCard(
                        name: "Elon Musk",
                        title: "Tech Entrepreneur",
                        contribution: "Popularized simulation theory, stating there's a 'one in billions' chance we're in base reality.",
                        quote: "If you assume any rate of improvement at all, games will eventually be indistinguishable from reality."
                    )
                    
                    proponentCard(
                        name: "Neil deGrasse Tyson",
                        title: "Astrophysicist",
                        contribution: "Gives simulation theory a 50-50 chance of being true, based on the logical arguments.",
                        quote: "I find it hard to argue against the simulation hypothesis."
                    )
                    
                    proponentCard(
                        name: "Max Tegmark",
                        title: "MIT Physicist",
                        contribution: "Proposes mathematical universe hypothesis—reality IS mathematics, consistent with simulation.",
                        quote: "Our external physical reality is a mathematical structure."
                    )
                }
                
                // Quick Stats
                VStack(alignment: .leading, spacing: 12) {
                    Text("📊 BY THE NUMBERS")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    statRow(label: "Bostrom's estimate", value: "20-50%", desc: "Probability we're in simulation")
                    statRow(label: "Computing power needed", value: "10^36 ops/sec", desc: "To simulate human brain")
                    statRow(label: "Years to capability", value: "~50-100", desc: "At current Moore's Law rates")
                    statRow(label: "Ancestor simulations", value: "Billions", desc: "Advanced civs might run")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Arguments Section
    private var argumentsSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("⚖️ THE ARGUMENTS")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00FF00"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Bostrom's Trilemma
                VStack(alignment: .leading, spacing: 16) {
                    Text("🔺 BOSTROM'S TRILEMMA")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("At least one of these three propositions MUST be true:")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                    
                    trilemmaCard(
                        number: 1,
                        title: "Extinction Before Simulation",
                        content: "Virtually all civilizations at our level of development go extinct before becoming technologically mature enough to create high-fidelity simulations."
                    )
                    
                    trilemmaCard(
                        number: 2,
                        title: "No Interest in Simulations",
                        content: "Virtually all technologically mature civilizations lack interest in running ancestor simulations (simulations of their evolutionary history)."
                    )
                    
                    trilemmaCard(
                        number: 3,
                        title: "We're Almost Certainly Simulated",
                        content: "If propositions 1 and 2 are false, then we are almost certainly living in a simulation. The number of simulated minds would vastly outnumber real minds."
                    )
                }
                .padding()
                .background(Color(hex: "00FF00").opacity(0.1))
                .cornerRadius(12)
                
                // Supporting Arguments
                VStack(alignment: .leading, spacing: 16) {
                    Text("✅ ARGUMENTS FOR")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "27AE60"))
                        .tracking(2)
                    
                    argumentCard(
                        icon: "🎮",
                        title: "Technological Trajectory",
                        content: "40 years ago: Pong. Today: photorealistic VR. In 100 years? Indistinguishable from reality. If this trajectory continues, simulations will be perfect."
                    )
                    
                    argumentCard(
                        icon: "📊",
                        title: "Statistical Argument",
                        content: "If simulations are possible and civilizations run them, simulated beings vastly outnumber real ones. Statistically, you're probably simulated."
                    )
                    
                    argumentCard(
                        icon: "🔢",
                        title: "Mathematical Universe",
                        content: "Physics is suspiciously mathematical. Equations describe reality perfectly. This is exactly what you'd expect if reality IS a mathematical computation."
                    )
                    
                    argumentCard(
                        icon: "⚛️",
                        title: "Quantum Mechanics",
                        content: "Quantum superposition (unobserved particles in multiple states) resembles computational optimization—only render what's being observed."
                    )
                    
                    argumentCard(
                        icon: "🚀",
                        title: "Fermi Paradox Solution",
                        content: "Why no aliens? Perhaps the simulation only renders detail where observers look. No need to simulate civilizations we'll never contact."
                    )
                }
                
                // Counter Arguments
                VStack(alignment: .leading, spacing: 16) {
                    Text("❌ ARGUMENTS AGAINST")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "E74C3C"))
                        .tracking(2)
                    
                    argumentCard(
                        icon: "💻",
                        title: "Computational Limits",
                        content: "Simulating quantum mechanics at full fidelity may require more computation than exists in any universe. Fundamental limits might make it impossible."
                    )
                    
                    argumentCard(
                        icon: "♾️",
                        title: "Infinite Regress",
                        content: "If we're simulated, our simulators might be too. This creates infinite regress. Where does 'base reality' begin?"
                    )
                    
                    argumentCard(
                        icon: "🤷",
                        title: "Unfalsifiable",
                        content: "The hypothesis may be unfalsifiable. Any 'glitch' evidence could be explained otherwise. Any lack of evidence explained by simulation perfection."
                    )
                    
                    argumentCard(
                        icon: "❓",
                        title: "Consciousness Problem",
                        content: "We don't understand consciousness. Assuming simulated beings would be conscious is a major assumption without theoretical backing."
                    )
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Evidence Section
    private var evidenceSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🔬 POTENTIAL EVIDENCE")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00FF00"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Physics Anomalies
                VStack(alignment: .leading, spacing: 16) {
                    Text("⚛️ PHYSICS ANOMALIES")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    evidenceCard(
                        title: "Planck Scale Pixelation",
                        content: "Space-time appears to have a minimum 'pixel size' (Planck length: 1.6 × 10^-35 m). Reality may be discrete, not continuous—like a digital grid.",
                        strength: "Medium"
                    )
                    
                    evidenceCard(
                        title: "Speed of Light Limit",
                        content: "Nothing travels faster than light. This is exactly what you'd expect if information propagation has a maximum speed—like bandwidth limits.",
                        strength: "Low"
                    )
                    
                    evidenceCard(
                        title: "Quantum Wave Function Collapse",
                        content: "Particles exist in superposition until observed, then 'collapse' to definite states. Similar to lazy evaluation in programming—don't compute until needed.",
                        strength: "Medium"
                    )
                    
                    evidenceCard(
                        title: "Fine-Tuned Constants",
                        content: "Physical constants are precisely tuned for life. Change any slightly, no stars or atoms. Either multiverse or... deliberate design parameters.",
                        strength: "Low"
                    )
                    
                    evidenceCard(
                        title: "Mathematical Elegance",
                        content: "Why does math describe reality so perfectly? Eugene Wigner called this 'unreasonable effectiveness.' It's expected if reality IS mathematical.",
                        strength: "Medium"
                    )
                }
                
                // Glitches in the Matrix
                VStack(alignment: .leading, spacing: 16) {
                    Text("🐛 'GLITCHES' REPORTED")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("Note: These are anecdotal and have mundane explanations. Listed for completeness.")
                        .font(.caption)
                        .foregroundStyle(.orange)
                    
                    glitchCard(title: "Mandela Effects", desc: "Mass misremembering of facts. (See Mandela Effects module)")
                    glitchCard(title: "Déjà Vu", desc: "Feeling of reliving moments. Could be memory glitch or... timeline reset?")
                    glitchCard(title: "Synchronicities", desc: "Meaningful coincidences. Pattern recognition or programmed events?")
                    glitchCard(title: "Reality Shifts", desc: "People report objects moving, changes in timeline. Memory errors or edits?")
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(12)
                
                // Scientific Tests
                VStack(alignment: .leading, spacing: 16) {
                    Text("🧪 PROPOSED TESTS")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    testCard(
                        title: "Cosmic Ray Test",
                        researcher: "Silas Beane (2012)",
                        method: "Look for anisotropies in cosmic ray directions that would indicate a lattice structure to space-time.",
                        status: "Inconclusive"
                    )
                    
                    testCard(
                        title: "Resource Limits",
                        researcher: "Various",
                        method: "Push computational/observational limits to find where the simulation 'cuts corners.'",
                        status: "Ongoing"
                    )
                    
                    testCard(
                        title: "Quantum Computer Test",
                        researcher: "Theoretical",
                        method: "Build quantum computers of increasing power. If simulation can't handle it, expect anomalies.",
                        status: "Speculative"
                    )
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Implications Section
    private var implicationsSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🌐 IMPLICATIONS")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00FF00"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // If True
                VStack(alignment: .leading, spacing: 16) {
                    Text("✅ IF SIMULATION IS TRUE")
                        .font(.headline)
                        .foregroundStyle(Color(hex: "27AE60"))
                    
                    implicationCard(
                        icon: "🎯",
                        title: "Purpose May Exist",
                        content: "Simulations are run for reasons. Our existence might have purpose—entertainment, research, ancestor recreation, or something incomprehensible."
                    )
                    
                    implicationCard(
                        icon: "👁️",
                        title: "We're Being Watched",
                        content: "The simulators may observe us. Your life might be observed, recorded, analyzed. Privacy as concept becomes... complicated."
                    )
                    
                    implicationCard(
                        icon: "⚡",
                        title: "Rules Can Change",
                        content: "Physical laws are code. They could be patched, updated, or overridden. Miracles become software updates."
                    )
                    
                    implicationCard(
                        icon: "💾",
                        title: "Death May Not Be Final",
                        content: "If consciousness is computation, it can be saved, restored, duplicated. The afterlife might be... another process."
                    )
                    
                    implicationCard(
                        icon: "🎮",
                        title: "Free Will Question",
                        content: "Are our choices computed or truly free? If the simulation is deterministic, free will is illusion. If quantum random, perhaps not."
                    )
                }
                
                // Practical Implications
                VStack(alignment: .leading, spacing: 16) {
                    Text("🛠️ PRACTICAL IMPLICATIONS")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    practicalCard(
                        title: "Live Fully Anyway",
                        content: "Simulated or not, your experiences are real to you. Pain hurts. Joy feels good. Act accordingly."
                    )
                    
                    practicalCard(
                        title: "Moral Behavior Matters",
                        content: "If observed, your actions are recorded. If simulated beings matter morally (they probably do), ethics still applies."
                    )
                    
                    practicalCard(
                        title: "Reality is What You Experience",
                        content: "Base reality or simulation—your conscious experience is the only reality you have direct access to."
                    )
                    
                    practicalCard(
                        title: "The Meta-Question",
                        content: "Perhaps the question itself is the point. Consciousness pondering its own nature. Very on-brand for a simulation."
                    )
                }
                
                // Final Thought
                VStack(spacing: 12) {
                    Text("💭 FINAL THOUGHT")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "00FF00"))
                    
                    Text("\"I cannot prove that I am not living in a simulation. Neither can you. But does it matter? The experience of existence—simulated or not—is undeniably real to the one experiencing it.\"")
                        .font(.body)
                        .italic()
                        .foregroundStyle(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(Color(hex: "00FF00").opacity(0.1))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Helper Views
    private func proponentCard(name: String, title: String, contribution: String, quote: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("•")
                    .foregroundStyle(.white.opacity(0.3))
                Text(title)
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00FF00"))
            }
            Text(contribution)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
            Text("\"\(quote)\"")
                .font(.caption)
                .italic()
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func statRow(label: String, value: String, desc: String) -> some View {
        HStack {
            Text(label)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
            Spacer()
            VStack(alignment: .trailing) {
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(hex: "00FF00"))
                Text(desc)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
    }
    
    private func trilemmaCard(number: Int, title: String, content: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(width: 30, height: 30)
                .background(Color(hex: "00FF00"))
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(content)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
    }
    
    private func argumentCard(icon: String, title: String, content: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(icon)
                .font(.title2)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(content)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func evidenceCard(title: String, content: String, strength: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
                Text("Strength: \(strength)")
                    .font(.caption2)
                    .foregroundStyle(strengthColor(strength))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(strengthColor(strength).opacity(0.2))
                    .cornerRadius(4)
            }
            Text(content)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func strengthColor(_ strength: String) -> Color {
        switch strength {
        case "High": return Color(hex: "27AE60")
        case "Medium": return Color(hex: "F39C12")
        default: return Color(hex: "E74C3C")
        }
    }
    
    private func glitchCard(title: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("🐛")
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(desc)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
    
    private func testCard(title: String, researcher: String, method: String, status: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
                Text(status)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.6))
            }
            Text("By: \(researcher)")
                .font(.caption2)
                .foregroundStyle(Color(hex: "00FF00"))
            Text(method)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func implicationCard(icon: String, title: String, content: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(icon)
                .font(.title2)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(content)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
        .padding()
        .background(Color(hex: "27AE60").opacity(0.1))
        .cornerRadius(12)
    }
    
    private func practicalCard(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Text(content)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    SimulationTheoryView()
}
