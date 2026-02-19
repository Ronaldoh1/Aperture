// EconomyWakeUpView.swift
// WHILE YOU WERE DISTRACTED — The Economy Edition
// ☀️ SunFlow: Reignited
//
// "While you were arguing left vs right,
//  the economy was being restructured.
//  Nobody asked your opinion."
//
// Sits in PsyopScanner module family alongside
// Signal vs Noise and Digital Hygiene.
// Links to Fourth Turning course in Alexandria.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct EconomicReality: Identifiable {
    let id = UUID()
    let title: String
    let stat: String
    let explanation: String
    let whileYouWere: String
    let source: String
    let category: EconCategory
    let severity: Int // 1-5
}

enum EconCategory: String, CaseIterable {
    case debt = "National Debt"
    case currency = "Dollar & Currency"
    case housing = "Housing"
    case wages = "Wages & Inflation"
    case consolidation = "Corporate Power"
    case lobbying = "Lobbying & Capture"
    case surveillance = "Financial Control"
    case global = "Global Shifts"
    
    var icon: String {
        switch self {
        case .debt: return "chart.line.uptrend.xyaxis"
        case .currency: return "dollarsign.circle.fill"
        case .housing: return "house.fill"
        case .wages: return "arrow.down.right"
        case .consolidation: return "building.2.fill"
        case .lobbying: return "megaphone.fill"
        case .surveillance: return "eye.trianglebadge.exclamationmark.fill"
        case .global: return "globe.americas.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .debt: return .red
        case .currency: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .housing: return .orange
        case .wages: return .purple
        case .consolidation: return .blue
        case .lobbying: return Color(red: 0.8, green: 0.3, blue: 0.3)
        case .surveillance: return .cyan
        case .global: return .green
        }
    }
}

struct FourthTurningReset: Identifiable {
    let id = UUID()
    let era: String
    let crisis: String
    let oldSystem: String
    let newSystem: String
    let year: String
    let lessons: String
}

// MARK: - ═══════════════════════════════════════════════════
// ECONOMY DATABASE
// ═══════════════════════════════════════════════════════════

struct EconomyWakeUpDatabase {
    
    static let realities: [EconomicReality] = [
        
        // DEBT
        EconomicReality(
            title: "National Debt Exceeds $36 Trillion",
            stat: "$36,000,000,000,000+",
            explanation: "The US national debt grows by approximately $1 trillion every 100 days. The interest payments alone now exceed the entire defense budget. This isn't a future problem — it's a math problem happening NOW.",
            whileYouWere: "While you were arguing about which party spends more, BOTH parties approved every spending bill. Debt is bipartisan.",
            source: "US Treasury, Congressional Budget Office",
            category: .debt,
            severity: 5
        ),
        EconomicReality(
            title: "Interest Payments Exceed Defense Budget",
            stat: "$1+ Trillion/Year in Interest Alone",
            explanation: "The federal government now pays more in interest on existing debt than on the entire military. This means a growing portion of your tax dollars goes to bondholders — many of them foreign governments — not services for you.",
            whileYouWere: "While you debated military spending, the interest bill quietly became the largest expense nobody talks about.",
            source: "Congressional Budget Office",
            category: .debt,
            severity: 5
        ),
        
        // CURRENCY
        EconomicReality(
            title: "Dollar Has Lost 98% Since 1971",
            stat: "$1.00 → $0.02 in Purchasing Power",
            explanation: "When Nixon ended the gold standard in 1971, the dollar became backed by nothing but trust. Since then, the Fed has printed trillions. Your grandparents' dollar buys two cents of what it used to. This isn't inflation — it's devaluation by design.",
            whileYouWere: "While you celebrated a 3% raise, your currency lost 7% in purchasing power. You got a pay cut and didn't know it.",
            source: "Bureau of Labor Statistics, Federal Reserve",
            category: .currency,
            severity: 5
        ),
        EconomicReality(
            title: "Central Banks Buying Gold at Record Rates",
            stat: "3,200+ Tons Purchased (2022-2024)",
            explanation: "Central banks — the institutions that PRINT money — are buying gold at the highest rate in decades. Ask yourself: if the people who create dollars are converting those dollars to gold, what do THEY know about the future of the dollar?",
            whileYouWere: "While you debated crypto vs stocks, the institutions that control the money supply quietly positioned into the oldest store of value on Earth.",
            source: "World Gold Council",
            category: .currency,
            severity: 4
        ),
        EconomicReality(
            title: "BRICS Nations Building Dollar Alternatives",
            stat: "40%+ of World Population in BRICS",
            explanation: "China, Russia, India, Brazil, South Africa — and new members including Egypt, Ethiopia, Iran, UAE — are actively building trade systems that bypass the US dollar. De-dollarization isn't conspiracy — it's published economic policy.",
            whileYouWere: "While you watched domestic politics, the rest of the world started building an economy that doesn't need the dollar.",
            source: "BRICS Summit Communiqués, IMF Reports",
            category: .global,
            severity: 4
        ),
        
        // HOUSING
        EconomicReality(
            title: "Corporate Investors Buying Single-Family Homes",
            stat: "25%+ of Purchases in Some Markets",
            explanation: "BlackRock, Vanguard, Invitation Homes, and other institutional investors are buying single-family homes at scale. They convert them to rentals. The American Dream of homeownership is being transformed into a subscription model — you'll rent from corporations.",
            whileYouWere: "While you blamed millennials for 'not saving enough,' trillion-dollar corporations were outbidding them with cash offers.",
            source: "National Association of Realtors, CoreLogic",
            category: .housing,
            severity: 5
        ),
        EconomicReality(
            title: "Housing Costs vs Income: Historical Gap",
            stat: "Home Prices Up 40%+ vs Wages Up ~5% (2019-2024)",
            explanation: "Home prices surged while wages barely moved. The median home now costs 7-8x median income — historically, this ratio was 3-4x. An entire generation is being priced out of ownership, creating a permanent renter class.",
            whileYouWere: "While the news covered interest rate decisions as if they were sports scores, the gap between housing costs and wages became an unbridgeable canyon.",
            source: "Federal Reserve, Bureau of Labor Statistics",
            category: .housing,
            severity: 5
        ),
        
        // WAGES
        EconomicReality(
            title: "Productivity Up 250%, Wages Up 16% (Since 1971)",
            stat: "250% vs 16%",
            explanation: "Workers produce 250% more value than in 1971. Their wages increased 16%. Where did the other 234% go? Corporate profits, executive compensation, and shareholder returns. This isn't an accident — it's the design of the system since Reaganomics.",
            whileYouWere: "While you argued about minimum wage, the REAL wage theft happened at every level: you produce more, get paid less, and the difference funds billionaire lifestyles.",
            source: "Economic Policy Institute, Bureau of Labor Statistics",
            category: .wages,
            severity: 5
        ),
        EconomicReality(
            title: "Inflation Is a Hidden Tax",
            stat: "Groceries Up 25%+ Since 2020",
            explanation: "When the Fed prints money, it doesn't create value — it dilutes existing value. Your dollar buys less. This is a tax on savings that requires no legislation and no vote. The poorest are hit hardest because they spend the highest percentage of income on essentials.",
            whileYouWere: "While politicians blamed each other for inflation, the institution that actually controls the money supply (the Federal Reserve) is not elected and not accountable to voters.",
            source: "Bureau of Labor Statistics, Consumer Price Index",
            category: .wages,
            severity: 4
        ),
        
        // CONSOLIDATION
        EconomicReality(
            title: "6 Companies Control 90% of Media",
            stat: "50 Companies (1983) → 6 Companies (Now)",
            explanation: "In 1983, 50 companies controlled the majority of US media. Today: Comcast, Disney, Warner Bros Discovery, Paramount, Fox, and a few others control almost everything you read, watch, and hear. Your information ecosystem is a funnel, not an ocean.",
            whileYouWere: "While you debated 'media bias,' the real story was consolidation — it doesn't matter which 'side' the news is on if six companies control all of it.",
            source: "Free Press, Columbia Journalism Review",
            category: .consolidation,
            severity: 4
        ),
        EconomicReality(
            title: "Healthcare Consolidation Driving Prices",
            stat: "Hospital Mergers Up 50%+ in a Decade",
            explanation: "When one system owns every hospital in your region, they set the price. Your 'choice' of healthcare is an illusion in many markets. This consolidation directly increases what you pay for everything from emergency care to prescriptions.",
            whileYouWere: "While the healthcare debate focused on insurance, the real power play was hospitals and pharmaceutical companies merging into regional monopolies.",
            source: "American Hospital Association, FTC Reports",
            category: .consolidation,
            severity: 4
        ),
        
        // LOBBYING
        EconomicReality(
            title: "Lobbying ROI: $200+ Return Per $1 Spent",
            stat: "$200:1 Return on Investment",
            explanation: "For every dollar spent on lobbying, corporations see over $200 in favorable legislation — through tax breaks, subsidies, deregulation, or favorable contracts. This is the most profitable investment in existence. And it's legal.",
            whileYouWere: "While you voted every 2-4 years, lobbyists worked 365 days a year. Their investment in politicians dwarfs your vote's impact on policy.",
            source: "OpenSecrets.org, Congressional Research Service",
            category: .lobbying,
            severity: 5
        ),
        
        // SURVEILLANCE
        EconomicReality(
            title: "CBDC Development Accelerating Worldwide",
            stat: "130+ Countries Exploring Digital Currency",
            explanation: "Central Bank Digital Currencies give governments complete visibility into every transaction. Unlike cash, CBDCs can be programmed: expiration dates, spending restrictions, geographic limits. China's digital yuan is already in pilot. This is programmable money controlled by the state.",
            whileYouWere: "While you debated cryptocurrency regulation, governments worldwide were building their own digital currencies — with total surveillance built in.",
            source: "Bank for International Settlements, Atlantic Council CBDC Tracker",
            category: .surveillance,
            severity: 5
        ),
    ]
    
    // MARK: - Monetary Resets History
    
    static let resets: [FourthTurningReset] = [
        FourthTurningReset(
            era: "American Revolution",
            crisis: "Independence from Britain",
            oldSystem: "British pound / colonial currencies",
            newSystem: "US Dollar (Coinage Act 1792)",
            year: "1780s-1790s",
            lessons: "Continental dollars became worthless during the war. 'Not worth a Continental' became a saying. Paper promises backed by nothing failed. The new system was backed by gold and silver."
        ),
        FourthTurningReset(
            era: "Civil War",
            crisis: "Union vs Confederacy",
            oldSystem: "State-issued bank notes",
            newSystem: "Greenbacks + National Banking Act",
            year: "1860s",
            lessons: "Confederate currency became worthless. The Union printed 'greenbacks' (fiat currency) to fund the war. National banking system standardized money. The transition destroyed Southern wealth overnight."
        ),
        FourthTurningReset(
            era: "Great Depression / WWII",
            crisis: "Economic collapse + world war",
            oldSystem: "Gold standard / pre-war currencies",
            newSystem: "Bretton Woods: Dollar = world reserve currency",
            year: "1930s-1944",
            lessons: "FDR confiscated private gold in 1933 (Executive Order 6102). Bretton Woods pegged all currencies to the dollar, and the dollar to gold. This made America the center of global finance — for one saeculum."
        ),
        FourthTurningReset(
            era: "Current Crisis",
            crisis: "Financial collapse + pandemic + AI + wars",
            oldSystem: "Bretton Woods (1944) → Petrodollar (1971)",
            newSystem: "??? (CBDC? BRICS alternative? Gold-backed? Multi-polar?)",
            year: "2008-~2033",
            lessons: "The current system is 80 years old — one full cycle. Central banks buying gold. BRICS building alternatives. National debt unsustainable. The reset IS coming. The only question is its form."
        ),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// MAIN VIEW
// ═══════════════════════════════════════════════════════════

struct EconomyWakeUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory: EconCategory? = nil
    @State private var showResets = false
    @State private var showFourthTurningCourse = false
    @State private var showMoneyDecodedCourse = false
    @State private var expandedReality: UUID? = nil
    @State private var pulsePhase: CGFloat = 0
    
    private let realities = EconomyWakeUpDatabase.realities
    private let resets = EconomyWakeUpDatabase.resets
    
    var filteredRealities: [EconomicReality] {
        if let cat = selectedCategory {
            return realities.filter { $0.category == cat }
        }
        return realities
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        categoryFilter
                        
                        // Realities
                        ForEach(filteredRealities) { reality in
                            realityCard(reality)
                        }
                        
                        // Monetary Resets History
                        monetaryResetsSection
                        
                        // Fourth Turning link
                        fourthTurningLink
                        
                        // Money Decoded link
                        moneyDecodedLink
                        
                        // Book link
                        bookSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "banknote.fill").foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        Text("Economy Wake-Up").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) { pulsePhase = .pi * 2 }
            }
            .sheet(isPresented: $showFourthTurningCourse) {
                if let course = AlexandriaCourseRegistry.course(for: "fourth_turning") {
                    AlexandriaCourseView(course: course)
                }
            }
            .sheet(isPresented: $showMoneyDecodedCourse) {
                if let course = AlexandriaCourseRegistry.course(for: "money_decoded") {
                    AlexandriaCourseView(course: course)
                }
            }
        }
    }
    
    // MARK: - Hero
    
    private var heroSection: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.06))
                    .frame(width: 70, height: 70)
                    .scaleEffect(1.0 + sin(pulsePhase) * 0.08)
                Image(systemName: "banknote.fill").font(.system(size: 28)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            }
            Text("WHILE YOU WERE DISTRACTED").font(.system(size: 10, weight: .bold)).tracking(4)
                .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
            Text("The Economy Nobody\nIs Telling You About")
                .font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(.white)
                .multilineTextAlignment(.center)
            Text("While you argued left vs right,\nthe economy was being restructured.\nNobody asked your opinion.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center).lineSpacing(3)
        }
        .padding(.top, 8)
    }
    
    // MARK: - Category Filter
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip("All", nil, .white)
                ForEach(EconCategory.allCases, id: \.self) { cat in
                    filterChip(cat.rawValue, cat, cat.color)
                }
            }
            .padding(.horizontal, 4)
        }
    }
    
    private func filterChip(_ label: String, _ category: EconCategory?, _ color: Color) -> some View {
        Button {
            withAnimation(.spring(response: 0.3)) { selectedCategory = category }
        } label: {
            HStack(spacing: 4) {
                if let cat = category { Image(systemName: cat.icon).font(.system(size: 10)) }
                Text(label).font(.system(size: 10, weight: .bold))
            }
            .foregroundColor(selectedCategory == category ? .black : color)
            .padding(.horizontal, 10).padding(.vertical, 6)
            .background(Capsule().fill(selectedCategory == category ? color : color.opacity(0.1)))
        }
    }
    
    // MARK: - Reality Card
    
    private func realityCard(_ reality: EconomicReality) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header (always visible)
            Button {
                withAnimation(.spring(response: 0.3)) {
                    expandedReality = expandedReality == reality.id ? nil : reality.id
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: reality.category.icon)
                        .font(.system(size: 16)).foregroundColor(reality.category.color)
                        .frame(width: 28)
                    VStack(alignment: .leading, spacing: 3) {
                        Text(reality.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text(reality.stat).font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(reality.category.color)
                    }
                    Spacer()
                    // Severity
                    HStack(spacing: 1) {
                        ForEach(0..<reality.severity, id: \.self) { _ in
                            Text("!").font(.system(size: 8, weight: .bold)).foregroundColor(.red)
                        }
                    }
                    Image(systemName: expandedReality == reality.id ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                }
                .padding(12)
            }
            
            // Expanded content
            if expandedReality == reality.id {
                VStack(alignment: .leading, spacing: 10) {
                    Divider().background(Color.white.opacity(0.06))
                    
                    Text(reality.explanation)
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.7))
                        .lineSpacing(3)
                    
                    // "While you were..."
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "eye.slash.fill").font(.system(size: 12)).foregroundColor(.orange)
                        Text(reality.whileYouWere)
                            .font(.system(size: 11, weight: .medium, design: .rounded))
                            .foregroundColor(.orange.opacity(0.8)).lineSpacing(2)
                    }
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.orange.opacity(0.05)))
                    
                    // Source
                    HStack(spacing: 4) {
                        Image(systemName: "doc.text.fill").font(.system(size: 8)).foregroundColor(.white.opacity(0.2))
                        Text("Source: \(reality.source)")
                            .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                    }
                }
                .padding(.horizontal, 12).padding(.bottom, 12)
            }
        }
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(reality.category.color.opacity(0.1), lineWidth: 1)))
    }
    
    // MARK: - Monetary Resets
    
    private var monetaryResetsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation(.spring(response: 0.3)) { showResets.toggle() }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "clock.arrow.2.circlepath").foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    Text("MONETARY RESETS: THE PATTERN").font(.system(size: 11, weight: .bold)).tracking(1)
                        .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
                    Spacer()
                    Image(systemName: showResets ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                }
            }
            
            if showResets {
                Text("Every 80 years, the monetary system resets. Not sometimes. EVERY time.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                
                ForEach(resets) { reset in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 6) {
                            Text(reset.year).font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            Text(reset.era).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        }
                        
                        HStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("OLD").font(.system(size: 8, weight: .bold)).foregroundColor(.red.opacity(0.5))
                                Text(reset.oldSystem).font(.system(size: 10, weight: .medium)).foregroundColor(.red.opacity(0.7))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(systemName: "arrow.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("NEW").font(.system(size: 8, weight: .bold)).foregroundColor(.green.opacity(0.5))
                                Text(reset.newSystem).font(.system(size: 10, weight: .medium)).foregroundColor(.green.opacity(0.7))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Text(reset.lessons)
                            .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                }
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1), lineWidth: 1)))
    }
    
    // MARK: - Fourth Turning Link
    
    private var fourthTurningLink: some View {
        Button { showFourthTurningCourse = true } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(Color(red: 0.17, green: 0.24, blue: 0.31).opacity(0.3)).frame(width: 44, height: 44)
                    Image(systemName: "clock.arrow.2.circlepath").font(.system(size: 18)).foregroundColor(.cyan)
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("THE FOURTH TURNING").font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                        Text("COURSE").font(.system(size: 8, weight: .bold)).tracking(1)
                            .foregroundColor(.black).padding(.horizontal, 6).padding(.vertical, 2)
                            .background(Capsule().fill(.cyan))
                    }
                    Text("The 80-year cycle that explains EVERYTHING happening right now")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.cyan.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.cyan.opacity(0.15), lineWidth: 1)))
        }
    }
    
    // MARK: - Money Decoded Link
    
    private var moneyDecodedLink: some View {
        Button { showMoneyDecodedCourse = true } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(Color(red: 0.95, green: 0.77, blue: 0.06).opacity(0.2)).frame(width: 44, height: 44)
                    Image(systemName: "banknote.fill").font(.system(size: 18)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("MONEY DECODED").font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                        Text("COURSE").font(.system(size: 8, weight: .bold)).tracking(1)
                            .foregroundColor(.black).padding(.horizontal, 6).padding(.vertical, 2)
                            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                    }
                    Text("How money really works — the system they never taught you")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.15), lineWidth: 1)))
        }
    }
    
    // MARK: - Book Section
    
    private var bookSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "book.fill").foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                Text("READ THE SOURCE").font(.system(size: 10, weight: .bold)).tracking(2)
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("The Fourth Turning: An American Prophecy")
                    .font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                Text("William Strauss & Neil Howe (1997)")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                Text("Written in 1997, this book predicted the 2008 financial crisis, rising populism, institutional collapse, and a generational crisis climaxing around 2025. It's not prophecy — it's pattern recognition over 500 years of Anglo-American history.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
                
                Text("Also read: Neil Howe's 'The Fourth Turning Is Here' (2023) — an updated analysis of where we are in the cycle now.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.cyan.opacity(0.6)).lineSpacing(2)
                
                HStack(spacing: 8) {
                    Text("Available:").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    ForEach(["Amazon", "Libraries", "Audible", "Z-Library"], id: \.self) { source in
                        Text(source).font(.system(size: 9, weight: .medium))
                            .foregroundColor(.cyan.opacity(0.5))
                            .padding(.horizontal, 8).padding(.vertical, 3)
                            .background(Capsule().fill(Color.cyan.opacity(0.06)))
                    }
                }
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1), lineWidth: 1)))
    }
}
