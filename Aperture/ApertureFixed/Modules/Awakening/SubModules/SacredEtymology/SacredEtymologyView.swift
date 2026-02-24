// SacredEtymologyView.swift
// Sacred Etymology - The Hidden Meaning of Words
// Decoding the Egyptian origins of biblical terms

import SwiftUI

// MARK: - Sacred Word Model
struct SacredWord: Identifiable {
    let id = UUID()
    let word: String
    let hiddenMeaning: String
    let breakdown: [(part: String, meaning: String, origin: String)]
    let revelation: String
    let category: String
}

// MARK: - Main View
struct SacredEtymologyView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = 0
    @State private var selectedWord: SacredWord?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Ancient gold gradient
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a0a"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Picker("Section", selection: $selectedTab) {
                        Text("Israel").tag(0)
                        Text("Angels").tag(1)
                        Text("El Words").tag(2)
                        Text("Decode").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedTab) {
                        israelTab.tag(0)
                        angelsTab.tag(1)
                        elWordsTab.tag(2)
                        decodeTab.tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("📜 Sacred Etymology")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    // MARK: - Israel Tab
    private var israelTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("✡️")
                        .font(.system(size: 60))
                    
                    Text("ISRAEL")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "FFD700"), Color(hex: "FFA500")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("An Egyptian Word, Not Hebrew")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // The Revelation
                VStack(alignment: .leading, spacing: 16) {
                    Text("💣 THE TRUTH")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "E74C3C"))
                        .tracking(2)
                    
                    Text("Israel is NOT a Jewish word.")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Israel has nothing whatsoever to do with the country in the Middle East. The word Israel is in THREE PARTS. It's an Egyptian word.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                }
                .padding()
                .background(Color(hex: "E74C3C").opacity(0.1))
                .cornerRadius(12)
                
                // The Breakdown
                VStack(spacing: 20) {
                    Text("🔓 THE BREAKDOWN")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                        .tracking(2)
                    
                    // IS
                    etymologyCard(
                        part: "IS",
                        god: "ISIS",
                        meaning: "The Spirit",
                        description: "The feminine principle in the body. The goddess ISIS represents your spiritual essence.",
                        color: Color(hex: "9B59B6"),
                        icon: "🌙"
                    )
                    
                    Text("+")
                        .font(.title)
                        .foregroundStyle(Color(hex: "FFD700"))
                    
                    // RA
                    etymologyCard(
                        part: "RA",
                        god: "RA",
                        meaning: "The Mind",
                        description: "The sun god RA represents your consciousness, your mental faculty, your intellect.",
                        color: Color(hex: "F39C12"),
                        icon: "☀️"
                    )
                    
                    Text("+")
                        .font(.title)
                        .foregroundStyle(Color(hex: "FFD700"))
                    
                    // EL
                    etymologyCard(
                        part: "EL",
                        god: "EL",
                        meaning: "God Impulse",
                        description: "The god impulse within you. The divine spark that connects you to the higher realms.",
                        color: Color(hex: "3498DB"),
                        icon: "⚡"
                    )
                }
                
                // The Full Meaning
                VStack(alignment: .leading, spacing: 12) {
                    Text("✨ THE TRUE MEANING")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "27AE60"))
                        .tracking(2)
                    
                    Text("IS + RA + EL = ISRAEL")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: "FFD700"))
                    
                    Text("When there is HARMONY between your Spirit (Isis) and your Mind (Ra), then there is GOD (El) in you.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text("Israel is not a place on a map. Israel is a STATE OF BEING—the alignment of spirit, mind, and divine impulse within YOU.")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(hex: "27AE60"))
                }
                .padding()
                .background(Color(hex: "27AE60").opacity(0.1))
                .cornerRadius(12)
                
                // Three Egyptian Gods
                VStack(alignment: .leading, spacing: 12) {
                    Text("🏛️ THE THREE GODS OF EGYPT")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    HStack(spacing: 16) {
                        godCard(name: "ISIS", role: "Spirit/Feminine", icon: "🌙")
                        godCard(name: "RA", role: "Mind/Solar", icon: "☀️")
                        godCard(name: "EL", role: "Divine/God", icon: "⚡")
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Angels Tab
    private var angelsTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("👼")
                        .font(.system(size: 60))
                    
                    Text("The Angels End in EL")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Because EL is the God Impulse")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // What is an Angel?
                VStack(alignment: .leading, spacing: 16) {
                    Text("❓ WHAT IS AN ANGEL?")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "3498DB"))
                        .tracking(2)
                    
                    Text("An ANGEL is the god impulse in you.")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Notice the word ANGEL ends in EL. That's because it represents the divine impulse—that good idea that suddenly comes to you, that moment when you finally remember what you're supposed to do.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text("An angel is an impulse that comes from your higher mind—from the electromagnetic field of the right hemisphere of your brain.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color(hex: "3498DB").opacity(0.1))
                .cornerRadius(12)
                
                // The Angels
                VStack(alignment: .leading, spacing: 16) {
                    Text("✨ THE ARCHANGELS")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                        .tracking(2)
                    
                    angelCard(
                        name: "GABRI-EL",
                        meaning: "God is my strength",
                        role: "Messenger, Announcer",
                        color: Color(hex: "9B59B6")
                    )
                    
                    angelCard(
                        name: "RAPHA-EL",
                        meaning: "God heals",
                        role: "Healer, Guide",
                        color: Color(hex: "27AE60")
                    )
                    
                    angelCard(
                        name: "URI-EL",
                        meaning: "Light of God",
                        role: "Wisdom, Illumination",
                        color: Color(hex: "F39C12")
                    )
                    
                    angelCard(
                        name: "MICHA-EL",
                        meaning: "Who is like God",
                        role: "Protection, Justice",
                        color: Color(hex: "E74C3C")
                    )
                }
                
                // The Pattern
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔮 THE PATTERN")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    Text("Every angel name ends in EL because they all represent different aspects of the God impulse working through you:")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    patternItem("Gabri-EL: The impulse to communicate truth")
                    patternItem("Rapha-EL: The impulse to heal")
                    patternItem("Uri-EL: The impulse of illumination")
                    patternItem("Micha-EL: The impulse to protect and defend")
                    patternItem("Samu-EL: The impulse to hear God")
                    patternItem("Dani-EL: The impulse of divine judgment")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - EL Words Tab
    private var elWordsTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("⚡ WORDS ENDING IN EL")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "FFD700"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // EL Explanation
                VStack(alignment: .leading, spacing: 12) {
                    Text("EL = The God Impulse")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: "FFD700"))
                    
                    Text("Throughout ancient languages, words ending in EL often contain references to divinity, spiritual concepts, or higher forces.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                }
                .padding()
                .background(Color(hex: "FFD700").opacity(0.1))
                .cornerRadius(12)
                
                // EL Words
                ForEach(elWords, id: \.word) { item in
                    elWordCard(word: item.word, meaning: item.meaning, note: item.note)
                }
                
                // Biblical Names
                VStack(alignment: .leading, spacing: 16) {
                    Text("📖 BIBLICAL NAMES WITH EL")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    biblicalNameRow("Isra-EL", "When spirit & mind align, God is present")
                    biblicalNameRow("Samu-EL", "Heard by God / Name of God")
                    biblicalNameRow("Dani-EL", "God is my judge")
                    biblicalNameRow("Ezeki-EL", "God strengthens")
                    biblicalNameRow("Jo-EL", "Yahweh is God")
                    biblicalNameRow("Immanu-EL", "God is with us")
                    biblicalNameRow("Beth-EL", "House of God")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Decode Tab
    private var decodeTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🔍 DEEPER DECODING")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "9B59B6"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // The Allegory
                VStack(alignment: .leading, spacing: 16) {
                    Text("📜 THE ALLEGORICAL MEANING")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("When scripture speaks of 'Russia (Rosh) coming down to attack Israel,' it's not about geopolitics. It's about YOUR inner battle:")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        allegoryRow(
                            symbol: "Russia/Rosh",
                            meaning: "The emotions, the lower impulses",
                            icon: "🔥"
                        )
                        
                        allegoryRow(
                            symbol: "Attacking Israel",
                            meaning: "Coming against your spirit-mind-god alignment",
                            icon: "⚔️"
                        )
                        
                        allegoryRow(
                            symbol: "Fire from Heaven",
                            meaning: "Spiritual impulses from higher consciousness",
                            icon: "⚡"
                        )
                        
                        allegoryRow(
                            symbol: "Destroying enemies",
                            meaning: "Higher awareness dissolving lower impulses",
                            icon: "✨"
                        )
                    }
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                // The Inner Battle
                VStack(alignment: .leading, spacing: 12) {
                    Text("⚔️ THE INNER BATTLE")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("All biblical 'wars' are allegories for the battle within:")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    innerBattleRow("Lower emotions", "vs", "Higher consciousness")
                    innerBattleRow("Reactive mind", "vs", "Responsive awareness")
                    innerBattleRow("Animal instincts", "vs", "Divine impulses")
                    innerBattleRow("Ego/Fear", "vs", "Spirit/Love")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Key Insight
                VStack(spacing: 12) {
                    Text("💎 KEY INSIGHT")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                    
                    Text("You ARE Israel when your spirit, mind, and divine impulse are in harmony.")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("The 'Promised Land' is not a geographic location—it's the state of consciousness where you live from your highest self.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(Color(hex: "FFD700").opacity(0.1))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Helper Data
    private var elWords: [(word: String, meaning: String, note: String)] {
        [
            ("Angel", "Messenger of God", "Ang-EL = God's impulse"),
            ("Gospel", "Good news", "Go-sp-EL = Good spell/word of God"),
            ("Chapel", "Place of worship", "Chap-EL = Place of God"),
            ("Parallel", "Side by side", "Parall-EL = Beside God"),
            ("Carousel", "Circular motion", "Carous-EL = God's circle"),
            ("Citadel", "Fortress", "Citad-EL = City of God"),
            ("Evangelical", "Of the gospel", "Evangel-ical = God's message"),
        ]
    }
    
    // MARK: - Helper Views
    private func etymologyCard(part: String, god: String, meaning: String, description: String, color: Color, icon: String) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text(icon)
                    .font(.title)
                Text(part)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(color)
            }
            
            Text(god)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Text(meaning)
                .font(.subheadline)
                .foregroundStyle(color)
            
            Text(description)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func godCard(name: String, role: String, icon: String) -> some View {
        VStack(spacing: 8) {
            Text(icon)
                .font(.title)
            Text(name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "FFD700"))
            Text(role)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
    }
    
    private func angelCard(name: String, meaning: String, role: String, color: Color) -> some View {
        HStack(spacing: 16) {
            Text("👼")
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(color)
                Text(meaning)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
                Text(role)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.6))
            }
            
            Spacer()
            
            Text("EL")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(color)
                .cornerRadius(8)
        }
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func patternItem(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundStyle(Color(hex: "FFD700"))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func elWordCard(word: String, meaning: String, note: String) -> some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(word)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(meaning)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
            
            Spacer()
            
            Text(note)
                .font(.caption2)
                .foregroundStyle(Color(hex: "FFD700"))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func biblicalNameRow(_ name: String, _ meaning: String) -> some View {
        HStack {
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(hex: "FFD700"))
                .frame(width: 100, alignment: .leading)
            Text(meaning)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
    
    private func allegoryRow(symbol: String, meaning: String, icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(icon)
                .font(.title3)
            VStack(alignment: .leading, spacing: 2) {
                Text(symbol)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text("= \(meaning)")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
    
    private func innerBattleRow(_ left: String, _ vs: String, _ right: String) -> some View {
        HStack {
            Text(left)
                .font(.caption)
                .foregroundStyle(Color(hex: "E74C3C"))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text(vs)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
            Text(right)
                .font(.caption)
                .foregroundStyle(Color(hex: "27AE60"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SacredEtymologyView()
}
