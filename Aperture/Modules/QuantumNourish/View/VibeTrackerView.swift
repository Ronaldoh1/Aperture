// VibeTrackerView.swift
// DAILY VIBE TRACKER — Log Your Frequency
// ☀️ SunFlow: Reignited

import SwiftUI

struct VibeTrackerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var todayMeals: [TrackedMeal] = []
    @State private var showAddMeal = false
    @State private var dailyAverage: Int = 0
    @State private var streak: Int = 0
    
    struct TrackedMeal: Identifiable {
        let id = UUID()
        let type: MealType
        let foods: [String]
        let vibeScore: Int
        let estimatedMhz: Int
        let timestamp: Date
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 12) {
                            Text("DAILY VIBE TRACKER")
                                .font(.system(size: 10, weight: .bold)).tracking(4)
                                .foregroundColor(Color(hex: "#3498DB"))
                            Text("What's Your Frequency Today?")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        // Aura meter
                        auraMeter
                        
                        // Today's meals
                        if todayMeals.isEmpty {
                            emptyState
                        } else {
                            ForEach(todayMeals) { meal in
                                mealCard(meal)
                            }
                        }
                        
                        // Add meal button
                        Button { showAddMeal = true } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("LOG A MEAL")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#3498DB")))
                        }
                        
                        // Target explanation
                        targetSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#3498DB"))
                }
            }
            .sheet(isPresented: $showAddMeal) {
                QuickMealLogView { meal in
                    todayMeals.append(meal)
                    recalculate()
                }
            }
        }
    }
    
    private var auraMeter: some View {
        VStack(spacing: 14) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 10)
                    .frame(width: 140, height: 140)
                
                Circle()
                    .trim(from: 0, to: CGFloat(min(dailyAverage, 320)) / 320.0)
                    .stroke(
                        LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, Color(hex: "#9B59B6")], startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .frame(width: 140, height: 140)
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 2) {
                    Text("\(dailyAverage)")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    Text("MHz AVG")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            // Target line
            HStack(spacing: 20) {
                VStack(spacing: 2) {
                    Text("TARGET").font(.system(size: 9, weight: .bold)).foregroundColor(.green)
                    Text("72+ MHz").font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(.green)
                }
                VStack(spacing: 2) {
                    Text("STATUS").font(.system(size: 9, weight: .bold)).foregroundColor(dailyAverage >= 72 ? .green : .orange)
                    Text(dailyAverage >= 72 ? "ELEVATED ✨" : dailyAverage > 0 ? "BUILDING 🔄" : "START LOGGING")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(dailyAverage >= 72 ? .green : .orange)
                }
                VStack(spacing: 2) {
                    Text("STREAK").font(.system(size: 9, weight: .bold)).foregroundColor(Color(hex: "#F1C40F"))
                    Text("\(streak) days").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Color(hex: "#F1C40F"))
                }
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.04)))
    }
    
    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "fork.knife.circle").font(.system(size: 40)).foregroundColor(Palette.text.muted)
            Text("No meals logged today").font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(Palette.text.muted)
            Text("Log your first meal to start tracking your vibrational frequency")
                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.muted).multilineTextAlignment(.center)
        }
        .padding(30)
    }
    
    private func mealCard(_ meal: TrackedMeal) -> some View {
        HStack(spacing: 12) {
            Image(systemName: meal.type.icon).font(.system(size: 22)).foregroundColor(Color(hex: "#3498DB"))
            VStack(alignment: .leading, spacing: 4) {
                Text(meal.type.rawValue).font(.system(size: 13, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                Text(meal.foods.joined(separator: ", ")).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.secondary).lineLimit(2)
            }
            Spacer()
            VStack(spacing: 2) {
                Text("~\(meal.estimatedMhz)").font(.system(size: 16, weight: .bold, design: .monospaced)).foregroundColor(mhzColor(meal.estimatedMhz))
                Text("MHz").font(.system(size: 9, weight: .bold)).foregroundColor(Palette.text.muted)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }
    
    private func mhzColor(_ mhz: Int) -> Color {
        if mhz >= 72 { return Color(hex: "#9B59B6") }
        if mhz >= 50 { return .green }
        if mhz >= 25 { return .yellow }
        if mhz >= 10 { return .orange }
        return .red
    }
    
    private var targetSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("FREQUENCY TARGETS").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#3498DB"))
            
            targetRow(label: "Human body baseline", mhz: "62-68 MHz", note: "Below this = susceptibility to illness")
            targetRow(label: "Consciousness threshold", mhz: "72 MHz", note: "Above this = enhanced awareness & intuition")
            targetRow(label: "Peak human frequency", mhz: "90+ MHz", note: "Rare sustained state — monks, breatharians")
            targetRow(label: "Essential oil range", mhz: "52-320 MHz", note: "Rose oil = highest at 320 MHz")
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
    }
    
    private func targetRow(label: String, mhz: String, note: String) -> some View {
        HStack(spacing: 10) {
            Text(mhz).font(.system(size: 12, weight: .bold, design: .monospaced)).foregroundColor(Color(hex: "#3498DB")).frame(width: 80, alignment: .leading)
            VStack(alignment: .leading, spacing: 2) {
                Text(label).font(.system(size: 12, weight: .semibold)).foregroundColor(Palette.text.primary)
                Text(note).font(.system(size: 10, weight: .medium)).foregroundColor(Palette.text.muted)
            }
        }
    }
    
    private func recalculate() {
        guard !todayMeals.isEmpty else { dailyAverage = 0; return }
        dailyAverage = todayMeals.reduce(0) { $0 + $1.estimatedMhz } / todayMeals.count
    }
}

// MARK: - Quick Meal Log

struct QuickMealLogView: View {
    @Environment(\.dismiss) var dismiss
    let onAdd: (VibeTrackerView.TrackedMeal) -> Void
    
    @State private var selectedType: MealType = .morning
    @State private var foodText = ""
    @State private var estimatedMhz: Double = 40
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("LOG MEAL").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#3498DB"))
                    
                    // Meal type picker
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(MealType.allCases, id: \.self) { type in
                                Button {
                                    selectedType = type
                                } label: {
                                    VStack(spacing: 4) {
                                        Image(systemName: type.icon).font(.system(size: 20))
                                        Text(type.rawValue).font(.system(size: 10, weight: .bold))
                                    }
                                    .foregroundColor(selectedType == type ? .black : Color(hex: "#3498DB"))
                                    .padding(12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedType == type ? Color(hex: "#3498DB") : Color.white.opacity(0.05))
                                    )
                                }
                            }
                        }
                    }
                    
                    // Food description
                    TextField("What did you eat?", text: $foodText)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))
                    
                    // MHz slider
                    VStack(spacing: 8) {
                        HStack {
                            Text("ESTIMATED FREQUENCY")
                                .font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Palette.text.muted)
                            Spacer()
                            Text("\(Int(estimatedMhz)) MHz")
                                .font(.system(size: 16, weight: .bold, design: .monospaced))
                                .foregroundColor(mhzSliderColor)
                        }
                        Slider(value: $estimatedMhz, in: 0...120, step: 5)
                            .tint(mhzSliderColor)
                        
                        HStack {
                            Text("☠️ Toxic").font(.system(size: 9)).foregroundColor(.red)
                            Spacer()
                            Text("🧘 Transcendent").font(.system(size: 9)).foregroundColor(Color(hex: "#9B59B6"))
                        }
                    }
                    
                    // Quick presets
                    VStack(alignment: .leading, spacing: 8) {
                        Text("QUICK PRESETS").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(Palette.text.muted)
                        HStack(spacing: 8) {
                            presetButton("Fast Food 🍔", mhz: 5)
                            presetButton("Cooked Meal 🍳", mhz: 30)
                            presetButton("Raw Salad 🥗", mhz: 60)
                            presetButton("Green Juice 🥬", mhz: 85)
                        }
                    }
                    
                    Spacer()
                    
                    // Add button
                    Button {
                        let meal = VibeTrackerView.TrackedMeal(
                            type: selectedType,
                            foods: foodText.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) },
                            vibeScore: Int(estimatedMhz) > 50 ? 2 : Int(estimatedMhz) > 20 ? 0 : -2,
                            estimatedMhz: Int(estimatedMhz),
                            timestamp: Date()
                        )
                        onAdd(meal)
                        dismiss()
                    } label: {
                        Text("ADD TO TODAY'S LOG")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#3498DB")))
                    }
                }
                .padding(20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") { dismiss() }.foregroundColor(Color(hex: "#3498DB"))
                }
            }
        }
    }
    
    private var mhzSliderColor: Color {
        if estimatedMhz >= 72 { return Color(hex: "#9B59B6") }
        if estimatedMhz >= 50 { return .green }
        if estimatedMhz >= 25 { return .yellow }
        if estimatedMhz >= 10 { return .orange }
        return .red
    }
    
    private func presetButton(_ label: String, mhz: Double) -> some View {
        Button {
            estimatedMhz = mhz
            HapticManager.shared.light()
        } label: {
            Text(label)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.primary)
                .padding(.horizontal, 8).padding(.vertical, 6)
                .background(Capsule().fill(Color.white.opacity(0.06)))
        }
    }
}

// MARK: - Quantum Meal Plan View

struct QuantumMealPlanView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            Image(systemName: "calendar.badge.clock").font(.system(size: 48)).foregroundColor(Color(hex: "#2ECC71"))
                            Text("QUANTUM MEAL PLAN").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#2ECC71"))
                            Text("7-Day Consciousness Elevation Protocol").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        dayPlan(day: 1, title: "DETOX INITIATION", morning: "Warm lemon water + chlorella tablets", solar: "Raw green salad with sprouts, avocado, hemp seeds", twilight: "Vegetable soup with turmeric & ginger", elixir: "Chaga mushroom tea", targetMhz: 55)
                        
                        dayPlan(day: 2, title: "GUT RESET", morning: "Kefir smoothie with wild blueberries", solar: "Fermented vegetables + brown rice + miso", twilight: "Bone broth with seaweed", elixir: "Apple cider vinegar tonic", targetMhz: 58)
                        
                        dayPlan(day: 3, title: "PINEAL ACTIVATION", morning: "Raw cacao ceremony drink + spirulina", solar: "Chlorella green bowl with neem tea", twilight: "Raw food plate — nothing cooked", elixir: "Frankincense water (1 drop food-grade)", targetMhz: 68)
                        
                        dayPlan(day: 4, title: "MITOCHONDRIAL CHARGE", morning: "CoQ10-rich smoothie + Lion's Mane", solar: "Wild-caught salmon + organic greens", twilight: "Grass-fed liver pâté with vegetables", elixir: "Green tea with lemon", targetMhz: 62)
                        
                        dayPlan(day: 5, title: "ELECTROMAGNETIC REBUILD", morning: "Fresh green juice (within 15 min)", solar: "Living sprout bowl + grounding root vegetables", twilight: "Light soup with medicinal mushrooms", elixir: "Spring water charged in sunlight", targetMhz: 72)
                        
                        dayPlan(day: 6, title: "QUANTUM FEAST", morning: "Sun-charged water + dry brush + breathwork", solar: "Full raw organic feast — fruits, nuts, sprouts, greens", twilight: "Light fruit + herbal tea", elixir: "Rose water", targetMhz: 80)
                        
                        dayPlan(day: 7, title: "INTEGRATION & REST", morning: "Warm water with raw honey + turmeric", solar: "Intuitive eating — listen to your body's frequency requests", twilight: "Whatever your body calls for — consciously", elixir: "Gratitude tea ceremony", targetMhz: 75)
                        
                        // Dragon note
                        VStack(spacing: 8) {
                            Text("🐉").font(.system(size: 24))
                            Text("\"This isn't a diet. It's a frequency protocol. Each day builds on the last. By Day 7, your body will be communicating things your mind couldn't hear before. Listen.\"")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary).italic().multilineTextAlignment(.center).lineSpacing(4)
                        }
                        .padding(16)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Palette.accent.gold.opacity(0.06)))
                        
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
    
    private func dayPlan(day: Int, title: String, morning: String, solar: String, twilight: String, elixir: String, targetMhz: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("DAY \(day)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(hex: "#2ECC71"))
                Text("—")
                    .foregroundColor(Palette.text.muted)
                Text(title)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                Spacer()
                Text("~\(targetMhz) MHz")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(hex: "#2ECC71").opacity(0.8))
            }
            
            mealRow(icon: "sunrise.fill", label: "Morning Ritual", text: morning)
            mealRow(icon: "sun.max.fill", label: "Solar Peak", text: solar)
            mealRow(icon: "sunset.fill", label: "Twilight Feast", text: twilight)
            mealRow(icon: "drop.fill", label: "Elixir", text: elixir)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(hex: "#2ECC71").opacity(0.1), lineWidth: 1))
        )
    }
    
    private func mealRow(icon: String, label: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icon).font(.system(size: 14)).foregroundColor(Color(hex: "#2ECC71").opacity(0.6)).frame(width: 20)
            VStack(alignment: .leading, spacing: 2) {
                Text(label).font(.system(size: 9, weight: .bold)).foregroundColor(Palette.text.muted)
                Text(text).font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.text.secondary)
            }
        }
    }
}
