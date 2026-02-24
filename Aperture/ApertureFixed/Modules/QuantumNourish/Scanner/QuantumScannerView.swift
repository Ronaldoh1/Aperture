// QuantumScannerView.swift
// INGREDIENT SCANNER — Decode What's Really In Your Food
// ☀️ SunFlow: Reignited

import SwiftUI

struct QuantumScannerView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var db = VibeSpectrumDatabase.shared
    @State private var ingredientText = ""
    @State private var scanResults: [IngredientScanResult] = []
    @State private var hasScanned = false
    @State private var overallScore: String = ""
    @State private var overallColor: Color = .gray
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 12) {
                            Image(systemName: "barcode.viewfinder")
                                .font(.system(size: 48))
                                .foregroundColor(Color(hex: "#E74C3C"))
                            Text("QUANTUM INGREDIENT SCANNER")
                                .font(.system(size: 10, weight: .bold)).tracking(3)
                                .foregroundColor(Color(hex: "#E74C3C"))
                            Text("Decode What's Really in Your Food")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        // Input section
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "text.viewfinder")
                                    .foregroundColor(Color(hex: "#E74C3C"))
                                Text("PASTE INGREDIENT LIST")
                                    .font(.system(size: 10, weight: .bold)).tracking(1)
                                    .foregroundColor(Color(hex: "#E74C3C"))
                            }
                            
                            Text("Copy the ingredients from any food label and paste them here. We'll decode every item.")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Palette.text.muted)
                            
                            TextEditor(text: $ingredientText)
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundColor(Palette.text.primary)
                                .scrollContentBackground(.hidden)
                                .frame(minHeight: 120)
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.05))
                                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#E74C3C").opacity(0.2), lineWidth: 1))
                                )
                            
                            // Sample labels for testing
                            HStack(spacing: 8) {
                                sampleButton("Coca-Cola", text: "Carbonated Water, High Fructose Corn Syrup, Caramel Color, Phosphoric Acid, Natural Flavors, Caffeine")
                                sampleButton("Doritos", text: "Corn, Vegetable Oil, Maltodextrin, Monosodium Glutamate, Cheddar Cheese, Artificial Color, Natural and Artificial Flavors")
                            }
                            
                            Button {
                                analyzeIngredients()
                                HapticManager.shared.medium()
                            } label: {
                                HStack {
                                    Image(systemName: "waveform.path.ecg")
                                    Text("ANALYZE FREQUENCY")
                                        .font(.system(size: 14, weight: .bold, design: .rounded))
                                }
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(hex: "#E74C3C"))
                                )
                            }
                            .disabled(ingredientText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white.opacity(0.03))
                        )
                        
                        // Results
                        if hasScanned {
                            resultsSection
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#E74C3C"))
                }
            }
        }
    }
    
    private func sampleButton(_ label: String, text: String) -> some View {
        Button {
            ingredientText = text
        } label: {
            Text("Try: \(label)")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .padding(.horizontal, 10).padding(.vertical, 5)
                .background(Capsule().fill(Color.white.opacity(0.06)))
        }
    }
    
    // MARK: - Analysis Engine
    
    private func analyzeIngredients() {
        let ingredients = ingredientText
            .replacingOccurrences(of: ",", with: "\n")
            .components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        scanResults = ingredients.map { ingredient in
            let matched = db.matchIngredient(ingredient)
            
            if let food = matched {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: food,
                    dangerLevel: food.tier,
                    explanation: food.quantumNote,
                    alternatives: food.alternatives
                )
            }
            
            // Check for known bad keywords
            let lower = ingredient.lowercased()
            let dangerKeywords = ["high fructose", "hydrogenated", "artificial", "monosodium glutamate", "msg", "aspartame", "sucralose", "caramel color", "red 40", "yellow 5", "blue 1", "sodium benzoate", "bht", "bha", "tbhq", "phosphoric acid", "natural flavors", "maltodextrin"]
            
            if dangerKeywords.contains(where: { lower.contains($0) }) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .destructive,
                    explanation: "This ingredient is a known consciousness suppressant. Check the Kill List for details.",
                    alternatives: ["Look for organic alternatives without this ingredient"]
                )
            }
            
            let cautionKeywords = ["sugar", "corn syrup", "palm oil", "soybean oil", "canola", "dextrose", "maltose", "modified"]
            if cautionKeywords.contains(where: { lower.contains($0) }) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .acidic,
                    explanation: "This ingredient is low-frequency and should be minimized for consciousness elevation.",
                    alternatives: []
                )
            }
            
            return IngredientScanResult(
                ingredientName: ingredient,
                matchedFood: nil,
                dangerLevel: .neutral,
                explanation: "Not flagged in our database. Research independently.",
                alternatives: []
            )
        }
        
        // Calculate overall
        let destructiveCount = scanResults.filter { $0.dangerLevel == .destructive }.count
        let acidicCount = scanResults.filter { $0.dangerLevel == .acidic }.count
        
        if destructiveCount > 0 {
            overallScore = "☠️ TOXIC — \(destructiveCount) consciousness killers detected"
            overallColor = .red
        } else if acidicCount > 0 {
            overallScore = "⚠️ LOW VIBE — \(acidicCount) energy drainers found"
            overallColor = .orange
        } else {
            overallScore = "✅ CLEAN — No major threats detected"
            overallColor = .green
        }
        
        hasScanned = true
    }
    
    // MARK: - Results
    
    private var resultsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Overall verdict
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 4).fill(overallColor).frame(width: 6, height: 50)
                VStack(alignment: .leading, spacing: 4) {
                    Text("SCAN VERDICT").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(overallColor)
                    Text(overallScore).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(overallColor)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 14).fill(overallColor.opacity(0.08)))
            
            // Individual results
            ForEach(scanResults) { result in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: result.dangerLevel.icon)
                        .font(.system(size: 16))
                        .foregroundColor(result.dangerLevel.color)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(result.ingredientName)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        
                        Text(result.dangerLevel.rawValue.uppercased())
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(result.dangerLevel.color)
                        
                        Text(result.explanation)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(3)
                        
                        if !result.alternatives.isEmpty {
                            HStack(spacing: 4) {
                                Text("SWAP:").font(.system(size: 9, weight: .bold)).foregroundColor(.green)
                                Text(result.alternatives.joined(separator: ", "))
                                    .font(.system(size: 11, weight: .medium)).foregroundColor(.green.opacity(0.8))
                            }
                        }
                    }
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).fill(result.dangerLevel.color.opacity(0.04)))
            }
        }
    }
}
