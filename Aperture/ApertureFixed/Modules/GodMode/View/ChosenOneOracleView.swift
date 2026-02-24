// ChosenOneOracleView.swift
// GodMode - Discover Your Archetype & Destiny

import SwiftUI

struct ChosenArchetype: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let traits: [String]
    let mission: String
    let color: Color
}

struct ChosenOneOracleView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showAssessment = false
    @State private var selectedArchetype: ChosenArchetype?
    @State private var assessmentComplete = false
    @State private var resultArchetype: ChosenArchetype?
    
    let archetypes: [ChosenArchetype] = [
        ChosenArchetype(
            name: "The Prophet",
            icon: "👁️",
            description: "You see what others cannot. Your visions reveal truth.",
            traits: ["Visionary", "Truth-speaker", "Pattern seer", "Outsider"],
            mission: "To speak truth to power and awaken the sleeping masses.",
            color: Color(hex: "9B59B6")
        ),
        ChosenArchetype(
            name: "The Hermit",
            icon: "🏔️",
            description: "You find wisdom in solitude. Your path is internal.",
            traits: ["Introspective", "Self-sufficient", "Contemplative", "Wise"],
            mission: "To discover deep truths through inner exploration and share them when called.",
            color: Color(hex: "34495E")
        ),
        ChosenArchetype(
            name: "The Healer",
            icon: "💚",
            description: "You sense others' pain and hold space for transformation.",
            traits: ["Empathic", "Nurturing", "Transformative", "Gentle"],
            mission: "To help others process trauma and return to wholeness.",
            color: Color(hex: "27AE60")
        ),
        ChosenArchetype(
            name: "The Empath Soul",
            icon: "🌊",
            description: "You feel the collective field. Emotions flow through you.",
            traits: ["Sensitive", "Connected", "Absorbing", "Transmuting"],
            mission: "To process collective emotional energy and transmute darkness to light.",
            color: Color(hex: "3498DB")
        ),
        ChosenArchetype(
            name: "The Endurer",
            icon: "⚔️",
            description: "You've survived what would break others. Your scars are wisdom.",
            traits: ["Resilient", "Battle-tested", "Unbreakable", "Experienced"],
            mission: "To show others that survival is possible and guide them through darkness.",
            color: Color(hex: "7D3C98")
        ),
        ChosenArchetype(
            name: "The Rebel",
            icon: "🔥",
            description: "You refuse to comply with corrupt systems. You disrupt.",
            traits: ["Defiant", "Courageous", "System-breaker", "Truth-seeker"],
            mission: "To expose corruption and inspire others to question authority.",
            color: Color(hex: "E74C3C")
        ),
        ChosenArchetype(
            name: "The Warrior",
            icon: "🛡️",
            description: "You fight for those who cannot fight for themselves.",
            traits: ["Protective", "Strong", "Just", "Fearless"],
            mission: "To defend the innocent and battle forces of oppression.",
            color: Color(hex: "F39C12")
        ),
        ChosenArchetype(
            name: "The Seeker",
            icon: "🔍",
            description: "You are driven by an unquenchable thirst for truth.",
            traits: ["Curious", "Questioning", "Persistent", "Open-minded"],
            mission: "To uncover hidden knowledge and connect dots others miss.",
            color: Color(hex: "1ABC9C")
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2e")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        headerSection
                        
                        if assessmentComplete, let result = resultArchetype {
                            resultSection(archetype: result)
                        } else {
                            takeAssessmentButton
                            archetypesGrid
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("👁️ Chosen One Oracle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
            .sheet(isPresented: $showAssessment) {
                ArchetypeAssessmentView { archetype in
                    resultArchetype = archetype
                    assessmentComplete = true
                }
            }
            .sheet(item: $selectedArchetype) { archetype in
                ArchetypeDetailView(archetype: archetype)
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("🐉")
                .font(.system(size: 50))
            
            Text("Discover Your Archetype")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("8 paths of the awakened soul")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)
    }
    
    private var takeAssessmentButton: some View {
        Button(action: { showAssessment = true }) {
            HStack {
                Image(systemName: "sparkles")
                Text("Take the 32-Question Assessment")
                Image(systemName: "sparkles")
            }
            .font(.headline)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "FFD700"))
            .cornerRadius(12)
        }
    }
    
    private var archetypesGrid: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("THE 8 ARCHETYPES")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(archetypes) { archetype in
                    ArchetypeCard(archetype: archetype) {
                        selectedArchetype = archetype
                    }
                }
            }
        }
    }
    
    private func resultSection(archetype: ChosenArchetype) -> some View {
        VStack(spacing: 20) {
            Text("Your Primary Archetype:")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.7))
            
            VStack(spacing: 12) {
                Text(archetype.icon)
                    .font(.system(size: 60))
                
                Text(archetype.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(archetype.color)
                
                Text(archetype.description)
                    .font(.body)
                    .foregroundStyle(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(archetype.color.opacity(0.2))
            .cornerRadius(16)
            
            Button(action: { 
                assessmentComplete = false
                resultArchetype = nil
            }) {
                Text("Retake Assessment")
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: "FFD700"))
            }
        }
    }
}

struct ArchetypeCard: View {
    let archetype: ChosenArchetype
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(archetype.icon)
                    .font(.title)
                
                Text(archetype.name)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(archetype.color.opacity(0.2))
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

struct ArchetypeDetailView: View {
    let archetype: ChosenArchetype
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), archetype.color.opacity(0.3)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Text(archetype.icon)
                            .font(.system(size: 80))
                            .padding(.top, 20)
                        
                        Text(archetype.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(archetype.color)
                        
                        Text(archetype.description)
                            .font(.title3)
                            .foregroundStyle(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // Traits
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🔹 KEY TRAITS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.white.opacity(0.6))
                            
                            HStack {
                                ForEach(archetype.traits, id: \.self) { trait in
                                    Text(trait)
                                        .font(.caption)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(archetype.color.opacity(0.3))
                                        .cornerRadius(20)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        
                        // Mission
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🎯 YOUR MISSION")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(archetype.color)
                            
                            Text(archetype.mission)
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                                .lineSpacing(4)
                        }
                        .padding()
                        .background(archetype.color.opacity(0.1))
                        .cornerRadius(12)
                        
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
}

struct ArchetypeAssessmentView: View {
    let onComplete: (ChosenArchetype) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var currentQuestion = 0
    @State private var scores: [String: Int] = [
        "Prophet": 0, "Hermit": 0, "Healer": 0, "Empath": 0,
        "Endurer": 0, "Rebel": 0, "Warrior": 0, "Seeker": 0
    ]
    
    let questions: [(question: String, answers: [(text: String, archetype: String)])] = [
        ("When you see injustice, your first instinct is to:", [
            ("Speak out publicly about it", "Prophet"),
            ("Reflect deeply on its meaning", "Hermit"),
            ("Help those affected", "Healer"),
            ("Feel their pain intensely", "Empath")
        ]),
        ("In groups, you tend to:", [
            ("Challenge the status quo", "Rebel"),
            ("Protect the vulnerable", "Warrior"),
            ("Ask probing questions", "Seeker"),
            ("Observe patterns others miss", "Prophet")
        ]),
        ("Your greatest strength is:", [
            ("Resilience through hardship", "Endurer"),
            ("Deep inner wisdom", "Hermit"),
            ("Transforming others' pain", "Healer"),
            ("Feeling the collective mood", "Empath")
        ]),
        ("When you learn a hidden truth, you:", [
            ("Must share it with others", "Prophet"),
            ("Dig deeper to understand fully", "Seeker"),
            ("Consider how to use it to help", "Healer"),
            ("Feel the weight of knowing", "Empath")
        ])
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "0a0a1a").ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Question \(currentQuestion + 1) of \(questions.count)")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    Text(questions[currentQuestion].question)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    VStack(spacing: 12) {
                        ForEach(questions[currentQuestion].answers.indices, id: \.self) { index in
                            let answer = questions[currentQuestion].answers[index]
                            Button(action: {
                                scores[answer.archetype, default: 0] += 1
                                
                                if currentQuestion < questions.count - 1 {
                                    currentQuestion += 1
                                } else {
                                    // Find top archetype
                                    let topArchetype = scores.max(by: { $0.value < $1.value })?.key ?? "Seeker"
                                    let archetypes: [String: ChosenArchetype] = [
                                        "Prophet": ChosenArchetype(name: "The Prophet", icon: "👁️", description: "You see what others cannot.", traits: [], mission: "", color: Color(hex: "9B59B6")),
                                        "Hermit": ChosenArchetype(name: "The Hermit", icon: "🏔️", description: "You find wisdom in solitude.", traits: [], mission: "", color: Color(hex: "34495E")),
                                        "Healer": ChosenArchetype(name: "The Healer", icon: "💚", description: "You transform others' pain.", traits: [], mission: "", color: Color(hex: "27AE60")),
                                        "Empath": ChosenArchetype(name: "The Empath Soul", icon: "🌊", description: "You feel the collective field.", traits: [], mission: "", color: Color(hex: "3498DB")),
                                        "Endurer": ChosenArchetype(name: "The Endurer", icon: "⚔️", description: "Your scars are wisdom.", traits: [], mission: "", color: Color(hex: "7D3C98")),
                                        "Rebel": ChosenArchetype(name: "The Rebel", icon: "🔥", description: "You refuse to comply.", traits: [], mission: "", color: Color(hex: "E74C3C")),
                                        "Warrior": ChosenArchetype(name: "The Warrior", icon: "🛡️", description: "You defend the innocent.", traits: [], mission: "", color: Color(hex: "F39C12")),
                                        "Seeker": ChosenArchetype(name: "The Seeker", icon: "🔍", description: "You seek hidden truth.", traits: [], mission: "", color: Color(hex: "1ABC9C"))
                                    ]
                                    onComplete(archetypes[topArchetype]!)
                                    dismiss()
                                }
                            }) {
                                Text(answer.text)
                                    .font(.body)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.top, 40)
            }
            .navigationTitle("Archetype Assessment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") { dismiss() }
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    ChosenOneOracleView()
}
