// QuantumCleansingView.swift
// QUANTUM CLEANSING — Fasting, Detox, Juicing & Accountability
// Reset the vessel. Elevate the frequency.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Fasting Protocol

struct FastingProtocol: Identifiable {
    let id: String
    let name: String
    let subtitle: String
    let duration: String
    let difficulty: Int // 1-5
    let description: String
    let schedule: String
    let benefits: [String]
    let warnings: [String]
    let breakFastWith: [String]
    let icon: String
    let color: Color
}

class QuantumFastingProtocols {
    static let protocols: [FastingProtocol] = [
        FastingProtocol(
            id: "intermittent_16_8", name: "16:8 Intermittent", subtitle: "The Gateway Fast",
            duration: "16 hours fasting / 8 hour eating window", difficulty: 1,
            description: "The most accessible fast. Skip breakfast, eat between noon and 8 PM. Your body enters mild ketosis and begins autophagy (cellular cleanup) around hour 14-16. This is how you train your body to burn fat for fuel instead of constant glucose dependence.",
            schedule: "Last meal at 8 PM → First meal at noon next day. Water, herbal tea, and black coffee (organic) are fine during the fast.",
            benefits: ["Initiates autophagy (cellular recycling)", "Improves insulin sensitivity", "Increases growth hormone (up to 500%)", "Mental clarity from ketone production", "Gut rest and microbiome rebalancing"],
            warnings: ["Not recommended if diabetic without medical supervision", "May cause headaches first 3-5 days (detox response)", "Women may need a gentler protocol (14:10) due to hormonal sensitivity"],
            breakFastWith: ["Warm lemon water first", "Then light fruit or smoothie", "Wait 30 min before a full meal", "Avoid breaking fast with heavy protein or processed food"],
            icon: "clock.fill", color: Color(hex: "#3498DB")
        ),
        FastingProtocol(
            id: "omad", name: "OMAD (One Meal A Day)", subtitle: "The Warrior Protocol",
            duration: "23 hours fasting / 1 hour eating window", difficulty: 3,
            description: "One large, nutrient-dense meal per day. Deep autophagy. Significant fat adaptation. Mental clarity reaches a new level around day 3-5 as your brain fully switches to ketone fuel. Ancient warriors and monks practiced this — it wasn't poverty, it was strategy.",
            schedule: "Eat one large meal, ideally in the afternoon (2-5 PM). Must be extremely nutrient-dense to hit all macro/micro needs.",
            benefits: ["Deep autophagy and cellular renewal", "Maximum growth hormone production", "Extreme mental clarity after adaptation", "Simplified relationship with food", "Significant body recomposition"],
            warnings: ["Requires 2+ weeks of 16:8 experience first", "Must eat enough calories and nutrients in one meal", "Not appropriate for athletes in heavy training phases", "Risk of undereating — track nutrients carefully", "Consult physician if on any medications"],
            breakFastWith: ["Warm water with ACV (apple cider vinegar)", "Start with a small salad or broth", "Main meal 15-20 minutes later", "End with a small portion of fruit"],
            icon: "sun.max.fill", color: Color(hex: "#F39C12")
        ),
        FastingProtocol(
            id: "water_24", name: "24-Hour Water Fast", subtitle: "The Reset Button",
            duration: "24 hours — water only", difficulty: 2,
            description: "A full day with nothing but water. By hour 18-20, autophagy is fully engaged — your cells are literally recycling damaged proteins and cleaning house. This is maintenance for your biological hardware.",
            schedule: "Dinner Sunday → Dinner Monday (or any 24-hour window). Only spring/filtered water and herbal tea.",
            benefits: ["Full autophagy activation", "Gut lining regeneration begins", "Immune system reset (stem cell production increases)", "Spiritual clarity — most traditions fast for a reason", "Inflammation reduction"],
            warnings: ["Stay hydrated — minimum 2-3L water", "Light activity only (no intense workouts)", "Break fast gently — not with pizza", "If dizzy or heart palpitations, break fast immediately"],
            breakFastWith: ["Bone broth or vegetable broth first", "Wait 30 minutes", "Light meal: steamed vegetables + small protein", "Avoid sugar, fried food, heavy carbs for first meal"],
            icon: "drop.fill", color: Color(hex: "#00BFFF")
        ),
        FastingProtocol(
            id: "water_72", name: "72-Hour Water Fast", subtitle: "The Deep Renewal",
            duration: "72 hours — water only", difficulty: 5,
            description: "Three days of water fasting triggers massive immune system regeneration. Research from USC shows the immune system essentially recycles old white blood cells and generates new ones from stem cells after 72 hours. This is a hard reset.",
            schedule: "72 consecutive hours. Only spring/filtered water with trace minerals. MUST be supervised or medically cleared. Not for beginners.",
            benefits: ["Complete immune system regeneration", "Maximum autophagy — deep cellular cleanup", "Stem cell production dramatically increases", "Profound spiritual experiences commonly reported", "Inflammation markers drop significantly"],
            warnings: ["PHYSICIAN SUPERVISION REQUIRED", "Not for beginners — build up through 16:8 → OMAD → 24hr first", "Electrolytes essential (sodium, potassium, magnesium)", "Break fast VERY carefully — refeeding syndrome is real and dangerous", "Not appropriate for: diabetics, pregnant/nursing, under 18, underweight, history of eating disorders, anyone on medication without doctor approval"],
            breakFastWith: ["CRITICAL: Break with bone broth or diluted juice ONLY", "Day 1 post-fast: broth, soft cooked vegetables, small amounts", "Day 2: gradually introduce solid food", "Do NOT eat a large meal — your digestive system needs to restart gradually", "Refeeding syndrome can be life-threatening if not managed properly"],
            icon: "flame.fill", color: Color(hex: "#E74C3C")
        )
    ]
}

// MARK: - Juice Recipes

struct JuiceRecipe: Identifiable {
    let id: String
    let name: String
    let purpose: String
    let ingredients: [String]
    let mhzEstimate: Int
    let bestTime: String
    let tip: String
    let color: Color
}

class QuantumJuiceBar {
    static let recipes: [JuiceRecipe] = [
        JuiceRecipe(id: "green_awakening", name: "Green Awakening", purpose: "Pineal activation + alkalizing",
            ingredients: ["Celery (6 stalks)", "Cucumber (1 whole)", "Green apple (1)", "Lemon (1)", "Ginger (1 inch)", "Handful of parsley"],
            mhzEstimate: 72, bestTime: "Morning on empty stomach",
            tip: "Drink within 15 minutes of juicing — enzymes begin dying on contact with air. Fresh juice is living food; bottled juice is dead food.",
            color: Color(hex: "#2ECC71")),
        JuiceRecipe(id: "beet_blood", name: "Beet Blood Builder", purpose: "Iron + nitric oxide + blood purification",
            ingredients: ["Beets (2 medium)", "Carrots (3)", "Apple (1)", "Ginger (1 inch)", "Lemon (half)"],
            mhzEstimate: 58, bestTime: "Pre-workout (90 min before) or morning",
            tip: "Beet juice increases nitric oxide = more oxygen to brain and muscles. Research-backed for athletic performance. Your urine may turn pink — that's normal.",
            color: Color(hex: "#E74C3C")),
        JuiceRecipe(id: "turmeric_fire", name: "Turmeric Fire Shot", purpose: "Anti-inflammatory + immune boost",
            ingredients: ["Fresh turmeric root (2 inches)", "Ginger root (1 inch)", "Lemon (1)", "Black pepper (pinch)", "Raw honey (1 tsp)", "Cayenne (pinch)"],
            mhzEstimate: 65, bestTime: "Morning or when feeling immune-compromised",
            tip: "Black pepper increases turmeric absorption by 2,000%. Never take turmeric without it. This shot is a pharmaceutical-grade anti-inflammatory.",
            color: Color(hex: "#FF6B35")),
        JuiceRecipe(id: "liver_flush", name: "Liver Flush Protocol", purpose: "Detoxification + liver support",
            ingredients: ["Dandelion greens (handful)", "Lemon (2)", "Green apple (1)", "Beet (1 small)", "Milk thistle tea (cooled, 1 cup)", "Ginger (1 inch)"],
            mhzEstimate: 60, bestTime: "Morning, during a cleanse week",
            tip: "Your liver processes every toxin you encounter. If it's overloaded, nothing else works optimally — not your hormones, not your digestion, not your energy. Support it.",
            color: Color(hex: "#27AE60")),
        JuiceRecipe(id: "cosmic_purple", name: "Cosmic Purple", purpose: "Antioxidant + brain power + third eye",
            ingredients: ["Wild blueberries (1 cup)", "Purple cabbage (1/4 head)", "Beet (1 small)", "Apple (1)", "Lemon (half)", "Spirulina (1 tsp blended in)"],
            mhzEstimate: 68, bestTime: "Afternoon pick-me-up or pre-meditation",
            tip: "Wild blueberries have 2x the antioxidants of cultivated. Purple foods contain anthocyanins that cross the blood-brain barrier — literal brain food.",
            color: Color(hex: "#9B59B6")),
    ]
}

// MARK: - Accountability Manager

class CleansingAccountability: ObservableObject {
    static let shared = CleansingAccountability()
    
    @Published var activeFast: String? = nil
    @Published var fastStartTime: Date? = nil
    @Published var dailyCheckIns: [DailyCheckIn] = []
    @Published var cleansingStreak: Int = 0
    
    private let defaults = UserDefaults.standard
    
    struct DailyCheckIn: Identifiable, Codable {
        let id: String
        let date: Date
        let waterLiters: Double
        let energyLevel: Int // 1-10
        let mood: String
        let symptoms: [String]
        let notes: String
    }
    
    func startFast(_ protocolId: String) {
        activeFast = protocolId
        fastStartTime = Date()
        defaults.set(protocolId, forKey: "active_fast")
        defaults.set(Date().timeIntervalSince1970, forKey: "fast_start")
    }
    
    func endFast() {
        activeFast = nil
        fastStartTime = nil
        defaults.removeObject(forKey: "active_fast")
        defaults.removeObject(forKey: "fast_start")
    }
    
    var hoursElapsed: Double {
        guard let start = fastStartTime else { return 0 }
        return Date().timeIntervalSince(start) / 3600
    }
    
    func addCheckIn(water: Double, energy: Int, mood: String, symptoms: [String], notes: String) {
        let checkIn = DailyCheckIn(
            id: UUID().uuidString, date: Date(), waterLiters: water,
            energyLevel: energy, mood: mood, symptoms: symptoms, notes: notes
        )
        dailyCheckIns.append(checkIn)
        cleansingStreak += 1
        save()
    }
    
    private func save() {
        defaults.set(cleansingStreak, forKey: "cleansing_streak")
    }
    
    func load() {
        cleansingStreak = defaults.integer(forKey: "cleansing_streak")
        if let fastId = defaults.string(forKey: "active_fast") {
            activeFast = fastId
            let startInterval = defaults.double(forKey: "fast_start")
            if startInterval > 0 { fastStartTime = Date(timeIntervalSince1970: startInterval) }
        }
    }
}

// MARK: - Main Quantum Cleansing View

struct QuantumCleansingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var accountability = CleansingAccountability.shared
    @State private var selectedProtocol: FastingProtocol?
    @State private var showJuiceBar = false
    @State private var showAccountability = false
    @State private var showCheckIn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 8) {
                            Image(systemName: "drop.triangle.fill").font(.system(size: 40)).foregroundColor(Color(hex: "#1ABC9C"))
                            Text("QUANTUM CLEANSING").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#1ABC9C"))
                            Text("Reset. Purify. Elevate.").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        // CRITICAL disclaimers
                        DisclaimerStack(types: [.fasting, .medical])
                            .padding(.horizontal, 4)
                        
                        // Active fast tracker
                        if let fastId = accountability.activeFast {
                            activeFastCard(fastId)
                        }
                        
                        // Fasting Protocols
                        VStack(alignment: .leading, spacing: 10) {
                            Text("FASTING PROTOCOLS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(Palette.text.muted)
                            
                            ForEach(QuantumFastingProtocols.protocols) { protocol_ in
                                Button {
                                    selectedProtocol = protocol_
                                } label: {
                                    HStack(spacing: 12) {
                                        ZStack {
                                            Circle().fill(protocol_.color.opacity(0.15)).frame(width: 40, height: 40)
                                            Image(systemName: protocol_.icon).font(.system(size: 16)).foregroundColor(protocol_.color)
                                        }
                                        VStack(alignment: .leading, spacing: 3) {
                                            Text(protocol_.name).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                                            Text(protocol_.subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted)
                                        }
                                        Spacer()
                                        // Difficulty dots
                                        HStack(spacing: 2) {
                                            ForEach(1...5, id: \.self) { i in
                                                Circle().fill(i <= protocol_.difficulty ? protocol_.color : Color.white.opacity(0.1)).frame(width: 5, height: 5)
                                            }
                                        }
                                    }
                                    .padding(12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(protocol_.color.opacity(0.04))
                                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(protocol_.color.opacity(0.15), lineWidth: 1))
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        
                        // Quick actions
                        HStack(spacing: 12) {
                            actionButton(title: "Juice Bar", icon: "cup.and.saucer.fill", color: Color(hex: "#2ECC71")) { showJuiceBar = true }
                            actionButton(title: "Check In", icon: "checkmark.circle.fill", color: Color(hex: "#F39C12")) { showCheckIn = true }
                        }
                        
                        // Dragon wisdom
                        VStack(spacing: 8) {
                            Text("🐉").font(.system(size: 20))
                            Text("\"Fasting isn't starvation — it's liberation. Your body knows how to heal itself. You just have to stop overwhelming it with inputs long enough for the repair systems to activate. Every ancient tradition knew this. Modern science is finally catching up.\"")
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary).italic().multilineTextAlignment(.center).lineSpacing(3)
                        }
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Palette.accent.gold.opacity(0.06)))
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("QUANTUM CLEANSING").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Color(hex: "#1ABC9C"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#1ABC9C"))
                }
            }
            .sheet(item: $selectedProtocol) { protocol_ in
                FastingProtocolDetailView(protocol_: protocol_)
            }
            .sheet(isPresented: $showJuiceBar) { JuiceBarView() }
            .sheet(isPresented: $showCheckIn) { CleansingDailyCheckInView() }
            .onAppear { accountability.load() }
        }
    }
    
    private func activeFastCard(_ fastId: String) -> some View {
        let hours = accountability.hoursElapsed
        let protocol_ = QuantumFastingProtocols.protocols.first { $0.id == fastId }
        
        return VStack(spacing: 10) {
            HStack {
                Image(systemName: "timer").foregroundColor(Color(hex: "#FF6B35"))
                Text("ACTIVE FAST").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(Color(hex: "#FF6B35"))
                Spacer()
                Button("End Fast") { accountability.endFast() }
                    .font(.system(size: 10, weight: .bold)).foregroundColor(Color(hex: "#E74C3C"))
            }
            Text(String(format: "%.1f hours elapsed", hours))
                .font(.system(size: 28, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
            if let p = protocol_ {
                Text(p.name).font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.muted)
            }
            
            // Milestone markers
            HStack(spacing: 4) {
                milestone("12h", active: hours >= 12, note: "Ketosis begins")
                milestone("16h", active: hours >= 16, note: "Autophagy")
                milestone("24h", active: hours >= 24, note: "Deep cleanup")
                milestone("48h", active: hours >= 48, note: "Immune reset")
                milestone("72h", active: hours >= 72, note: "Stem cells")
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(hex: "#FF6B35").opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(hex: "#FF6B35").opacity(0.2), lineWidth: 1))
        )
    }
    
    private func milestone(_ label: String, active: Bool, note: String) -> some View {
        VStack(spacing: 4) {
            Circle().fill(active ? Color(hex: "#2ECC71") : Color.white.opacity(0.1)).frame(width: 10, height: 10)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(active ? Palette.text.primary : Palette.text.muted)
            Text(note).font(.system(size: 7)).foregroundColor(Palette.text.muted).lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func actionButton(title: String, icon: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon).font(.system(size: 18)).foregroundColor(color)
                Text(title).font(.system(size: 11, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
            }
            .frame(maxWidth: .infinity).padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.06)).overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.15), lineWidth: 1)))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Fasting Protocol Detail

struct FastingProtocolDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var accountability = CleansingAccountability.shared
    let protocol_: FastingProtocol
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(spacing: 8) {
                            Image(systemName: protocol_.icon).font(.system(size: 36)).foregroundColor(protocol_.color)
                            Text(protocol_.name.uppercased()).font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(protocol_.color)
                            Text(protocol_.duration).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        DisclaimerBanner(type: .fasting)
                        
                        // Description
                        Text(protocol_.description).font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary).lineSpacing(4)
                        
                        // Schedule
                        VStack(alignment: .leading, spacing: 6) {
                            Text("SCHEDULE").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(protocol_.color)
                            Text(protocol_.schedule).font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary).lineSpacing(3)
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(protocol_.color.opacity(0.04)))
                        
                        // Benefits
                        sectionList("BENEFITS", items: protocol_.benefits, icon: "checkmark.circle.fill", color: Color(hex: "#2ECC71"))
                        
                        // Warnings
                        sectionList("WARNINGS", items: protocol_.warnings, icon: "exclamationmark.triangle.fill", color: Color(hex: "#E74C3C"))
                        
                        // Break fast
                        sectionList("HOW TO BREAK THE FAST", items: protocol_.breakFastWith, icon: "leaf.fill", color: Color(hex: "#F39C12"))
                        
                        // Start button
                        if accountability.activeFast == nil {
                            Button {
                                accountability.startFast(protocol_.id)
                                HapticManager.shared.heavy()
                                dismiss()
                            } label: {
                                Text("START THIS FAST")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.black).frame(maxWidth: .infinity).padding(14)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(protocol_.color))
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(protocol_.color)
                }
            }
        }
    }
    
    private func sectionList(_ title: String, items: [String], icon: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(color)
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 6) {
                    Image(systemName: icon).font(.system(size: 9)).foregroundColor(color).padding(.top, 2)
                    Text(item).font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary).lineSpacing(2)
                }
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.04)))
    }
}

// MARK: - Juice Bar View

struct JuiceBarView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(spacing: 8) {
                            Text("🍹").font(.system(size: 36))
                            Text("QUANTUM JUICE BAR").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#2ECC71"))
                            Text("Living Liquid Intelligence").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        DisclaimerBanner(type: .nutritional)
                        
                        ForEach(QuantumJuiceBar.recipes) { recipe in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(recipe.name).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(recipe.color)
                                    Spacer()
                                    Text("~\(recipe.mhzEstimate) MHz").font(.system(size: 11, weight: .bold)).foregroundColor(Color(hex: "#2ECC71"))
                                }
                                Text(recipe.purpose).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted).italic()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                                        HStack(spacing: 6) {
                                            Circle().fill(recipe.color).frame(width: 4, height: 4)
                                            Text(ingredient).font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary)
                                        }
                                    }
                                }
                                
                                HStack(spacing: 4) {
                                    Image(systemName: "clock").font(.system(size: 9)).foregroundColor(Palette.text.muted)
                                    Text("Best: \(recipe.bestTime)").font(.system(size: 10, weight: .medium)).foregroundColor(Palette.text.muted)
                                }
                                
                                HStack(spacing: 4) {
                                    Text("💡").font(.system(size: 10))
                                    Text(recipe.tip).font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.accent.gold).italic().lineSpacing(2)
                                }
                                .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Palette.accent.gold.opacity(0.06)))
                            }
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 14).fill(recipe.color.opacity(0.04))
                                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(recipe.color.opacity(0.15), lineWidth: 1))
                            )
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#2ECC71"))
                }
            }
        }
    }
}

// MARK: - Daily Check-In View

struct CleansingDailyCheckInView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var accountability = CleansingAccountability.shared
    @State private var waterLiters: Double = 2.0
    @State private var energyLevel: Int = 5
    @State private var selectedMood = "Neutral"
    @State private var notes = ""
    
    let moods = ["Struggling", "Low Energy", "Neutral", "Good", "Great", "Euphoric"]
    let symptoms = ["Headache", "Fatigue", "Mental Clarity", "Hunger Pangs", "Nausea", "Calm/Peace", "Irritability", "Light-headed"]
    @State private var selectedSymptoms: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("DAILY CHECK-IN").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(Color(hex: "#F39C12"))
                        
                        // Water
                        VStack(alignment: .leading, spacing: 6) {
                            Text("WATER INTAKE").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#00BFFF"))
                            HStack {
                                Text(String(format: "%.1fL", waterLiters)).font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                                Slider(value: $waterLiters, in: 0...5, step: 0.5).tint(Color(hex: "#00BFFF"))
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                        
                        // Energy
                        VStack(alignment: .leading, spacing: 6) {
                            Text("ENERGY LEVEL").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#F39C12"))
                            HStack {
                                Text("\(energyLevel)/10").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                                Slider(value: Binding(get: { Double(energyLevel) }, set: { energyLevel = Int($0) }), in: 1...10, step: 1).tint(Color(hex: "#F39C12"))
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                        
                        // Mood
                        VStack(alignment: .leading, spacing: 8) {
                            Text("MOOD").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#9B59B6"))
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 6) {
                                    ForEach(moods, id: \.self) { mood in
                                        Button {
                                            selectedMood = mood
                                        } label: {
                                            Text(mood).font(.system(size: 10, weight: .bold, design: .rounded))
                                                .foregroundColor(selectedMood == mood ? .black : Palette.text.muted)
                                                .padding(.horizontal, 10).padding(.vertical, 6)
                                                .background(Capsule().fill(selectedMood == mood ? Color(hex: "#9B59B6") : Color.white.opacity(0.06)))
                                        }
                                    }
                                }
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                        
                        // Symptoms
                        VStack(alignment: .leading, spacing: 8) {
                            Text("SYMPTOMS (select all that apply)").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Palette.text.muted)
                            FlowLayout(spacing: 6) {
                                ForEach(symptoms, id: \.self) { symptom in
                                    Button {
                                        if selectedSymptoms.contains(symptom) { selectedSymptoms.remove(symptom) }
                                        else { selectedSymptoms.insert(symptom) }
                                    } label: {
                                        Text(symptom).font(.system(size: 10, weight: .bold, design: .rounded))
                                            .foregroundColor(selectedSymptoms.contains(symptom) ? .black : Palette.text.muted)
                                            .padding(.horizontal, 8).padding(.vertical, 5)
                                            .background(Capsule().fill(selectedSymptoms.contains(symptom) ? Color(hex: "#1ABC9C") : Color.white.opacity(0.06)))
                                    }
                                }
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                        
                        // Notes
                        TextEditor(text: $notes)
                            .font(.system(size: 13)).foregroundColor(Palette.text.primary)
                            .scrollContentBackground(.hidden)
                            .frame(minHeight: 60)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                        
                        Button {
                            accountability.addCheckIn(water: waterLiters, energy: energyLevel, mood: selectedMood, symptoms: Array(selectedSymptoms), notes: notes)
                            dismiss()
                        } label: {
                            Text("LOG CHECK-IN").font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.black).frame(maxWidth: .infinity).padding(14)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#F39C12")))
                        }
                        
                        Spacer(minLength: 80)
                    }
                    .padding(.horizontal, 20).padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") { dismiss() }.foregroundColor(Color(hex: "#F39C12"))
                }
            }
        }
    }
}
