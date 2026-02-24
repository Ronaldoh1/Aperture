// CameraVibeScannerView.swift
// LIVE INGREDIENT SCANNER — Point. Scan. Decode.
// Uses VisionKit for real-time OCR on food labels
// ☀️ SunFlow: Reignited

import SwiftUI
import VisionKit

// MARK: - Camera Scanner Coordinator

@available(iOS 16.0, *)
struct CameraVibeScannerView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var db = VibeSpectrumDatabase.shared
    @State private var scannedText = ""
    @State private var scanResults: [IngredientScanResult] = []
    @State private var showResults = false
    @State private var overallVerdict = ""
    @State private var overallColor: Color = .gray
    @State private var isScanning = true
    @State private var pulsePhase: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                if isScanning {
                    scanningInterface
                } else {
                    resultsInterface
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "xmark")
                            Text("Close")
                        }
                        .foregroundColor(Color(hex: "#E74C3C"))
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "viewfinder")
                            .foregroundColor(Color(hex: "#E74C3C"))
                        Text("VIBE SCANNER")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .tracking(2)
                            .foregroundColor(Color(hex: "#E74C3C"))
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    pulsePhase = 1
                }
            }
        }
    }
    
    // MARK: - Scanning Interface
    
    private var scanningInterface: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Simulated viewfinder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.03))
                    .frame(height: 280)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "#E74C3C").opacity(0.3 + pulsePhase * 0.3), lineWidth: 2)
                    )
                
                // Corner brackets
                VStack {
                    HStack {
                        scanCorner(rotation: 0)
                        Spacer()
                        scanCorner(rotation: 90)
                    }
                    Spacer()
                    HStack {
                        scanCorner(rotation: 270)
                        Spacer()
                        scanCorner(rotation: 180)
                    }
                }
                .padding(8)
                .frame(height: 280)
                
                // Center icon
                VStack(spacing: 12) {
                    Image(systemName: "barcode.viewfinder")
                        .font(.system(size: 48))
                        .foregroundColor(Color(hex: "#E74C3C").opacity(0.5 + pulsePhase * 0.3))
                    
                    Text("POINT AT INGREDIENT LABEL")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .tracking(2)
                        .foregroundColor(Color(hex: "#E74C3C").opacity(0.7))
                    
                    Text("Camera will read text automatically")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
            }
            .padding(.horizontal, 20)
            
            // Manual paste option
            VStack(spacing: 12) {
                Text("OR PASTE INGREDIENTS MANUALLY")
                    .font(.system(size: 9, weight: .bold)).tracking(2)
                    .foregroundColor(Palette.text.muted)
                
                HStack(spacing: 10) {
                    TextField("Paste ingredient list here...", text: $scannedText, axis: .vertical)
                        .font(.system(size: 14, weight: .medium, design: .monospaced))
                        .foregroundColor(Palette.text.primary)
                        .lineLimit(3...6)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.05))
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.1), lineWidth: 1))
                        )
                }
                .padding(.horizontal, 20)
                
                // Quick test labels
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        testLabel("🥤 Coca-Cola", "Carbonated Water, High Fructose Corn Syrup, Caramel Color, Phosphoric Acid, Natural Flavors, Caffeine")
                        testLabel("🍕 Hot Pocket", "Enriched Flour, Water, Reduced Fat Mozzarella Cheese, Pepperoni, Soybean Oil, Modified Food Starch, Sodium Phosphates, BHT, TBHQ, Artificial Flavor")
                        testLabel("🍫 Snickers", "Milk Chocolate, Peanuts, Corn Syrup, Sugar, Palm Oil, Skim Milk, Lactose, Salt, Egg Whites, Artificial Flavor, Soy Lecithin")
                        testLabel("🥗 Clean Salad", "Organic Mixed Greens, Avocado, Cherry Tomatoes, Hemp Seeds, Extra Virgin Olive Oil, Lemon Juice, Pink Himalayan Salt")
                        testLabel("🧃 Naked Juice", "Apple Juice, Mango Puree, Orange Juice, Banana Puree, Natural Flavors")
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            Spacer()
            
            // Analyze button
            Button {
                analyzeScannedIngredients()
                HapticManager.shared.heavy()
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "waveform.path.ecg")
                    Text("DECODE FREQUENCY")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#E74C3C"), Color(hex: "#C0392B")],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                )
                .padding(.horizontal, 20)
            }
            .disabled(scannedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .opacity(scannedText.isEmpty ? 0.4 : 1)
            
            Spacer().frame(height: 30)
        }
    }
    
    private func scanCorner(rotation: Double) -> some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 20))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 20, y: 0))
        }
        .stroke(Color(hex: "#E74C3C"), lineWidth: 3)
        .frame(width: 20, height: 20)
        .rotationEffect(.degrees(rotation))
    }
    
    private func testLabel(_ name: String, _ ingredients: String) -> some View {
        Button {
            scannedText = ingredients
            HapticManager.shared.light()
        } label: {
            Text(name)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.06))
                        .overlay(Capsule().stroke(Color.white.opacity(0.1), lineWidth: 1))
                )
        }
    }
    
    // MARK: - Results Interface
    
    private var resultsInterface: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Verdict banner
                verdictBanner
                
                // Vibe breakdown chart
                vibeBreakdownChart
                
                // Individual ingredients
                VStack(alignment: .leading, spacing: 12) {
                    Text("INGREDIENT BREAKDOWN")
                        .font(.system(size: 10, weight: .bold)).tracking(2)
                        .foregroundColor(Palette.text.muted)
                    
                    ForEach(scanResults) { result in
                        ingredientResultRow(result)
                    }
                }
                
                // Share & Action buttons
                HStack(spacing: 12) {
                    Button {
                        isScanning = true
                        scannedText = ""
                        scanResults = []
                    } label: {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text("SCAN AGAIN")
                        }
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(Color(hex: "#E74C3C"))
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(hex: "#E74C3C").opacity(0.3), lineWidth: 1)
                        )
                    }
                    
                    Button {
                        shareVibeReport()
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("SHARE")
                        }
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(hex: "#E74C3C"))
                        )
                    }
                }
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
        }
    }
    
    // MARK: - Verdict Banner
    
    private var verdictBanner: some View {
        let destructiveCount = scanResults.filter { $0.dangerLevel == .destructive }.count
        let acidicCount = scanResults.filter { $0.dangerLevel == .acidic }.count
        let highCount = scanResults.filter { $0.dangerLevel == .high || $0.dangerLevel == .superHigh }.count
        
        return VStack(spacing: 14) {
            // Aura visualization
            ZStack {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(overallColor.opacity(0.2 - Double(i) * 0.06), lineWidth: 2)
                        .frame(width: 100 + CGFloat(i) * 30, height: 100 + CGFloat(i) * 30)
                }
                
                Circle()
                    .fill(RadialGradient(
                        colors: [overallColor.opacity(0.3), overallColor.opacity(0.05)],
                        center: .center, startRadius: 10, endRadius: 50
                    ))
                    .frame(width: 100, height: 100)
                
                VStack(spacing: 4) {
                    if destructiveCount > 0 {
                        Text("☠️").font(.system(size: 32))
                    } else if acidicCount > 0 {
                        Text("⚠️").font(.system(size: 32))
                    } else if highCount > 0 {
                        Text("✨").font(.system(size: 32))
                    } else {
                        Text("🔍").font(.system(size: 32))
                    }
                }
            }
            
            Text("SCAN VERDICT")
                .font(.system(size: 9, weight: .bold)).tracking(3)
                .foregroundColor(overallColor)
            
            Text(overallVerdict)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(overallColor)
                .multilineTextAlignment(.center)
            
            // Stats row
            HStack(spacing: 20) {
                verdictStat(count: destructiveCount, label: "TOXIC", color: .red)
                verdictStat(count: acidicCount, label: "ACIDIC", color: .orange)
                verdictStat(count: scanResults.filter { $0.dangerLevel == .neutral || $0.dangerLevel == .mediumLow }.count, label: "NEUTRAL", color: .yellow)
                verdictStat(count: highCount, label: "HIGH VIBE", color: Color(hex: "#9B59B6"))
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(overallColor.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(overallColor.opacity(0.15), lineWidth: 1))
        )
    }
    
    private func verdictStat(count: Int, label: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text("\(count)").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(color.opacity(0.7))
        }
    }
    
    // MARK: - Vibe Breakdown Chart
    
    private var vibeBreakdownChart: some View {
        let tiers = FrequencyTier.allCases
        let maxCount = tiers.map { tier in scanResults.filter { $0.dangerLevel == tier }.count }.max() ?? 1
        
        return VStack(alignment: .leading, spacing: 10) {
            Text("FREQUENCY DISTRIBUTION")
                .font(.system(size: 9, weight: .bold)).tracking(2)
                .foregroundColor(Palette.text.muted)
            
            HStack(alignment: .bottom, spacing: 4) {
                ForEach(tiers, id: \.self) { tier in
                    let count = scanResults.filter { $0.dangerLevel == tier }.count
                    VStack(spacing: 4) {
                        if count > 0 {
                            Text("\(count)")
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                                .foregroundColor(tier.color)
                        }
                        RoundedRectangle(cornerRadius: 3)
                            .fill(tier.color.opacity(count > 0 ? 1 : 0.2))
                            .frame(height: max(4, CGFloat(count) / CGFloat(max(maxCount, 1)) * 60))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 80)
            
            HStack {
                Text("☠️").font(.system(size: 10))
                Spacer()
                Text("⚡").font(.system(size: 10))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.03))
        )
    }
    
    // MARK: - Individual Result Row
    
    private func ingredientResultRow(_ result: IngredientScanResult) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 10) {
                // Tier indicator
                Circle()
                    .fill(result.dangerLevel.color)
                    .frame(width: 10, height: 10)
                
                Text(result.ingredientName)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Spacer()
                
                Text(result.dangerLevel.rawValue.uppercased())
                    .font(.system(size: 9, weight: .bold, design: .rounded))
                    .foregroundColor(result.dangerLevel.color)
                    .padding(.horizontal, 8).padding(.vertical, 3)
                    .background(Capsule().fill(result.dangerLevel.color.opacity(0.15)))
            }
            
            Text(result.explanation)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(3)
            
            if !result.alternatives.isEmpty {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.triangle.swap").font(.system(size: 9)).foregroundColor(.green)
                    Text("Swap: \(result.alternatives.joined(separator: ", "))")
                        .font(.system(size: 11, weight: .semibold)).foregroundColor(.green)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(result.dangerLevel.color.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(result.dangerLevel.color.opacity(0.1), lineWidth: 1))
        )
    }
    
    // MARK: - Analysis Engine
    
    private func analyzeScannedIngredients() {
        let ingredients = scannedText
            .replacingOccurrences(of: ",", with: "\n")
            .components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        scanResults = ingredients.map { ingredient in
            let matched = matchIngredientAdvanced(ingredient)
            return matched
        }
        
        let destructiveCount = scanResults.filter { $0.dangerLevel == .destructive }.count
        let acidicCount = scanResults.filter { $0.dangerLevel == .acidic }.count
        let highCount = scanResults.filter { $0.dangerLevel == .high || $0.dangerLevel == .superHigh || $0.dangerLevel == .mediumHigh }.count
        
        if destructiveCount >= 3 {
            overallVerdict = "☠️ CONSCIOUSNESS KILLER\n\(destructiveCount) toxic ingredients — avoid completely"
            overallColor = .red
        } else if destructiveCount > 0 {
            overallVerdict = "⚠️ TOXIC ALERT\n\(destructiveCount) consciousness suppressant(s) detected"
            overallColor = Color(hex: "#FF4444")
        } else if acidicCount > 2 {
            overallVerdict = "😐 LOW FREQUENCY\nMostly acidic ingredients — consider alternatives"
            overallColor = .orange
        } else if highCount > acidicCount {
            overallVerdict = "✨ HIGH VIBE APPROVED\nThis food supports consciousness elevation"
            overallColor = Color(hex: "#2ECC71")
        } else {
            overallVerdict = "🔄 MIXED SIGNAL\nSome good, some to watch — see breakdown"
            overallColor = .yellow
        }
        
        isScanning = false
    }
    
    private func matchIngredientAdvanced(_ ingredient: String) -> IngredientScanResult {
        let lower = ingredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Direct database match
        if let food = db.matchIngredient(ingredient) {
            return IngredientScanResult(
                ingredientName: ingredient,
                matchedFood: food,
                dangerLevel: food.tier,
                explanation: food.quantumNote,
                alternatives: food.alternatives
            )
        }
        
        // Comprehensive keyword matching
        let destructiveKeywords: [(String, String, [String])] = [
            ("high fructose corn syrup", "HFCS — mercury-contaminated sweetener that bypasses satiety signals. Metabolic weapon found in most processed foods.", ["Raw honey", "Maple syrup"]),
            ("caramel color", "Contains 4-MEI, a known carcinogen. Added purely for appearance — provides zero nutritional value.", ["Avoid — purely cosmetic"]),
            ("phosphoric acid", "Strips calcium from bones. pH 2.5 — more acidic than vinegar. Found in cola drinks.", ["Sparkling water with lemon"]),
            ("natural flavors", "Catch-all term hiding 100+ chemical compounds including MSG. 'Natural' means nothing legally.", ["Real herbs and spices"]),
            ("artificial flavor", "Synthetic chemicals engineered to trick your brain. No nutritional value, pure deception.", ["Real food flavoring"]),
            ("sodium phosphate", "Disrupts mineral balance. Accelerates aging at cellular level. Kidney stress.", ["Sea salt"]),
            ("bht", "Butylated Hydroxytoluene — petroleum-derived preservative. Banned in several countries. Endocrine disruptor.", ["Vitamin E (natural preservative)"]),
            ("bha", "Butylated Hydroxyanisole — 'reasonably anticipated to be a human carcinogen' per NIH. Still FDA approved.", ["Rosemary extract"]),
            ("tbhq", "Tertiary Butylhydroquinone — derived from petroleum. Linked to vision disturbances, liver effects.", ["Natural antioxidants"]),
            ("modified food starch", "Chemically altered starch — your body doesn't recognize it. Creates inflammatory response.", ["Tapioca, arrowroot"]),
            ("soy lecithin", "95% of US soy is GMO. Highly processed emulsifier. Endocrine disrupting properties.", ["Sunflower lecithin"]),
            ("enriched flour", "Stripped of all nutrition, then synthetic vitamins added back. Dead food wearing a costume.", ["Sprouted grain flour", "Almond flour"]),
            ("corn syrup", "Processed corn sugar. Spikes insulin. Often from GMO corn. Feeds candida overgrowth.", ["Raw honey", "Dates"]),
            ("palm oil", "Inflammatory omega-6 heavy. Environmentally destructive. Often contains processing contaminants.", ["Coconut oil", "Olive oil"]),
            ("soybean oil", "Highly processed, GMO, omega-6 inflammatory. In nearly every processed food.", ["Avocado oil", "Olive oil"]),
            ("red 40", "Petroleum-derived dye. Linked to hyperactivity, behavioral issues. Banned in several EU countries.", ["Beet juice (natural color)"]),
            ("yellow 5", "Tartrazine — coal tar derivative. Allergenic. Behavioral effects in children.", ["Turmeric (natural color)"]),
            ("blue 1", "Brilliant Blue — synthetic dye that crosses the blood-brain barrier. Why is this in food?", ["Spirulina (natural blue)"]),
            ("sodium benzoate", "When combined with vitamin C, forms benzene (carcinogen). Common in acidic drinks.", ["Citric acid preservation"]),
            ("sucralose", "Splenda — chlorinated sugar molecule. Destroys gut bacteria. 50% stays in body.", ["Stevia", "Monk fruit"]),
            ("maltodextrin", "Higher glycemic index than table sugar (GI: 110 vs 65). Spikes blood sugar violently.", ["Coconut sugar"]),
            ("artificial color", "Petroleum-derived compounds added to make dead food look alive. Pure deception.", ["Natural plant-based colors"]),
            ("aspartame", "Breaks down to methanol → formaldehyde in your body. Excitotoxin that kills neurons.", ["Stevia leaf", "Raw honey"]),
        ]
        
        for (keyword, explanation, alts) in destructiveKeywords {
            if lower.contains(keyword) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .destructive,
                    explanation: explanation,
                    alternatives: alts
                )
            }
        }
        
        let acidicKeywords: [(String, String)] = [
            ("sugar", "Refined sugar feeds candida, inflammation, and addiction. Consciousness suppressant."),
            ("skim milk", "Oxidized cholesterol from processing. Synthetic vitamin D added. Dead dairy."),
            ("lactose", "Dairy sugar most adults can't properly digest. Creates inflammation and mucus."),
            ("egg whites", "Isolated from whole food context. Avidin blocks biotin absorption when processed."),
            ("canola", "Rapeseed oil — requires hexane extraction. Inflammatory omega-6 dominant."),
            ("peanut", "High in inflammatory omega-6. Often contaminated with aflatoxin (carcinogenic mold)."),
            ("whey protein", "Heavily processed dairy byproduct. Mucus-forming. Often contaminated."),
        ]
        
        for (keyword, explanation) in acidicKeywords {
            if lower.contains(keyword) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .acidic,
                    explanation: explanation,
                    alternatives: []
                )
            }
        }
        
        // Positive keywords
        let highVibeKeywords: [(String, String)] = [
            ("organic", "Organic certification means no synthetic pesticides or GMOs. Higher biophotonic activity."),
            ("hemp", "Complete protein with perfect omega ratio. Anti-inflammatory. Brain food."),
            ("avocado", "Heart-healthy monounsaturated fats. Hormone building blocks. Nutrient absorption booster."),
            ("olive oil", "Extra virgin = liquid gold. Anti-inflammatory oleocanthal. Mediterranean life force."),
            ("lemon", "Despite being acidic, lemons are alkaline-forming in the body. Vitamin C powerhouse."),
            ("himalayan salt", "84 trace minerals your body needs. Unprocessed. Energetically coherent crystal structure."),
            ("cherry tomato", "Lycopene-rich. Antioxidant. Living food when fresh and organic."),
            ("mixed greens", "Chlorophyll = liquid sunlight. Alkalizing. Enzyme-rich when raw."),
            ("turmeric", "Curcumin — most studied anti-inflammatory on Earth. Pineal decalcifier."),
            ("ginger", "Universal medicine in Ayurveda. Increases digestive fire. Clears energy channels."),
        ]
        
        for (keyword, explanation) in highVibeKeywords {
            if lower.contains(keyword) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .mediumHigh,
                    explanation: explanation,
                    alternatives: []
                )
            }
        }
        
        // Neutral fallback
        let neutralKeywords: [(String, String)] = [
            ("water", "The foundation of life. Quality matters — spring > filtered > tap."),
            ("salt", "Essential mineral. Choose unrefined (pink, Celtic, sea) over processed table salt."),
            ("milk chocolate", "Processed cacao with sugar and dairy. The cacao is good; the rest is not."),
        ]
        
        for (keyword, explanation) in neutralKeywords {
            if lower.contains(keyword) {
                return IngredientScanResult(
                    ingredientName: ingredient,
                    matchedFood: nil,
                    dangerLevel: .neutral,
                    explanation: explanation,
                    alternatives: []
                )
            }
        }
        
        return IngredientScanResult(
            ingredientName: ingredient,
            matchedFood: nil,
            dangerLevel: .neutral,
            explanation: "Not in our database. Research this ingredient independently — if you can't pronounce it, your body probably can't process it.",
            alternatives: []
        )
    }
    
    private func shareVibeReport() {
        // Generate shareable vibe report
        let destructiveCount = scanResults.filter { $0.dangerLevel == .destructive }.count
        let report = """
        🔬 QUANTUM NOURISH SCAN REPORT
        ═══════════════════════════════
        
        \(overallVerdict)
        
        Ingredients analyzed: \(scanResults.count)
        Toxic: \(destructiveCount)
        High vibe: \(scanResults.filter { $0.dangerLevel == .high || $0.dangerLevel == .superHigh }.count)
        
        Scanned via SunFlow: Reignited
        "Your plate is a portal. Choose your frequency."
        """
        
        // In production, use UIActivityViewController
        UIPasteboard.general.string = report
        HapticManager.shared.success()
    }
}
