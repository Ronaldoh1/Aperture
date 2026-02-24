// GnosticTextsView.swift
// GodMode - Gospel of Thomas & Hidden Wisdom

import SwiftUI

struct GnosticSaying: Identifiable {
    let id = UUID()
    let number: Int
    let text: String
    let interpretation: String
}

struct GnosticTextsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSaying: GnosticSaying?
    
    let sayings: [GnosticSaying] = [
        GnosticSaying(number: 1, text: "Whoever discovers the interpretation of these sayings will not taste death.", interpretation: "True understanding of these teachings leads to spiritual immortality—the death of illusion, not the body."),
        GnosticSaying(number: 2, text: "Let one who seeks not stop seeking until one finds.", interpretation: "The search for truth is relentless. Don't settle for comfortable illusions."),
        GnosticSaying(number: 3, text: "The Kingdom is inside you and outside you. When you know yourselves, then you will be known.", interpretation: "Heaven is not a place but a state of consciousness. Self-knowledge is the key."),
        GnosticSaying(number: 22, text: "When you make the two into one, and when you make the inner like the outer... then you will enter the Kingdom.", interpretation: "Unity consciousness—transcending duality—is enlightenment."),
        GnosticSaying(number: 70, text: "If you bring forth what is within you, what you bring forth will save you.", interpretation: "Express your authentic self. Suppression destroys; expression liberates."),
        GnosticSaying(number: 77, text: "I am the light that is over all things. Split a piece of wood; I am there.", interpretation: "Divine consciousness permeates all existence. God is not separate from creation."),
        GnosticSaying(number: 108, text: "Whoever drinks from my mouth will become like me; I myself shall become that person.", interpretation: "Direct transmission of wisdom creates unity with the source."),
        GnosticSaying(number: 113, text: "The Kingdom of the Father is spread out upon the earth, and people don't see it.", interpretation: "Paradise is here now, hidden in plain sight from those still asleep."),
        GnosticSaying(number: 114, text: "Every female who makes herself male will enter the Kingdom of Heaven.", interpretation: "Transcend the limitations of gender identity. Realize your androgynous divine nature."),
        GnosticSaying(number: 50, text: "If they say to you, 'Where do you come from?' say to them, 'We have come from the light.'", interpretation: "Remember your divine origin. You are a spark of the infinite light.")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a2e")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        headerSection
                        historySection
                        sayingsSection
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("📿 Gnostic Texts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
            .sheet(item: $selectedSaying) { saying in
                SayingDetailView(saying: saying)
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("📜")
                .font(.system(size: 50))
            
            Text("The Gospel of Thomas")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("The Secret Sayings of Jesus")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)
    }
    
    private var historySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📚 WHY THEY HID IT")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
            
            VStack(alignment: .leading, spacing: 16) {
                TimelineItem(year: "180 AD", event: "Church Father Irenaeus attacks 'Gnostic heresies'")
                TimelineItem(year: "325 AD", event: "Council of Nicaea establishes orthodox canon")
                TimelineItem(year: "367 AD", event: "Bishop Athanasius orders destruction of non-canonical texts")
                TimelineItem(year: "1945", event: "Nag Hammadi Library discovered in Egypt")
                TimelineItem(year: "1977", event: "First complete English translation published")
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    private var sayingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("✨ 10 KEY SAYINGS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
            
            ForEach(sayings) { saying in
                Button(action: { selectedSaying = saying }) {
                    HStack(spacing: 12) {
                        Text("\(saying.number)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "FFD700"))
                            .frame(width: 30)
                        
                        Text(saying.text)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.9))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.4))
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct TimelineItem: View {
    let year: String
    let event: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(year)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "FFD700"))
                .frame(width: 60, alignment: .leading)
            
            Text(event)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
}

struct SayingDetailView: View {
    let saying: GnosticSaying
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a2e")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Text("Saying \(saying.number)")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "FFD700"))
                            .padding(.top, 20)
                        
                        Text("\"\(saying.text)\"")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color(hex: "FFD700").opacity(0.1))
                            .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🔍 INTERPRETATION")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.white.opacity(0.6))
                            
                            Text(saying.interpretation)
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                                .lineSpacing(4)
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        
                        Spacer()
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
    GnosticTextsView()
}
