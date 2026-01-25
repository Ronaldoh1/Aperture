// DragonNamingView.swift
// Generate a meaningful name for your dragon based on your birth chart
// Your dragon's name carries the energy of your cosmic blueprint

import SwiftUI

struct DragonNamingView: View {

    let profile: UserProfileData
    let onNameSelected: (String) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var customName: String = ""
    @State private var selectedSuggestion: String?
    @State private var isGenerating: Bool = true
    @State private var suggestions: [DragonNameSuggestion] = []
    @State private var showingMeaning: DragonNameSuggestion?

    var body: some View {

        NavigationStack {

            ZStack {

                cosmicBackground

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 28) {

                        headerSection

                        if isGenerating {
                            generatingAnimation
                        } else {
                            suggestionsSection
                            customNameSection
                        }

                        Spacer(minLength: 100)

                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                }

            }
            .navigationTitle("Name Your Dragon")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Skip") {
                        onNameSelected("\(profile.displayName)'s Dragon")
                        dismiss()
                    }
                    .foregroundColor(Palette.text.muted)
                }
            }
            .sheet(item: $showingMeaning) { suggestion in
                NameMeaningSheet(suggestion: suggestion)
            }
            .onAppear {
                generateNames()
            }

        }

    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.accent.gold.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 120, height: 120)

                Text("🐉")
                    .font(.system(size: 60))
            }

            Text("Your Dragon Awaits a Name")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            if let zodiac = profile.zodiacSign {
                HStack(spacing: 8) {
                    Text(zodiac.symbol)
                        .font(.system(size: 20))
                    Text(zodiac.rawValue)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(zodiac.element.color)
                    Text("•")
                        .foregroundColor(Palette.text.muted)
                    Text(profile.awakeningMotivation.suggestedElement.rawValue)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(profile.awakeningMotivation.suggestedElement.color)
                }
            }

            Text("Based on your birth chart and awakening path, we've channeled names that resonate with your cosmic energy.")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)

        }

    }

    // MARK: - Generating Animation

    private var generatingAnimation: some View {

        VStack(spacing: 20) {

            ZStack {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 2)
                        .frame(width: CGFloat(60 + i * 30), height: CGFloat(60 + i * 30))
                        .rotationEffect(.degrees(Double(i) * 30))
                }

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Palette.accent.gold))
                    .scaleEffect(1.2)
            }
            .frame(height: 150)

            Text("Consulting the stars...")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

        }
        .padding(.vertical, 40)

    }

    // MARK: - Suggestions

    private var suggestionsSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("COSMIC SUGGESTIONS")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(1)

                Spacer()

                Button(action: generateNames) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.clockwise")
                        Text("Regenerate")
                    }
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
                }
            }

            ForEach(suggestions) { suggestion in
                nameSuggestionCard(suggestion)
            }

        }

    }

    private func nameSuggestionCard(_ suggestion: DragonNameSuggestion) -> some View {

        let isSelected = selectedSuggestion == suggestion.name

        return Button(action: {
            withAnimation(.spring(response: 0.3)) {
                selectedSuggestion = suggestion.name
                customName = ""
            }
        }) {

            HStack(spacing: 14) {

                // Element icon
                ZStack {
                    Circle()
                        .fill(suggestion.element.color.opacity(0.2))
                        .frame(width: 44, height: 44)

                    Image(systemName: suggestion.element.icon)
                        .font(.system(size: 18))
                        .foregroundColor(suggestion.element.color)
                }

                VStack(alignment: .leading, spacing: 4) {

                    Text(suggestion.name)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(isSelected ? suggestion.element.color : .white)

                    Text(suggestion.shortMeaning)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .lineLimit(1)

                }

                Spacer()

                // Info button
                Button(action: { showingMeaning = suggestion }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 18))
                        .foregroundColor(Palette.text.muted)
                }

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(suggestion.element.color)
                }

            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? suggestion.element.color.opacity(0.15) : Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isSelected ? suggestion.element.color.opacity(0.5) : Color.clear, lineWidth: 2)
                    )
            )

        }

    }

    // MARK: - Custom Name

    private var customNameSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("OR CREATE YOUR OWN")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            TextField("Enter a name...", text: $customName)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.08))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(customName.isEmpty ? Color.clear : Palette.accent.gold.opacity(0.5), lineWidth: 2)
                        )
                )
                .onChange(of: customName) { _, newValue in
                    if !newValue.isEmpty {
                        selectedSuggestion = nil
                    }
                }

            // Confirm button
            Button(action: confirmName) {
                HStack(spacing: 10) {
                    Image(systemName: "sparkles")
                    Text("Confirm Name")
                }
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: canConfirm ? [Palette.accent.gold, Palette.primary.orange] : [Color.gray.opacity(0.3), Color.gray.opacity(0.2)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(14)
            }
            .disabled(!canConfirm)

        }

    }

    private var canConfirm: Bool {
        !customName.isEmpty || selectedSuggestion != nil
    }

    // MARK: - Background

    private var cosmicBackground: some View {

        ZStack {

            Color.black.ignoresSafeArea()

            ForEach(0..<50, id: \.self) { i in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat(i % 3 + 1))
                    .position(
                        x: CGFloat((i * 41) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 67) % Int(UIScreen.main.bounds.height))
                    )
                    .opacity(0.3)
            }

        }

    }

    // MARK: - Actions

    private func generateNames() {

        isGenerating = true
        suggestions = []

        // Simulate generation delay for effect
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            suggestions = DragonNameGenerator.generateNames(for: profile)
            withAnimation {
                isGenerating = false
            }
        }

    }

    private func confirmName() {

        let finalName = customName.isEmpty ? (selectedSuggestion ?? "\(profile.displayName)'s Dragon") : customName
        onNameSelected(finalName)
        dismiss()

    }

}

// MARK: - Name Meaning Sheet

struct NameMeaningSheet: View {

    let suggestion: DragonNameSuggestion
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 24) {

                        // Header
                        ZStack {
                            Circle()
                                .fill(suggestion.element.color.opacity(0.2))
                                .frame(width: 100, height: 100)

                            Image(systemName: suggestion.element.icon)
                                .font(.system(size: 44))
                                .foregroundColor(suggestion.element.color)
                        }

                        Text(suggestion.name)
                            .font(.system(size: 32, weight: .black, design: .rounded))
                            .foregroundColor(.white)

                        // Origin
                        VStack(spacing: 8) {
                            Text("ORIGIN")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Palette.text.muted)
                                .tracking(1)

                            Text(suggestion.origin)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(suggestion.element.color)
                        }

                        // Full meaning
                        VStack(alignment: .leading, spacing: 12) {

                            Text("MEANING")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Palette.text.muted)
                                .tracking(1)

                            Text(suggestion.fullMeaning)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                                .lineSpacing(4)

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.05))
                        )

                        // Why this name
                        VStack(alignment: .leading, spacing: 12) {

                            Text("WHY THIS NAME FOR YOU")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Palette.text.muted)
                                .tracking(1)

                            Text(suggestion.whyForYou)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                                .lineSpacing(4)

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(suggestion.element.color.opacity(0.1))
                        )

                        // Numerology
                        if let numerology = suggestion.numerology {
                            VStack(spacing: 8) {
                                Text("NUMEROLOGY")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Palette.text.muted)
                                    .tracking(1)

                                Text("\(numerology)")
                                    .font(.system(size: 36, weight: .black, design: .rounded))
                                    .foregroundColor(Palette.accent.gold)

                                Text(numerologyMeaning(numerology))
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(Palette.text.secondary)
                            }
                        }

                        Spacer(minLength: 50)

                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 30)

                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }

        }

    }

    private func numerologyMeaning(_ number: Int) -> String {
        switch number {
        case 1: return "Leadership, independence, new beginnings"
        case 2: return "Partnership, balance, intuition"
        case 3: return "Creativity, expression, joy - Tesla's divine"
        case 4: return "Foundation, stability, hard work"
        case 5: return "Change, freedom, adventure"
        case 6: return "Harmony, love, responsibility - Tesla's divine"
        case 7: return "Spirituality, wisdom, inner knowing"
        case 8: return "Abundance, power, manifestation"
        case 9: return "Completion, compassion, universal love - Tesla's divine"
        default: return "Infinite potential"
        }
    }

}

// MARK: - Name Suggestion Model

struct DragonNameSuggestion: Identifiable {

    let id = UUID()
    let name: String
    let shortMeaning: String
    let fullMeaning: String
    let origin: String
    let element: DragonElement
    let whyForYou: String
    let numerology: Int?

}

// MARK: - Name Generator

struct DragonNameGenerator {

    static func generateNames(for profile: UserProfileData) -> [DragonNameSuggestion] {

        var names: [DragonNameSuggestion] = []

        // 1. Zodiac-based name
        if let zodiac = profile.zodiacSign {
            names.append(zodiacName(for: zodiac, profile: profile))
        }

        // 2. Element-based name
        let element = profile.awakeningMotivation.suggestedElement
        names.append(elementName(for: element, profile: profile))

        // 3. Numerology-based name
        if let birthDate = profile.birthDate {
            names.append(numerologyName(for: birthDate, profile: profile))
        }

        // 4. Motivation-based name
        names.append(motivationName(for: profile.awakeningMotivation, profile: profile))

        // 5. Resonance-based name
        if let firstResonance = profile.resonatesWith.first {
            names.append(resonanceName(for: firstResonance, profile: profile))
        }

        return Array(names.prefix(5))

    }

    // MARK: - Zodiac Names

    private static func zodiacName(for zodiac: ZodiacSign, profile: UserProfileData) -> DragonNameSuggestion {

        let names: [ZodiacSign: (name: String, meaning: String, full: String)] = [
            .aries: ("Ignatius", "Born of fire", "From Latin 'ignis' (fire). Aries is the first fire sign, representing raw creative force and the courage to begin. Your dragon carries the spark that ignites new paths."),
            .taurus: ("Terragon", "Earth guardian", "Combining 'terra' (earth) and 'dragon'. Taurus grounds cosmic energy into material form. Your dragon embodies patient strength and the wisdom of nature."),
            .gemini: ("Zephyros", "West wind bearer", "The Greek god of the west wind. Gemini's air nature brings communication and adaptability. Your dragon carries messages between worlds."),
            .cancer: ("Lunara", "Moon blessed", "From 'luna' (moon). Cancer is ruled by the moon, governing intuition and emotional depth. Your dragon reflects the tides of inner knowing."),
            .leo: ("Solarius", "Sun sovereign", "From 'sol' (sun). Leo is ruled by the sun, radiating creative power and noble heart. Your dragon blazes with the light of authentic self-expression."),
            .virgo: ("Verdantis", "Ever-growing wisdom", "From 'verdant' (green/flourishing). Virgo's earth energy cultivates knowledge and service. Your dragon tends the garden of consciousness."),
            .libra: ("Harmonix", "Balance keeper", "From 'harmony'. Libra seeks equilibrium between opposing forces. Your dragon holds the scales of justice and beauty."),
            .scorpio: ("Nyx'ara", "Night transformer", "From 'Nyx' (Greek goddess of night). Scorpio's water runs deep, transforming shadow into power. Your dragon navigates the underworld."),
            .sagittarius: ("Arcanum", "Keeper of secrets", "From 'arcane' (mysterious knowledge). Sagittarius seeks truth across all horizons. Your dragon carries the arrow of higher wisdom."),
            .capricorn: ("Montagnis", "Mountain sovereign", "From 'montagne' (mountain). Capricorn climbs to mastery through discipline. Your dragon knows the long path to the summit."),
            .aquarius: ("Aethon", "Sky wanderer", "From 'aether' (upper air/heaven). Aquarius pours cosmic water of innovation. Your dragon flows beyond conventional boundaries."),
            .pisces: ("Oceanus", "Infinite depths", "The primordial sea in Greek mythology. Pisces dissolves into universal consciousness. Your dragon swims through dreams and visions.")
        ]

        let data = names[zodiac] ?? ("Stellara", "Star born", "Your dragon carries the light of distant stars.")

        return DragonNameSuggestion(
            name: data.name,
            shortMeaning: data.meaning,
            fullMeaning: data.full,
            origin: "\(zodiac.rawValue) (\(zodiac.element.rawValue) sign)",
            element: zodiac.element,
            whyForYou: "Your sun sign is \(zodiac.rawValue), a \(zodiac.element.rawValue) sign. This name resonates with your core cosmic identity and the energy you were born to express.",
            numerology: calculateNumerology(data.name)
        )

    }

    // MARK: - Element Names

    private static func elementName(for element: DragonElement, profile: UserProfileData) -> DragonNameSuggestion {

        let names: [DragonElement: (name: String, meaning: String, full: String)] = [
            .fire: ("Pyraxis", "Fire awakener", "From Greek 'pyr' (fire) and 'axis' (turning point). Fire transforms everything it touches, burning away illusion to reveal truth."),
            .water: ("Thalassar", "Deep current", "From Greek 'thalassa' (sea). Water finds its way around all obstacles, carrying ancient wisdom in its depths."),
            .earth: ("Gaiadon", "Earth protector", "From 'Gaia' (Earth goddess). Earth provides the foundation for all growth, patient and unshakeable."),
            .air: ("Ventaris", "Wind speaker", "From Latin 'ventus' (wind). Air carries thought and communication, connecting all minds across distance."),
            .void: ("Kenomis", "Void walker", "From Greek 'kenos' (empty/void). The void holds infinite potential, the space before creation."),
            .light: ("Luxaris", "Light bringer", "From Latin 'lux' (light). Light reveals what darkness conceals, the energy of truth and clarity."),
            .shadow: ("Umbranox", "Shadow weaver", "From Latin 'umbra' (shadow) and 'nox' (night). Shadow holds hidden wisdom, the teacher of depths."),
            .cosmic: ("Cosmara", "Star weaver", "From Greek 'kosmos' (universe/order). Cosmic energy connects all things in the grand pattern.")
        ]

        let data = names[element] ?? ("Elementis", "Primal force", "Your dragon embodies elemental power.")

        return DragonNameSuggestion(
            name: data.name,
            shortMeaning: data.meaning,
            fullMeaning: data.full,
            origin: "\(element.rawValue) Element",
            element: element,
            whyForYou: "Your awakening path resonates with \(element.rawValue) energy. You seek \(element.description.lowercased()). This dragon embodies the elemental force driving your transformation.",
            numerology: calculateNumerology(data.name)
        )

    }

    // MARK: - Numerology Names

    private static func numerologyName(for birthDate: Date, profile: UserProfileData) -> DragonNameSuggestion {

        let components = Calendar.current.dateComponents([.day, .month, .year], from: birthDate)
        let sum = (components.day ?? 0) + (components.month ?? 0) + (components.year ?? 0)
        let lifePathNumber = reduceToSingle(sum)

        let names: [Int: (name: String, meaning: String)] = [
            1: ("Primaris", "The first, the initiator"),
            2: ("Dualis", "The balancer, the partner"),
            3: ("Trionis", "The creator, the expressor"),
            4: ("Quadrix", "The builder, the foundation"),
            5: ("Quintara", "The changer, the adventurer"),
            6: ("Hexaris", "The harmonizer, the healer"),
            7: ("Septimus", "The seeker, the mystic"),
            8: ("Octarix", "The manifester, the powerful"),
            9: ("Novenix", "The completer, the humanitarian")
        ]

        let data = names[lifePathNumber] ?? ("Numeris", "Number keeper")

        let fullMeaning: String
        if [3, 6, 9].contains(lifePathNumber) {
            fullMeaning = "Your life path number is \(lifePathNumber) - one of Tesla's divine numbers! Tesla said: 'If you only knew the magnificence of 3, 6, and 9, you would have the key to the universe.' Your dragon carries this cosmic key."
        } else {
            fullMeaning = "Your life path number is \(lifePathNumber), representing \(data.meaning.lowercased()). This number shapes your soul's journey through this lifetime."
        }

        return DragonNameSuggestion(
            name: data.name,
            shortMeaning: data.meaning,
            fullMeaning: fullMeaning,
            origin: "Life Path Number \(lifePathNumber)",
            element: [3, 6, 9].contains(lifePathNumber) ? .cosmic : .void,
            whyForYou: "Based on your birth date, your life path number is \(lifePathNumber). This dragon name vibrates at the frequency of your soul's purpose.",
            numerology: lifePathNumber
        )

    }

    // MARK: - Motivation Names

    private static func motivationName(for motivation: AwakeningMotivation, profile: UserProfileData) -> DragonNameSuggestion {

        let names: [AwakeningMotivation: (name: String, meaning: String, full: String)] = [
            .seekingTruth: ("Veritas", "Truth seeker", "Latin for 'truth'. The pursuit of truth is the noblest quest. Your dragon has eyes that see through all deception."),
            .breakingFree: ("Liberax", "Chain breaker", "From Latin 'liber' (free). Freedom is the birthright stolen by systems of control. Your dragon shatters all bonds."),
            .findingPurpose: ("Destinar", "Destiny finder", "From 'destiny'. Purpose gives meaning to existence. Your dragon carries the map to your true calling."),
            .helpingOthers: ("Altruon", "Light for others", "From 'altruism'. Service to others is the highest expression of awakening. Your dragon illuminates paths for the lost."),
            .healingTrauma: ("Sanarix", "Wound healer", "From Latin 'sanare' (to heal). Healing transforms pain into wisdom. Your dragon transmutes shadow into light."),
            .spiritualGrowth: ("Spiraxis", "Spirit climber", "From 'spiritual' and 'axis'. Spiritual growth is the eternal upward spiral. Your dragon ascends through all dimensions."),
            .intellectualCuriosity: ("Cognitum", "Knowledge seeker", "From Latin 'cognitus' (known). Curiosity is the engine of awakening. Your dragon devours forbidden knowledge."),
            .reclaimingPower: ("Sovereign", "Power reclaimer", "From Latin 'superanus' (supreme). Your power was always yours. Your dragon helps you remember who you truly are.")
        ]

        let data = names[motivation] ?? ("Awakenis", "The awakened", "Your dragon walks the path of consciousness.")

        return DragonNameSuggestion(
            name: data.name,
            shortMeaning: data.meaning,
            fullMeaning: data.full,
            origin: "Your Motivation: \(motivation.rawValue)",
            element: motivation.suggestedElement,
            whyForYou: "You said '\(motivation.rawValue)' - this is the fire driving your awakening. This dragon name embodies your deepest why.",
            numerology: calculateNumerology(data.name)
        )

    }

    // MARK: - Resonance Names

    private static func resonanceName(for resonance: ResonanceType, profile: UserProfileData) -> DragonNameSuggestion {

        let names: [ResonanceType: (name: String, meaning: String, full: String)] = [
            .dragonBall: ("Shenlong", "Divine dragon", "The eternal dragon from Dragon Ball who grants wishes. But the real power was always within the warriors who gathered the balls. Your dragon reminds you: the wish is YOU."),
            .gnosticism: ("Sophia", "Divine wisdom", "The Gnostic personification of wisdom, the feminine aspect of divine knowledge. She fell into matter to spark awakening. Your dragon carries her light."),
            .ancientWisdom: ("Thotharis", "Scribe of gods", "Inspired by Thoth, the Egyptian god of wisdom and writing. Ancient knowledge flows through this dragon's veins."),
            .conspiracy: ("Revelator", "Truth revealer", "From 'revelation'. Some call them conspiracies, but you know they're uncomfortable truths. Your dragon tears away the veil."),
            .consciousness: ("Awarix", "Awareness keeper", "From 'aware'. Consciousness is the ground of all being. Your dragon IS awareness itself, observing the dream."),
            .systemsThinking: ("Patternix", "Pattern seer", "From 'pattern'. Once you see the patterns, you cannot unsee them. Your dragon recognizes the code behind reality."),
            .spirituality: ("Atmanus", "Soul breath", "From Sanskrit 'atman' (soul/self). Spirituality is remembering what you always were. Your dragon breathes with the cosmic self."),
            .activism: ("Catalyx", "Change maker", "From 'catalyst'. Some wait for change, others create it. Your dragon carries the fire of transformation for all.")
        ]

        let data = names[resonance] ?? ("Resonar", "Frequency matcher", "Your dragon vibrates at your frequency.")

        return DragonNameSuggestion(
            name: data.name,
            shortMeaning: data.meaning,
            fullMeaning: data.full,
            origin: "Resonance: \(resonance.rawValue)",
            element: .cosmic,
            whyForYou: "You resonate with \(resonance.rawValue). This isn't random - it's your soul recognizing truth. This dragon name carries that same frequency.",
            numerology: calculateNumerology(data.name)
        )

    }

    // MARK: - Helpers

    private static func reduceToSingle(_ number: Int) -> Int {
        var n = number
        while n > 9 {
            n = String(n).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        return n
    }

    private static func calculateNumerology(_ name: String) -> Int {
        let values: [Character: Int] = [
            "a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8, "i": 9,
            "j": 1, "k": 2, "l": 3, "m": 4, "n": 5, "o": 6, "p": 7, "q": 8, "r": 9,
            "s": 1, "t": 2, "u": 3, "v": 4, "w": 5, "x": 6, "y": 7, "z": 8
        ]
        let sum = name.lowercased().compactMap { values[$0] }.reduce(0, +)
        return reduceToSingle(sum)
    }

}

// MARK: - Preview

#Preview {

    let profile = UserProfileData(
        displayName: "Ron",
        birthDate: Calendar.current.date(from: DateComponents(year: 1989, month: 5, day: 8)),
        zodiacSign: .taurus,
        favoriteColors: ["#FFD700"],
        awakeningMotivation: .seekingTruth,
        resonatesWith: [.dragonBall, .gnosticism],
        learningStyle: .visual,
        lifeGoals: [.freedom, .truth]
    )

    DragonNamingView(profile: profile) { name in
        print("Selected: \(name)")
    }

}
