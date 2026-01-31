// EquityWeaveView.swift
// Weaving Fairness into the Fabric of Society
// Analyze offer letters, understand economic systems, audit pay equity

import SwiftUI
import NaturalLanguage

// MARK: - Models

struct OfferAnalysis: Identifiable {
    let id = UUID()
    let jobTitle: String
    let company: String
    let baseSalary: Double
    let totalComp: Double
    let marketComparison: MarketComparison
    let redFlags: [EquityRedFlag]
    let greenFlags: [GreenFlag]
    let negotiationTips: [String]
    let suggestedCounterOffer: Double?
    let analyzedAt: Date
}

struct MarketComparison {
    let percentile: Int // Where this offer falls (1-100)
    let marketLow: Double
    let marketMedian: Double
    let marketHigh: Double
    let location: String
    let experienceLevel: String
}

struct EquityRedFlag: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let severity: Int // 1-5
}

struct GreenFlag: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

// MARK: - Main View

struct EquityWeaveView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Tab Selector
                tabSelector
                
                // Content
                if selectedTab == 0 {
                    offerAnalyzerSection
                } else if selectedTab == 1 {
                    wealthSimulatorSection
                } else {
                    payAuditSection
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("EquityWeave")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.green, .yellow],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "scale.3d")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("EQUITYWEAVE")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Know your worth. Negotiate with power.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        HStack(spacing: 0) {
            tabButton("Offer Analyzer", index: 0)
            tabButton("Wealth Sim", index: 1)
            tabButton("Pay Audit", index: 2)
        }
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func tabButton(_ title: String, index: Int) -> some View {
        Button(action: { selectedTab = index }) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(selectedTab == index ? .white : .gray)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(selectedTab == index ? Color.white.opacity(0.1) : Color.clear)
                .cornerRadius(10)
        }
    }
    
    // MARK: - Offer Analyzer
    
    private var offerAnalyzerSection: some View {
        OfferAnalyzerView()
    }
    
    // MARK: - Wealth Simulator
    
    private var wealthSimulatorSection: some View {
        WealthSimulatorView()
    }
    
    // MARK: - Pay Audit
    
    private var payAuditSection: some View {
        PayAuditView()
    }
}

// MARK: - Offer Analyzer View

struct OfferAnalyzerView: View {
    @State private var offerText = ""
    @State private var analysis: OfferAnalysis?
    @State private var isAnalyzing = false
    @State private var showingPrivacyNote = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Privacy Notice
            if showingPrivacyNote {
                privacyNotice
            }
            
            // Input Section
            inputSection
            
            // Analyze Button
            analyzeButton
            
            // Results
            if let analysis = analysis {
                resultsSection(analysis)
            }
        }
    }
    
    private var privacyNotice: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "lock.shield.fill")
                .foregroundColor(.green)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Your Privacy is Protected")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                Text("Analysis happens on-device using local AI. Your offer letter is NEVER uploaded to any server. Data is deleted after analysis.")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            
            Button(action: { showingPrivacyNote = false }) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }
    
    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "doc.text.fill")
                    .foregroundColor(.cyan)
                Text("PASTE YOUR OFFER LETTER")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
            }
            
            TextEditor(text: $offerText)
                .frame(minHeight: 200)
                .padding(12)
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                )
            
            HStack {
                Button(action: {
                    if let clipboard = UIPasteboard.general.string {
                        offerText = clipboard
                    }
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.on.clipboard")
                        Text("Paste")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(.cyan)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(8)
                }
                
                Spacer()
                
                Text("Or upload: Coming in V2")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var analyzeButton: some View {
        Button(action: analyzeOffer) {
            HStack {
                if isAnalyzing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                } else {
                    Image(systemName: "wand.and.stars")
                }
                Text(isAnalyzing ? "Analyzing..." : "Analyze Offer")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    colors: offerText.isEmpty ? [.gray, .gray] : [.green, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(12)
        }
        .disabled(offerText.isEmpty || isAnalyzing)
    }
    
    private func resultsSection(_ analysis: OfferAnalysis) -> some View {
        VStack(spacing: 16) {
            // Summary Card
            summaryCard(analysis)
            
            // Market Comparison
            marketComparisonCard(analysis.marketComparison)
            
            // Red Flags
            if !analysis.redFlags.isEmpty {
                redFlagsCard(analysis.redFlags)
            }
            
            // Green Flags
            if !analysis.greenFlags.isEmpty {
                greenFlagsCard(analysis.greenFlags)
            }
            
            // Negotiation Tips
            negotiationCard(analysis)
            
            // Counter Offer Template
            if let counter = analysis.suggestedCounterOffer {
                counterOfferCard(counter, analysis: analysis)
            }
        }
    }
    
    private func summaryCard(_ analysis: OfferAnalysis) -> some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundColor(.cyan)
                Text("OFFER SUMMARY")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(analysis.jobTitle)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Text(analysis.company)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("$\(Int(analysis.baseSalary).formatted())")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                    Text("base salary")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
            
            if analysis.totalComp != analysis.baseSalary {
                HStack {
                    Text("Total Comp (with equity/bonus):")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("$\(Int(analysis.totalComp).formatted())")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func marketComparisonCard(_ comparison: MarketComparison) -> some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.purple)
                Text("MARKET COMPARISON")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
                Spacer()
            }
            
            // Percentile indicator
            VStack(spacing: 8) {
                HStack {
                    Text("This offer is in the")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("\(comparison.percentile)th percentile")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(comparison.percentile >= 50 ? .green : .orange)
                }
                
                // Visual bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        // Background
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 12)
                        
                        // Progress
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [.red, .orange, .yellow, .green],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * CGFloat(comparison.percentile) / 100, height: 12)
                        
                        // Marker
                        Circle()
                            .fill(Color.white)
                            .frame(width: 16, height: 16)
                            .offset(x: geo.size.width * CGFloat(comparison.percentile) / 100 - 8)
                    }
                }
                .frame(height: 16)
            }
            
            // Range
            HStack {
                VStack(alignment: .leading) {
                    Text("Low")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                    Text("$\(Int(comparison.marketLow).formatted())")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                VStack {
                    Text("Median")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                    Text("$\(Int(comparison.marketMedian).formatted())")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.yellow)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("High")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                    Text("$\(Int(comparison.marketHigh).formatted())")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.green)
                }
            }
            
            Text("Based on \(comparison.location) • \(comparison.experienceLevel)")
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func redFlagsCard(_ flags: [EquityRedFlag]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("RED FLAGS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.red)
                Spacer()
            }
            
            ForEach(flags) { flag in
                HStack(alignment: .top, spacing: 10) {
                    VStack {
                        ForEach(0..<flag.severity, id: \.self) { _ in
                            Circle()
                                .fill(Color.red)
                                .frame(width: 6, height: 6)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(flag.title)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                        Text(flag.description)
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
                .background(Color.red.opacity(0.1))
                .cornerRadius(6)
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func greenFlagsCard(_ flags: [GreenFlag]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Text("GREEN FLAGS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
                Spacer()
            }
            
            ForEach(flags) { flag in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                        .font(.system(size: 10))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(flag.title)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                        Text(flag.description)
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func negotiationCard(_ analysis: OfferAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .foregroundColor(.orange)
                Text("NEGOTIATION TIPS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.orange)
                Spacer()
            }
            
            ForEach(analysis.negotiationTips, id: \.self) { tip in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 10))
                    Text(tip)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func counterOfferCard(_ counter: Double, analysis: OfferAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.cyan)
                Text("SUGGESTED COUNTER OFFER")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                Spacer()
            }
            
            HStack {
                Text("Ask for:")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("$\(Int(counter).formatted())")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.green)
            }
            
            Text("Sample Email:")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.gray)
            
            Text("""
            Thank you for the offer for the \(analysis.jobTitle) position. I'm excited about the opportunity to join \(analysis.company).
            
            After researching market rates for this role in \(analysis.marketComparison.location) and considering my experience, I'd like to discuss a base salary of $\(Int(counter).formatted()).
            
            I'm confident I can bring significant value to the team and am looking forward to discussing this further.
            """)
            .font(.system(size: 11))
            .foregroundColor(.white.opacity(0.8))
            .padding(10)
            .background(Color.white.opacity(0.05))
            .cornerRadius(8)
            
            Button(action: {
                UIPasteboard.general.string = """
                Thank you for the offer for the \(analysis.jobTitle) position. I'm excited about the opportunity to join \(analysis.company).
                
                After researching market rates for this role and considering my experience, I'd like to discuss a base salary of $\(Int(counter).formatted()).
                
                I'm confident I can bring significant value to the team and am looking forward to discussing this further.
                """
            }) {
                HStack {
                    Image(systemName: "doc.on.clipboard")
                    Text("Copy Email")
                }
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.cyan)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Analysis Logic
    
    private func analyzeOffer() {
        isAnalyzing = true
        
        Task {
            // Simulate processing
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            
            // Extract info using NLP (simplified)
            let extracted = extractOfferDetails(from: offerText)
            
            await MainActor.run {
                analysis = extracted
                isAnalyzing = false
            }
        }
    }
    
    private func extractOfferDetails(from text: String) -> OfferAnalysis {
        // Simple extraction (in production, use more sophisticated NLP)
        let lowercaseText = text.lowercased()
        
        // Extract salary (look for dollar amounts)
        let salaryRegex = try? NSRegularExpression(pattern: "\\$([0-9,]+)", options: [])
        var salary: Double = 100000 // Default
        if let match = salaryRegex?.firstMatch(in: text, options: [], range: NSRange(text.startIndex..., in: text)),
           let range = Range(match.range(at: 1), in: text) {
            let salaryString = String(text[range]).replacingOccurrences(of: ",", with: "")
            salary = Double(salaryString) ?? 100000
        }
        
        // Extract job title (simplified)
        var jobTitle = "Software Engineer" // Default
        let titleKeywords = ["engineer", "manager", "developer", "designer", "analyst", "director"]
        for keyword in titleKeywords {
            if lowercaseText.contains(keyword) {
                jobTitle = keyword.capitalized
                break
            }
        }
        
        // Detect red flags
        var redFlags: [EquityRedFlag] = []
        if lowercaseText.contains("non-compete") {
            redFlags.append(EquityRedFlag(title: "Non-Compete Clause", description: "Restricts your future employment options. Consider negotiating removal.", severity: 4))
        }
        if lowercaseText.contains("at-will") {
            redFlags.append(EquityRedFlag(title: "At-Will Employment", description: "Either party can terminate without cause. Standard but worth noting.", severity: 2))
        }
        if lowercaseText.contains("unlimited pto") || lowercaseText.contains("unlimited vacation") {
            redFlags.append(EquityRedFlag(title: "Unlimited PTO", description: "Often means people take less vacation. Ask about average days taken.", severity: 3))
        }
        
        // Detect green flags
        var greenFlags: [GreenFlag] = []
        if lowercaseText.contains("equity") || lowercaseText.contains("stock") || lowercaseText.contains("rsu") {
            greenFlags.append(GreenFlag(title: "Equity Compensation", description: "Potential for additional upside if company performs well"))
        }
        if lowercaseText.contains("401k match") || lowercaseText.contains("retirement") {
            greenFlags.append(GreenFlag(title: "401k Match", description: "Free money for retirement"))
        }
        if lowercaseText.contains("remote") || lowercaseText.contains("work from home") {
            greenFlags.append(GreenFlag(title: "Remote Work", description: "Flexibility and savings on commute"))
        }
        
        // Market comparison (simplified - would use real data in production)
        let marketComparison = MarketComparison(
            percentile: min(95, max(5, Int((salary / 150000) * 100))),
            marketLow: salary * 0.7,
            marketMedian: salary * 1.1,
            marketHigh: salary * 1.5,
            location: "NYC Metro",
            experienceLevel: "Mid-Level"
        )
        
        // Negotiation tips
        var tips = [
            "Always negotiate - 70% of employers expect it",
            "Focus on total comp, not just base salary",
            "Research comparable roles on Levels.fyi and Glassdoor"
        ]
        
        if salary < marketComparison.marketMedian {
            tips.append("Your offer is below median. You have room to negotiate.")
        }
        
        // Suggested counter
        let suggestedCounter = salary < marketComparison.marketMedian ? marketComparison.marketMedian : salary * 1.15
        
        return OfferAnalysis(
            jobTitle: jobTitle,
            company: "Company Name",
            baseSalary: salary,
            totalComp: salary * 1.15, // Estimate with equity
            marketComparison: marketComparison,
            redFlags: redFlags,
            greenFlags: greenFlags,
            negotiationTips: tips,
            suggestedCounterOffer: suggestedCounter,
            analyzedAt: Date()
        )
    }
}

// MARK: - Wealth Simulator View

struct WealthSimulatorView: View {
    @State private var income: Double = 75000
    @State private var savingsRate: Double = 20
    @State private var yearsToProject: Double = 10
    @State private var investmentReturn: Double = 7
    
    var projectedWealth: Double {
        let monthlySavings = (income * savingsRate / 100) / 12
        let months = Int(yearsToProject * 12)
        let monthlyReturn = investmentReturn / 100 / 12
        
        var total: Double = 0
        for _ in 0..<months {
            total = (total + monthlySavings) * (1 + monthlyReturn)
        }
        return total
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(.green)
                Text("WEALTH SIMULATOR")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            Text("See how policy decisions affect YOUR wealth")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            // Income Slider
            sliderSection("Annual Income", value: $income, range: 30000...300000, format: "$%.0f")
            
            // Savings Rate
            sliderSection("Savings Rate", value: $savingsRate, range: 5...50, format: "%.0f%%")
            
            // Years
            sliderSection("Years to Project", value: $yearsToProject, range: 5...40, format: "%.0f years")
            
            // Investment Return
            sliderSection("Annual Return", value: $investmentReturn, range: 3...12, format: "%.1f%%")
            
            // Result
            VStack(spacing: 8) {
                Text("Projected Wealth")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("$\(Int(projectedWealth).formatted())")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.green)
                Text("in \(Int(yearsToProject)) years")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(12)
            
            // Policy Impact
            policyImpactSection
        }
    }
    
    private func sliderSection(_ title: String, value: Binding<Double>, range: ClosedRange<Double>, format: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text(String(format: format, value.wrappedValue))
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
            Slider(value: value, in: range)
                .tint(.green)
        }
    }
    
    private var policyImpactSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Policy Impact Scenarios:")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.orange)
            
            policyRow("If min wage was $25/hr", impact: "+$12,000/yr for low wage workers")
            policyRow("If healthcare was free", impact: "+$6,000/yr average savings")
            policyRow("If student debt was cancelled", impact: "+$400/mo for 45M Americans")
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func policyRow(_ policy: String, impact: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(policy)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white)
            Text(impact)
                .font(.system(size: 10))
                .foregroundColor(.green)
        }
    }
}

// MARK: - Pay Audit View

struct PayAuditView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "building.2.fill")
                    .foregroundColor(.purple)
                Text("PAY EQUITY AUDIT")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
            }
            
            Text("Compare your pay to industry standards")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            // Coming Soon
            VStack(spacing: 12) {
                Image(systemName: "lock.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                
                Text("Coming in V2")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Features planned:")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 6) {
                    featureRow("Anonymous pay data aggregation")
                    featureRow("Industry-specific benchmarks")
                    featureRow("Gender & race pay gap analysis")
                    featureRow("Collective bargaining tools")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    private func featureRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.purple)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

#Preview {
    NavigationView {
        EquityWeaveView()
    }
}
