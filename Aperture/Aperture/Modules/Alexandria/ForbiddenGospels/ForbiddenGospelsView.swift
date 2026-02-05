// ForbiddenGospelsView.swift
// The Gospels They Hid From Everyone
// Accessible from both Dragon Descent → GnosticRevelationView and Alexandria
// ☀️ SunFlow: Reignited

import SwiftUI

struct ForbiddenGospelsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var expandedGospel: String?
    @State private var hasAppeared = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // Deep crimson-black background
                LinearGradient(
                    colors: [
                        Color(hex: "0a0a0f"),
                        Color(hex: "1a0a0a"),
                        Color(hex: "0a0a0f")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Subtle ember particles
                ForEach(0..<30, id: \.self) { i in
                    Circle()
                        .fill(Color.red.opacity(Double.random(in: 0.1...0.3)))
                        .frame(width: CGFloat.random(in: 1...2.5))
                        .position(
                            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                        )
                        .blur(radius: Double.random(in: 0.5...1.5))
                }
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 28) {
                        
                        headerSection
                        
                        theLieSection
                        
                        gospelsSection
                        
                        whyHiddenSection
                        
                        theEchoSection
                        
                        dragonClosingSection
                        
                        Spacer(minLength: 60)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                }
                
            }
            .navigationTitle("Forbidden Gospels")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.8)) {
                    hasAppeared = true
                }
            }
            
        }
        
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        
        VStack(spacing: 16) {
            
            // Sealed book icon with glow
            ZStack {
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.red.opacity(0.3),
                                Color.red.opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 70
                        )
                    )
                    .frame(width: 140, height: 140)
                
                Image(systemName: "lock.open.trianglebadge.exclamationmark")
                    .font(.system(size: 56, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.red, Color(red: 0.85, green: 0.2, blue: 0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Color.red.opacity(0.5), radius: 10)
                
            }
            
            Text("THE FORBIDDEN GOSPELS")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(6)
                .foregroundColor(Color.red.opacity(0.7))
            
            Text("Texts They Killed\nTo Keep Hidden")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            
            Text("Not all gospels were written to be read.\nSome were written — and that is why they were hidden.")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            
        }
        .opacity(hasAppeared ? 1 : 0)
        .offset(y: hasAppeared ? 0 : 20)
        
    }
    
    // MARK: - The Lie
    
    private var theLieSection: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            
            sectionHeader(icon: "exclamationmark.triangle.fill", title: "THE LIE", color: .orange)
            
            Text("When we think of the Gospels, we believe there are only four. Matthew. Mark. Luke. John. This is what every church, every school, every institution tells you.\n\nThis is not true.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .lineSpacing(6)
            
            Text("Many more existed — and were banned. Gospels that did not speak of obedience, but of knowledge. That preached not guilt, but awakening. That did not show a divinized, untouchable, distant Jesus — but a teacher who reminded human beings who they really were.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .lineSpacing(6)
            
        }
        .padding(18)
        .background(sectionBackground(color: .orange))
        .opacity(hasAppeared ? 1 : 0)
        .animation(.easeOut(duration: 0.5).delay(0.2), value: hasAppeared)
        
    }
    
    // MARK: - The Gospels
    
    private var gospelsSection: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            sectionHeader(icon: "book.closed.fill", title: "THE BANNED TEXTS", color: Color.red)
            
            Text("These are the voices Rome tried to silence forever:")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
            
            // Gospel of Thomas
            gospelCard(
                name: "Gospel of Thomas",
                icon: "light.beacon.max.fill",
                tagline: "114 sayings of a teacher, not a god-king",
                description: "No miracles. No crucifixion narrative. No Church. Just direct teachings:\n\n\"If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you.\"\n\nThis is not a gospel of worship. It is a gospel of SELF-KNOWLEDGE. The kingdom is not in heaven — it is spread upon the earth, and people do not see it.",
                color: Palette.accent.gold
            )
            
            // Gospel of Mary Magdalene
            gospelCard(
                name: "Gospel of Mary Magdalene",
                icon: "sparkles",
                tagline: "The apostle they erased and called a prostitute",
                description: "Mary was not a prostitute — that was a deliberate smear by Pope Gregory I in 591 CE. She was the primary disciple. The one who understood.\n\nIn her gospel, she teaches that sin does not exist as an external force but as a product of confused attachment. She speaks of ascending through layers of ignorance — the same journey the Gnostics mapped.\n\nPeter challenged her authority. The Church sided with Peter. The rest is 2000 years of silenced feminine wisdom.",
                color: Color.purple
            )
            
            // Gospel of Philip
            gospelCard(
                name: "Gospel of Philip",
                icon: "flame.fill",
                tagline: "The sacrament of inner marriage",
                description: "Philip speaks of the \"Bridal Chamber\" — not a physical marriage, but the reunification of the divided self. The masculine and feminine within, becoming whole.\n\nHe describes how names and labels are deceptions: \"The names given to worldly things are very deceptive, for they divert our thoughts from what is correct to what is incorrect.\"\n\nThe Church needed separation — sacred vs profane, clergy vs laity, man vs woman. Philip taught UNITY. That was unforgivable.",
                color: Color(red: 0.85, green: 0.5, blue: 0.2)
            )
            
            // Gospel of Judas
            gospelCard(
                name: "Gospel of Judas",
                icon: "eye.trianglebadge.exclamationmark",
                tagline: "The betrayer was the only one who understood",
                description: "The most dangerous text of all. In this gospel, Judas is not the villain — he is the ONLY disciple who truly understands Jesus's teaching.\n\nJesus laughs at the other disciples for worshipping the Demiurge and following empty rituals. He tells Judas alone the truth about the cosmic hierarchy.\n\nThe \"betrayal\" was not a betrayal — it was the final act of a student who understood the mission. If this is true, the entire foundation of guilt-based Christianity collapses.",
                color: Color.red
            )
            
        }
        .padding(18)
        .background(sectionBackground(color: .red))
        .opacity(hasAppeared ? 1 : 0)
        .animation(.easeOut(duration: 0.5).delay(0.4), value: hasAppeared)
        
    }
    
    // MARK: - Why They Were Hidden
    
    private var whyHiddenSection: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            
            sectionHeader(icon: "eye.slash.fill", title: "WHY THEY WERE HIDDEN", color: Palette.primary.cyan)
            
            Text("Because they were dangerous to power.")
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .foregroundColor(Palette.primary.cyan)
            
            VStack(alignment: .leading, spacing: 12) {
                
                reasonRow(
                    text: "A people who KNOW do not need intermediaries.",
                    emphasis: "Not easy to control."
                )
                
                reasonRow(
                    text: "A soul that awakens does not obey out of fear.",
                    emphasis: "Not easy to govern."
                )
                
                reasonRow(
                    text: "A conscious human being questions authority.",
                    emphasis: "Not easy to exploit."
                )
                
            }
            
            Text("When Christianity became the official religion of the Empire, spirituality was no longer an experience — it became a doctrine. The gospels that did not uphold guilt, eternal sacrifice, and the authority of the Church were branded as heresy.\n\nNot because they were fake.\nBut because they were too free.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .lineSpacing(6)
            
            Text("This is how the truth was edited.\nThe message was tamed.\nAnd faith became a golden cage.")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(Palette.primary.cyan)
                .lineSpacing(4)
                .padding(.top, 4)
            
        }
        .padding(18)
        .background(sectionBackground(color: Palette.primary.cyan))
        .opacity(hasAppeared ? 1 : 0)
        .animation(.easeOut(duration: 0.5).delay(0.6), value: hasAppeared)
        
    }
    
    // MARK: - The Echo
    
    private var theEchoSection: some View {
        
        VStack(spacing: 16) {
            
            sectionHeader(icon: "waveform", title: "THE ECHO THAT NEVER DIES", color: Palette.accent.gold)
            
            Text("But the forbidden does not disappear.\nIt just waits.")
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 10) {
                
                echoLine("Every time someone questions...")
                echoLine("Every time someone feels that something doesn't fit...")
                echoLine("Every time someone senses that the divine does not live in temples but in consciousness...")
                
            }
            
            Text("...the echo of these silenced texts is heard again.")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .multilineTextAlignment(.center)
                .padding(.top, 4)
            
        }
        .padding(18)
        .background(sectionBackground(color: Palette.accent.gold))
        .opacity(hasAppeared ? 1 : 0)
        .animation(.easeOut(duration: 0.5).delay(0.8), value: hasAppeared)
        
    }
    
    // MARK: - Dragon Closing
    
    private var dragonClosingSection: some View {
        
        VStack(spacing: 16) {
            
            HStack(alignment: .top, spacing: 12) {
                
                Text("🐉☀️")
                    .font(.system(size: 28))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Perhaps the forbidden gospels were not hidden to protect God.")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .lineSpacing(4)
                    
                    Text("But so that human beings would not remember who THEY are.")
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                        .lineSpacing(4)
                    
                    Text("That is the echo of a truth that can never be hidden.")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                        .italic()
                        .padding(.top, 6)
                    
                }
                
            }
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.12),
                                Color.red.opacity(0.08),
                                Palette.accent.gold.opacity(0.06)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Palette.accent.gold.opacity(0.4),
                                        Color.red.opacity(0.2),
                                        Palette.accent.gold.opacity(0.3)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
            )
            .shadow(color: Palette.accent.gold.opacity(0.2), radius: 15)
            
        }
        .opacity(hasAppeared ? 1 : 0)
        .animation(.easeOut(duration: 0.6).delay(1.0), value: hasAppeared)
        
    }
    
    // MARK: - Helper Components
    
    private func sectionHeader(icon: String, title: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(color)
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(3)
                .foregroundColor(color)
            Spacer()
        }
    }
    
    private func sectionBackground(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(color.opacity(0.06))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(color.opacity(0.2), lineWidth: 1)
            )
    }
    
    private func gospelCard(name: String, icon: String, tagline: String, description: String, color: Color) -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Header (always visible)
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    if expandedGospel == name {
                        expandedGospel = nil
                    } else {
                        expandedGospel = name
                    }
                }
            }) {
                HStack(spacing: 12) {
                    
                    ZStack {
                        Circle()
                            .fill(color.opacity(0.15))
                            .frame(width: 40, height: 40)
                        Image(systemName: icon)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(color)
                    }
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(name)
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text(tagline)
                            .font(.system(size: 11, weight: .medium, design: .rounded))
                            .foregroundColor(color.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    Image(systemName: expandedGospel == name ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(color.opacity(0.6))
                    
                }
                .padding(14)
            }
            .buttonStyle(.plain)
            
            // Expanded content
            if expandedGospel == name {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Rectangle()
                        .fill(color.opacity(0.2))
                        .frame(height: 1)
                    
                    Text(description)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                        .lineSpacing(6)
                        .padding(14)
                    
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
                
            }
            
        }
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(color.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(color.opacity(expandedGospel == name ? 0.4 : 0.15), lineWidth: 1)
                )
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
    
    private func reasonRow(text: String, emphasis: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Palette.primary.cyan)
                .frame(width: 6, height: 6)
                .padding(.top, 7)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(text)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                Text(emphasis)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.primary.cyan)
            }
        }
    }
    
    private func echoLine(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "waveform")
                .font(.system(size: 10))
                .foregroundColor(Palette.accent.gold.opacity(0.5))
            Text(text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
                .italic()
        }
    }
    
}

// MARK: - Preview

#Preview {
    ForbiddenGospelsView()
}
