// VibeSpectrumView.swift
// THE VIBE SPECTRUM — Interactive Frequency Map
// ☀️ SunFlow: Reignited

import SwiftUI

struct VibeSpectrumView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var db = VibeSpectrumDatabase.shared
    @State private var selectedTier: FrequencyTier? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 8) {
                            Text("THE VIBE SPECTRUM")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .tracking(4)
                                .foregroundColor(Color(hex: "#9B59B6"))
                            Text("From Death to Transcendence")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                            Text("Tap any tier to explore its foods")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Palette.text.muted)
                        }
                        .padding(.top, 12)
                        
                        // Full spectrum
                        ForEach(FrequencyTier.allCases, id: \.self) { tier in
                            tierSection(tier)
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#9B59B6"))
                }
            }
        }
    }
    
    private func tierSection(_ tier: FrequencyTier) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            // Tier header
            Button {
                withAnimation(.spring(response: 0.4)) {
                    selectedTier = selectedTier == tier ? nil : tier
                }
                HapticManager.shared.light()
            } label: {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(tier.color)
                        .frame(width: 8, height: 50)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: tier.icon)
                                .foregroundColor(tier.color)
                            Text(tier.rawValue.uppercased())
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundColor(tier.color)
                        }
                        Text(tier.mhzRange)
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundColor(tier.color.opacity(0.7))
                        Text(tier.description)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                            .lineLimit(selectedTier == tier ? nil : 2)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text("\(db.foods(for: tier).count)")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(tier.color)
                        Text("items")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }
                    
                    Image(systemName: selectedTier == tier ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(tier.color.opacity(0.5))
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            // Expanded foods list
            if selectedTier == tier {
                VStack(spacing: 8) {
                    // Chakra connection
                    HStack(spacing: 6) {
                        Image(systemName: "circle.hexagongrid").font(.system(size: 10)).foregroundColor(tier.color)
                        Text("CHAKRA: \(tier.chakraConnection)")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(tier.color.opacity(0.8))
                    }
                    .padding(.horizontal, 12).padding(.vertical, 6)
                    .background(Capsule().fill(tier.color.opacity(0.1)))
                    
                    ForEach(db.foods(for: tier)) { food in
                        FoodResultCard(food: food)
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(tier.color.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(tier.color.opacity(0.12), lineWidth: 1))
        )
    }
}

// MARK: - Six Pillars View

struct SixPillarsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedPillar: QuantumPillar? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            Text("THE SIX PILLARS")
                                .font(.system(size: 10, weight: .bold, design: .rounded)).tracking(4)
                                .foregroundColor(Color(hex: "#F1C40F"))
                            Text("Quantum Nutrition Framework")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        ForEach(QuantumPillar.allCases, id: \.self) { pillar in
                            pillarDetail(pillar)
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#F1C40F"))
                }
            }
        }
    }
    
    private func pillarDetail(_ pillar: QuantumPillar) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(pillar.color.opacity(0.2)).frame(width: 50, height: 50)
                    Image(systemName: pillar.icon).font(.system(size: 22)).foregroundColor(pillar.color)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(pillar.rawValue.uppercased())
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(pillar.color)
                    Text("Quantum Pillar")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            Text(pillar.description)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("TOP FOODS").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(pillar.color)
                FlowLayout(spacing: 6) {
                    ForEach(pillar.topFoods, id: \.self) { food in
                        Text(food)
                            .font(.system(size: 11, weight: .semibold, design: .rounded))
                            .foregroundColor(pillar.color)
                            .padding(.horizontal, 10).padding(.vertical, 5)
                            .background(Capsule().fill(pillar.color.opacity(0.12)))
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(pillar.color.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(pillar.color.opacity(0.15), lineWidth: 1))
        )
    }
}


// MARK: - Pineal Protocol View

struct PinealProtocolView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var db = VibeSpectrumDatabase.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 12) {
                            ZStack {
                                Circle().fill(Color(hex: "#9B59B6").opacity(0.2)).frame(width: 80, height: 80)
                                Image(systemName: "eye.fill").font(.system(size: 36)).foregroundColor(Color(hex: "#9B59B6"))
                            }
                            Text("THE PINEAL PROTOCOL")
                                .font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#9B59B6"))
                            Text("Open Your Third Eye Through Diet")
                                .font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                            Text("Your pineal gland is the seat of intuition. These foods either activate it or calcify it.")
                                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary).multilineTextAlignment(.center)
                        }
                        .padding(.top, 12)
                        
                        // Decalcifiers / Activators
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 6) {
                                Image(systemName: "sparkle").foregroundColor(Color(hex: "#00CCFF"))
                                Text("DECALCIFIERS & ACTIVATORS").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#00CCFF"))
                            }
                            
                            ForEach(db.pinealFoods()) { food in
                                FoodResultCard(food: food)
                            }
                        }
                        
                        // Calcifiers
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 6) {
                                Image(systemName: "eye.slash.fill").foregroundColor(.red)
                                Text("CALCIFIERS — AVOID THESE").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(.red)
                            }
                            
                            ForEach(db.allFoods.filter { $0.pinealImpact == .calcifies }) { food in
                                FoodResultCard(food: food)
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
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#9B59B6"))
                }
            }
        }
    }
}

// MARK: - Consciousness Killers View

struct ConsciousnessKillersView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var db = VibeSpectrumDatabase.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.black, Color(hex: "#1a0000"), Color.black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill").font(.system(size: 48)).foregroundColor(.red)
                            Text("CONSCIOUSNESS KILLERS").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(.red)
                            Text("The Kill List").font(.system(size: 24, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                            Text("These substances actively destroy your consciousness hardware. Eliminate them.")
                                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary).multilineTextAlignment(.center)
                        }
                        .padding(.top, 12)
                        
                        ForEach(db.destroyers()) { food in
                            FoodResultCard(food: food)
                        }
                        
                        VStack(spacing: 8) {
                            Text("🐉").font(.system(size: 24))
                            Text("\"Every item on this list was put in your food supply by people who understand frequency. They know exactly what these substances do to your pineal gland, your gut, and your electromagnetic field. This isn't negligence. It's engineering.\"")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary).italic().multilineTextAlignment(.center).lineSpacing(4)
                        }
                        .padding(16)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color.red.opacity(0.06)))
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(.red)
                }
            }
        }
    }
}
