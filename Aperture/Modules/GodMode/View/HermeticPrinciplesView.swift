// HermeticPrinciplesView.swift
// GodMode - The Seven Hermetic Principles
// "The Principles of Truth are Seven"

import SwiftUI

struct HermeticPrinciple: Identifiable {
    let id = UUID()
    let number: Int
    let name: String
    let icon: String
    let statement: String
    let explanation: String
    let application: String
    let color: Color
}

struct HermeticPrinciplesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPrinciple: HermeticPrinciple?
    
    let principles: [HermeticPrinciple] = [
        HermeticPrinciple(
            number: 1,
            name: "MENTALISM",
            icon: "🧠",
            statement: "THE ALL is MIND; The Universe is Mental.",
            explanation: "Everything that exists is a manifestation of Mind. The Universe itself is a mental creation held in the Mind of THE ALL. Your thoughts are creative—they participate in the same creative process that manifests reality.",
            application: "Treat your imagination as the workshop where reality is assembled. What you hold in mind, with feeling and conviction, shapes your experience.",
            color: Color(hex: "9B59B6")
        ),
        HermeticPrinciple(
            number: 2,
            name: "CORRESPONDENCE",
            icon: "🔮",
            statement: "As above, so below; as below, so above.",
            explanation: "The same patterns repeat across all planes of existence—physical, mental, spiritual. Understanding one level gives insight into the others. Your inner world reflects in your outer world.",
            application: "When you want to change your outer circumstances, first change the corresponding pattern within yourself.",
            color: Color(hex: "3498DB")
        ),
        HermeticPrinciple(
            number: 3,
            name: "VIBRATION",
            icon: "〰️",
            statement: "Nothing rests; everything moves; everything vibrates.",
            explanation: "All matter, energy, and spirit exist as vibration at different frequencies. What appears solid is actually vibrating energy. Thoughts and emotions have their own vibrational signatures.",
            application: "Consciously raise your vibration through gratitude, love, and positive thought. Your vibrational state attracts matching experiences.",
            color: Color(hex: "1ABC9C")
        ),
        HermeticPrinciple(
            number: 4,
            name: "POLARITY",
            icon: "☯️",
            statement: "Everything is Dual; everything has poles; opposites are identical in nature, different only in degree.",
            explanation: "Hot and cold are the same thing—temperature—at different degrees. Love and hate are the same emotion at different poles. This understanding enables mental transmutation.",
            application: "When facing negative states, remember they are just one pole of a spectrum. You can consciously move along the scale toward the positive pole.",
            color: Color(hex: "E74C3C")
        ),
        HermeticPrinciple(
            number: 5,
            name: "RHYTHM",
            icon: "🌊",
            statement: "Everything flows, out and in; everything has its tides; the pendulum-swing manifests in everything.",
            explanation: "Life moves in cycles. After expansion comes contraction. After highs come lows. The wise learn to use these rhythms rather than being used by them.",
            application: "During low points, remember the pendulum will swing back. During highs, prepare for the natural rhythm. Master timing.",
            color: Color(hex: "F39C12")
        ),
        HermeticPrinciple(
            number: 6,
            name: "CAUSE AND EFFECT",
            icon: "⚡",
            statement: "Every Cause has its Effect; every Effect has its Cause. Nothing escapes the Law.",
            explanation: "Most people are effects—pawns moved by external causes. The Master rises to a higher plane and becomes a Cause rather than being merely affected.",
            application: "Before reacting, pause. Choose your response consciously. Become a cause in your life rather than a victim of circumstance.",
            color: Color(hex: "2ECC71")
        ),
        HermeticPrinciple(
            number: 7,
            name: "GENDER",
            icon: "⚤",
            statement: "Gender is in everything; everything has its Masculine and Feminine Principles.",
            explanation: "Gender is not just physical sex—it is the interplay of active (masculine) and receptive (feminine) forces in all creation. Both are needed for creation on any plane.",
            application: "Create through the balance of will (masculine) and imagination (feminine). Direct your intention, then receive inspiration.",
            color: Color(hex: "E91E63")
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2e"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        headerSection
                        
                        ForEach(principles) { principle in
                            PrincipleCard(principle: principle) {
                                selectedPrinciple = principle
                            }
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("⚖️ Seven Principles")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
            .sheet(item: $selectedPrinciple) { principle in
                PrincipleDetailView(principle: principle)
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("⚗️")
                .font(.system(size: 50))
            
            Text("The Seven Hermetic Principles")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("Master keys to understanding reality")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)
    }
}

struct PrincipleCard: View {
    let principle: HermeticPrinciple
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(principle.icon)
                    .font(.title)
                    .frame(width: 50, height: 50)
                    .background(principle.color.opacity(0.2))
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(principle.number). \(principle.name)")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text(principle.statement)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [principle.color.opacity(0.2), principle.color.opacity(0.1)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

struct PrincipleDetailView: View {
    let principle: HermeticPrinciple
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), principle.color.opacity(0.2)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 16) {
                            Text(principle.icon)
                                .font(.system(size: 60))
                            
                            Text("\(principle.number). \(principle.name)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("\"\(principle.statement)\"")
                                .font(.body)
                                .italic()
                                .foregroundStyle(principle.color)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.vertical, 20)
                        
                        // Explanation
                        VStack(alignment: .leading, spacing: 12) {
                            Text("📖 EXPLANATION")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.white.opacity(0.6))
                            
                            Text(principle.explanation)
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                                .lineSpacing(4)
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        
                        // Application
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🎯 DAILY APPLICATION")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(principle.color)
                            
                            Text(principle.application)
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                                .lineSpacing(4)
                        }
                        .padding()
                        .background(principle.color.opacity(0.1))
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

#Preview {
    HermeticPrinciplesView()
}
