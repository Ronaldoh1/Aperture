// QuantumNourishIntegrations.swift
// SIRI SHORTCUTS + SHAREABLE VIBE MAPS + WIDGETS
// ☀️ SunFlow: Reignited

import SwiftUI
import Intents

// MARK: - Siri Shortcuts Integration

class QuantumNourishShortcuts {
    
    static func donateVibeCheckShortcut() {
        let activity = NSUserActivity(activityType: "com.sunflow.aperture.vibecheck")
        activity.title = "Quantum Vibe Check"
        activity.suggestedInvocationPhrase = "Check my vibe"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = "com.sunflow.aperture.vibecheck"
        
        let attributes = CSSearchableItemAttributeSet(contentType: .item)
        attributes.contentDescription = "Check the vibrational frequency of any food"
        activity.contentAttributeSet = attributes
        
        activity.becomeCurrent()
    }
    
    static func donateScanShortcut() {
        let activity = NSUserActivity(activityType: "com.sunflow.aperture.scanfood")
        activity.title = "Scan Food Label"
        activity.suggestedInvocationPhrase = "Scan my food"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = "com.sunflow.aperture.scanfood"
        activity.becomeCurrent()
    }
    
    static func donateLogMealShortcut() {
        let activity = NSUserActivity(activityType: "com.sunflow.aperture.logmeal")
        activity.title = "Log Quantum Meal"
        activity.suggestedInvocationPhrase = "Log my meal"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = "com.sunflow.aperture.logmeal"
        activity.becomeCurrent()
    }
    
    static func donateAllShortcuts() {
        donateVibeCheckShortcut()
        donateScanShortcut()
        donateLogMealShortcut()
    }
}

// MARK: - Import CoreSpotlight for search
import CoreSpotlight

// MARK: - Shareable Vibe Map (Screenshot Generator)

struct ShareableVibeMapView: View {
    let dailyMhz: Int
    let topFoods: [String]
    let streak: Int
    let date: Date
    
    @State private var showShareSheet = false
    @State private var renderedImage: UIImage?
    
    var body: some View {
        VStack(spacing: 0) {
            // The card that gets shared
            vibeMapCard
                .padding(2)
            
            // Share button
            Button {
                renderAndShare()
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("SHARE YOUR VIBE MAP")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 12).fill(vibeColor))
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
        }
        .sheet(isPresented: $showShareSheet) {
            if let image = renderedImage {
                ActivityViewController(activityItems: [
                    image,
                    "My frequency today: \(dailyMhz) MHz 🔥 Track yours with Quantum Nourish by SunFlow: Reignited ☀️ #QuantumNourish #VibeSpectrum #EatHighVibe"
                ])
            }
        }
    }
    
    private var vibeColor: Color {
        if dailyMhz >= 72 { return Color(hex: "#9933FF") }
        if dailyMhz >= 50 { return Color(hex: "#2ECC71") }
        if dailyMhz >= 25 { return Color(hex: "#F1C40F") }
        return Color(hex: "#E74C3C")
    }
    
    private var vibeLabel: String {
        if dailyMhz >= 90 { return "TRANSCENDENT" }
        if dailyMhz >= 72 { return "ELEVATED" }
        if dailyMhz >= 50 { return "RISING" }
        if dailyMhz >= 25 { return "BASELINE" }
        return "LOW FREQUENCY"
    }
    
    // The shareable card
    private var vibeMapCard: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("QUANTUM NOURISH")
                        .font(.system(size: 8, weight: .bold)).tracking(3)
                        .foregroundColor(Color(hex: "#2ECC71"))
                    Text("☀️ SunFlow: Reignited")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
                Spacer()
                Text(date.formatted(.dateTime.month(.abbreviated).day()))
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Palette.text.muted)
            }
            
            // Main frequency display
            ZStack {
                // Glow ring
                Circle()
                    .stroke(vibeColor.opacity(0.3), lineWidth: 3)
                    .frame(width: 120, height: 120)
                
                Circle()
                    .fill(RadialGradient(colors: [vibeColor.opacity(0.3), Color.clear], center: .center, startRadius: 0, endRadius: 60))
                    .frame(width: 120, height: 120)
                
                VStack(spacing: 4) {
                    Text("\(dailyMhz)")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    Text("MHz")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            // Status badge
            Text(vibeLabel)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(vibeColor)
                .padding(.horizontal, 16).padding(.vertical, 6)
                .background(Capsule().fill(vibeColor.opacity(0.15)))
            
            // Spectrum bar
            HStack(spacing: 1) {
                ForEach(FrequencyTier.allCases, id: \.self) { tier in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(tier.color)
                        .frame(height: 6)
                }
            }
            .clipShape(Capsule())
            
            // Today's top foods
            if !topFoods.isEmpty {
                VStack(spacing: 6) {
                    Text("TODAY'S FUEL").font(.system(size: 8, weight: .bold)).tracking(2).foregroundColor(Palette.text.muted)
                    Text(topFoods.joined(separator: " • "))
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            // Streak
            if streak > 0 {
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill").font(.system(size: 12)).foregroundColor(.orange)
                    Text("\(streak) day streak")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.orange)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(colors: [Color(hex: "#0a0a14"), Color(hex: "#0d1117")], startPoint: .top, endPoint: .bottom))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(vibeColor.opacity(0.2), lineWidth: 1))
        )
        .padding(.horizontal, 20)
    }
    
    private func renderAndShare() {
        let renderer = ImageRenderer(content: vibeMapCard.frame(width: 350))
        renderer.scale = 3
        if let image = renderer.uiImage {
            renderedImage = image
            showShareSheet = true
        }
    }
}

// MARK: - Activity View Controller (Share Sheet)

struct ActivityViewController: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Widget Data Provider

struct QuantumNourishWidgetData: Codable {
    let dailyMhz: Int
    let streak: Int
    let lastMeal: String
    let lastMealMhz: Int
    let timestamp: Date
    
    static let suiteName = "group.com.sunflow.aperture"
    
    static func save(_ data: QuantumNourishWidgetData) {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return }
        if let encoded = try? JSONEncoder().encode(data) {
            defaults.set(encoded, forKey: "quantum_nourish_widget")
        }
    }
    
    static func load() -> QuantumNourishWidgetData {
        guard let defaults = UserDefaults(suiteName: suiteName),
              let data = defaults.data(forKey: "quantum_nourish_widget"),
              let decoded = try? JSONDecoder().decode(QuantumNourishWidgetData.self, from: data) else {
            return QuantumNourishWidgetData(dailyMhz: 0, streak: 0, lastMeal: "No meals logged", lastMealMhz: 0, timestamp: Date())
        }
        return decoded
    }
}

// MARK: - Quick Vibe Check (Voice Query Response)

struct VibeCheckEngine {
    static let db = VibeSpectrumDatabase.shared
    
    /// Generate a spoken response for "Is [food] high vibe?"
    static func vibeCheck(for query: String) -> String {
        let results = db.search(query)
        
        guard let food = results.first else {
            return "I don't have frequency data for '\(query)' yet. Try scanning the ingredient label for a full analysis."
        }
        
        var response = "\(food.name) is in the \(food.tier.rawValue) tier at approximately \(food.mhzEstimate) megahertz. "
        
        switch food.tier {
        case .destructive, .acidic:
            response += "This is a consciousness killer. \(food.effects.first ?? "Avoid it.") "
            if let alt = food.alternatives.first {
                response += "Try \(alt) instead."
            }
        case .low:
            response += "Low frequency — minimal life force. Consider upgrading to a higher-vibe option."
        case .neutral:
            response += "Neutral — it won't harm you, but it won't elevate you either."
        case .mediumLow, .mediumHigh:
            response += "Good choice. \(food.effects.first ?? "") This supports your consciousness hardware."
        case .high, .superHigh:
            response += "Excellent. This is premium consciousness fuel. \(food.effects.first ?? "") Keep it up."
        }
        
        return response
    }
}
