// EvilCorporationsDatabaseView.swift
// The comprehensive guide to corporate villainy
// Every major offender, documented

import SwiftUI

struct EvilCorporationsDatabaseView: View {
    
    @State private var selectedSector: CorpSector = .all
    @State private var searchText = ""
    @State private var sortBy: SortOption = .evilScore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection
                
                // Search
                searchBar
                
                // Sector filter
                sectorFilter
                
                // Sort options
                sortOptions
                
                // Corporation cards
                ForEach(filteredAndSortedCorps, id: \.name) { corp in
                    NavigationLink(destination: CorporationDetailView(corp: corp)) {
                        corporationCard(corp)
                    }
                }
                
                // Total evil summary
                totalEvilSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Evil Corps Database")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.red)
            }
            
            Text("Evil Corporations Database")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            
            Text("Documented corporate harm to people and planet")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            // Stats
            HStack(spacing: 20) {
                statBubble("\(allCorporations.count)", "Companies")
                statBubble("$50T+", "Combined Revenue")
                statBubble("∞", "Harm Caused")
            }
        }
    }
    
    private func statBubble(_ value: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.red)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Search
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search corporations...", text: $searchText)
                .foregroundColor(.white)
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Sector Filter
    
    private var sectorFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(CorpSector.allCases, id: \.self) { sector in
                    Button(action: {
                        withAnimation { selectedSector = sector }
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: sector.icon)
                                .font(.system(size: 10))
                            Text(sector.rawValue)
                                .font(.system(size: 11, weight: .medium))
                        }
                        .foregroundColor(selectedSector == sector ? .black : .white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedSector == sector ? Color.red : Color.white.opacity(0.1))
                        .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    // MARK: - Sort Options
    
    private var sortOptions: some View {
        HStack {
            Text("Sort by:")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            Picker("Sort", selection: $sortBy) {
                Text("Evil Score").tag(SortOption.evilScore)
                Text("Revenue").tag(SortOption.revenue)
                Text("A-Z").tag(SortOption.alphabetical)
            }
            .pickerStyle(.segmented)
            .scaleEffect(0.9)
        }
    }
    
    // MARK: - Corporation Card
    
    private func corporationCard(_ corp: EvilCorporation) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(corp.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Text(corp.sector.rawValue)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        
                        if corp.currentThreat {
                            Text("ACTIVE THREAT")
                                .font(.system(size: 8, weight: .black))
                                .foregroundColor(.red)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                }
                
                Spacer()
                
                // Evil score
                ZStack {
                    Circle()
                        .fill(evilColor(corp.evilScore).opacity(0.2))
                        .frame(width: 50, height: 50)
                    
                    VStack(spacing: 0) {
                        Text("\(corp.evilScore)")
                            .font(.system(size: 18, weight: .black))
                            .foregroundColor(evilColor(corp.evilScore))
                        Text("EVIL")
                            .font(.system(size: 6, weight: .bold))
                            .foregroundColor(.gray)
                    }
                }
            }
            
            // Quick stats
            HStack(spacing: 16) {
                quickStat("Revenue", corp.revenue)
                quickStat("CEO Pay", corp.ceoPay)
                if let taxRate = corp.effectiveTaxRate {
                    quickStat("Tax Rate", taxRate)
                }
            }
            
            // Primary sin
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 10))
                Text(corp.primarySin)
                    .font(.system(size: 11))
                    .foregroundColor(.orange)
                    .lineLimit(2)
            }
            
            // View more indicator
            HStack {
                Spacer()
                Text("Tap for full profile")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(corp.currentThreat ? Color.red.opacity(0.5) : Color.clear, lineWidth: 1)
        )
    }
    
    private func quickStat(_ label: String, _ value: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 8))
                .foregroundColor(.gray)
        }
    }
    
    private func evilColor(_ score: Int) -> Color {
        switch score {
        case 90...100: return .red
        case 75..<90: return .orange
        case 60..<75: return .yellow
        default: return .gray
        }
    }
    
    // MARK: - Total Evil Section
    
    private var totalEvilSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE BIGGER PICTURE")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.purple)
            
            Text("These corporations aren't anomalies—they're the system working as designed. Capitalism incentivizes profit over people. The 'bad apples' ARE the barrel.")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(alignment: .leading, spacing: 8) {
                insightRow("The richest 1% own more than the bottom 90%")
                insightRow("S&P 500 CEOs make 399x their median worker")
                insightRow("Corporations spent $3.7B on lobbying in 2023")
                insightRow("81% of stock market gains go to top 10%")
            }
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func insightRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(.purple)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Data Processing
    
    private var filteredAndSortedCorps: [EvilCorporation] {
        var corps = allCorporations
        
        // Filter by sector
        if selectedSector != .all {
            corps = corps.filter { $0.sector == selectedSector }
        }
        
        // Filter by search
        if !searchText.isEmpty {
            corps = corps.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        // Sort
        switch sortBy {
        case .evilScore:
            corps.sort { $0.evilScore > $1.evilScore }
        case .revenue:
            corps.sort { extractNumber($0.revenue) > extractNumber($1.revenue) }
        case .alphabetical:
            corps.sort { $0.name < $1.name }
        }
        
        return corps
    }
    
    private func extractNumber(_ string: String) -> Double {
        let digits = string.filter { $0.isNumber || $0 == "." }
        return Double(digits) ?? 0
    }
    
    // MARK: - Data
    
    private var allCorporations: [EvilCorporation] {
        [
            // FINANCE
            EvilCorporation(
                name: "BlackRock",
                sector: .finance,
                revenue: "$17.9B",
                ceoPay: "$26M",
                effectiveTaxRate: nil,
                evilScore: 95,
                primarySin: "Manages $10 TRILLION, buys up housing, controls voting power over most corporations",
                allSins: [
                    "Largest asset manager in history ($10T AUM)",
                    "Buys single-family homes, making housing unaffordable",
                    "With Vanguard and State Street, owns 20%+ of most S&P 500 companies",
                    "CEO Larry Fink advises governments while profiting from policies",
                    "Greenwashes while investing heavily in fossil fuels",
                    "Pushes cost-cutting (wage suppression) as 'shareholder value'"
                ],
                politicalInfluence: "Larry Fink connected to politicians across both parties. Advises Federal Reserve.",
                alternatives: "Local credit unions, community banks, index funds without voting power",
                currentThreat: true
            ),
            EvilCorporation(
                name: "JPMorgan Chase",
                sector: .finance,
                revenue: "$154B",
                ceoPay: "$34.5M",
                effectiveTaxRate: "17%",
                evilScore: 88,
                primarySin: "Largest bank in US, fossil fuel financing king, paid $39B in fines since 2000",
                allSins: [
                    "Largest financer of fossil fuels ($434B since Paris Agreement)",
                    "$39 billion in fines since 2000 (fraud, manipulation, etc.)",
                    "Enabled Bernie Madoff's Ponzi scheme",
                    "Manipulated precious metals markets",
                    "Discriminatory lending practices documented",
                    "Too big to fail, too big to jail"
                ],
                politicalInfluence: "Jamie Dimon is face of Wall Street, regular White House visitor regardless of party",
                alternatives: "Credit unions, community development banks",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Goldman Sachs",
                sector: .finance,
                revenue: "$44B",
                ceoPay: "$31M",
                effectiveTaxRate: "19%",
                evilScore: 90,
                primarySin: "Bet against clients in 2008 crash, coined 'Government Sachs' for revolving door",
                allSins: [
                    "Bet against mortgage securities it sold to clients (2008)",
                    "Multiple executives become Treasury Secretaries",
                    "Manipulated commodity markets (aluminum, oil)",
                    "Malaysia 1MDB scandal ($6.5B embezzlement)",
                    "Paid $5B+ in fines for 2008 role",
                    "'Vampire squid wrapped around the face of humanity'"
                ],
                politicalInfluence: "Alumni throughout government: Treasury, Fed, NEC, World Bank",
                alternatives: "Avoid their investment products",
                currentThreat: true
            ),
            
            // BIG TECH
            EvilCorporation(
                name: "Amazon",
                sector: .tech,
                revenue: "$575B",
                ceoPay: "$1.3M + stock",
                effectiveTaxRate: "6%",
                evilScore: 92,
                primarySin: "Paid $0 federal income tax in 2018, workers pee in bottles, destroys small business",
                allSins: [
                    "Paid $0 federal income tax in 2018 despite $11B profit",
                    "Warehouse injury rates double industry average",
                    "Workers urinate in bottles due to time pressure",
                    "Spent $4.3M on anti-union consultants for ONE warehouse",
                    "Destroyed small retail businesses across America",
                    "AWS hosts ICE databases, sells facial recognition to police",
                    "Bezos worth $150B+ while workers on food stamps"
                ],
                politicalInfluence: "Massive lobbying ($20M+/year), owns Washington Post",
                alternatives: "Local businesses, eBay (less monopolistic), direct from brands",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Meta (Facebook)",
                sector: .tech,
                revenue: "$135B",
                ceoPay: "$27M",
                effectiveTaxRate: "11%",
                evilScore: 94,
                primarySin: "Internal docs show they KNEW Instagram harms teens, enabled Myanmar genocide",
                allSins: [
                    "Knew Instagram harms teen mental health (internal research)",
                    "Algorithm amplified content that enabled Myanmar genocide",
                    "Cambridge Analytica scandal (87M users' data)",
                    "Spreads misinformation at scale",
                    "Tracks users across the internet",
                    "Destroyed journalism by taking ad revenue",
                    "Whistleblower Frances Haugen exposed internal hypocrisy"
                ],
                politicalInfluence: "Zuckerberg meets with Trump, massive lobbying, hires from both parties",
                alternatives: "Delete Facebook/Instagram, use Signal, support real journalism",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Google (Alphabet)",
                sector: .tech,
                revenue: "$307B",
                ceoPay: "$226M",
                effectiveTaxRate: "15%",
                evilScore: 85,
                primarySin: "Found guilty of illegal monopoly by DOJ, tracks everything you do",
                allSins: [
                    "90%+ search monopoly, found guilty by DOJ (2024)",
                    "Tracks everything you do online",
                    "Killed journalism by taking ad revenue",
                    "YouTube algorithms promote extremism",
                    "AI trained on copyrighted content without permission",
                    "'Don't be evil' motto dropped",
                    "Anti-competitive practices to maintain dominance"
                ],
                politicalInfluence: "Heavy lobbying, revolving door with government, funds think tanks",
                alternatives: "DuckDuckGo, Brave browser, ProtonMail",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Apple",
                sector: .tech,
                revenue: "$383B",
                ceoPay: "$63M",
                effectiveTaxRate: "14%",
                evilScore: 70,
                primarySin: "Held $252B offshore avoiding $78B in taxes, Foxconn suicide nets",
                allSins: [
                    "Held $252B offshore, avoided $78B in taxes",
                    "Foxconn factories: suicide nets installed",
                    "Planned obsolescence (slowed old phones)",
                    "30% App Store tax stifles competition",
                    "Child labor in cobalt supply chain",
                    "Right-to-repair opposition",
                    "Censors apps for China"
                ],
                politicalInfluence: "Lobbies against right-to-repair, tax reform",
                alternatives: "Fairphone, repairable devices, used electronics",
                currentThreat: false
            ),
            
            // PHARMA
            EvilCorporation(
                name: "Purdue Pharma / Sackler Family",
                sector: .pharma,
                revenue: "Bankrupt",
                ceoPay: "N/A",
                effectiveTaxRate: "N/A",
                evilScore: 100,
                primarySin: "Created opioid epidemic killing 500,000+ Americans, no one went to prison",
                allSins: [
                    "Created opioid epidemic: 500,000+ American deaths",
                    "Knew OxyContin was addictive, marketed as safe",
                    "Paid doctors to overprescribe",
                    "Funded fake patient advocacy groups",
                    "Sacklers extracted $10B+ before bankruptcy",
                    "NO ONE went to prison",
                    "Killed more Americans than Vietnam War"
                ],
                politicalInfluence: "Millions in donations, lobbied against restrictions",
                alternatives: "Demand accountability, support addiction treatment",
                currentThreat: false
            ),
            EvilCorporation(
                name: "Johnson & Johnson",
                sector: .pharma,
                revenue: "$85B",
                ceoPay: "$26M",
                effectiveTaxRate: "12%",
                evilScore: 88,
                primarySin: "Knew baby powder contained asbestos for decades, caused cancer",
                allSins: [
                    "Baby powder contained asbestos for decades (internal docs)",
                    "Knew and hid cancer risk",
                    "Opioid lawsuit settlements (billions)",
                    "Defective hip implants harmed thousands",
                    "Risperdal marketed illegally to children",
                    "Tried to use Texas Two-Step bankruptcy to avoid liability"
                ],
                politicalInfluence: "Major lobbying, fights lawsuit reforms",
                alternatives: "Natural products, transparent companies",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Pfizer",
                sector: .pharma,
                revenue: "$58B",
                ceoPay: "$33M",
                effectiveTaxRate: "8%",
                evilScore: 75,
                primarySin: "Largest healthcare fraud settlement in history ($2.3B), prices gouge on drugs",
                allSins: [
                    "$2.3B fraud settlement (2009) - largest in history at time",
                    "Price gouging on essential medications",
                    "Paid billions in settlements over decades",
                    "Lobbies against drug price negotiation",
                    "Hid Celebrex heart attack risks",
                    "Bextra withdrawn after illegal marketing"
                ],
                politicalInfluence: "Massive lobbying, funded groups opposing price controls",
                alternatives: "Generic medications, importation from Canada",
                currentThreat: true
            ),
            
            // FOSSIL FUELS
            EvilCorporation(
                name: "ExxonMobil",
                sector: .energy,
                revenue: "$413B",
                ceoPay: "$36M",
                effectiveTaxRate: "8%",
                evilScore: 98,
                primarySin: "KNEW about climate change in 1977, funded denial for 40 years",
                allSins: [
                    "Scientists predicted climate change accurately in 1977",
                    "Funded climate denial for 40+ years",
                    "Valdez oil spill (1989), still fighting costs",
                    "Record profits during 'inflation' ($56B in 2022)",
                    "Largest corporate polluter in history",
                    "Lobbies against climate action",
                    "Sued for misleading investors on climate risk"
                ],
                politicalInfluence: "Funded Heritage, ALEC, climate denial apparatus",
                alternatives: "Renewable energy, EVs, divest from fossil fuels",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Chevron",
                sector: .energy,
                revenue: "$246B",
                ceoPay: "$24M",
                effectiveTaxRate: "9%",
                evilScore: 92,
                primarySin: "Texaco (now Chevron) dumped 16B gallons of toxic waste in Amazon, evades cleanup",
                allSins: [
                    "Texaco dumped 16 billion gallons toxic waste in Ecuador",
                    "30+ year legal battle to avoid $9.5B cleanup judgment",
                    "Persecuted lawyer who won case against them",
                    "Climate denial funding",
                    "Richmond refinery explosion (2012)",
                    "Record profits while prices high"
                ],
                politicalInfluence: "Major lobbyist, funds industry-friendly candidates",
                alternatives: "Renewable energy sources",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Koch Industries",
                sector: .energy,
                revenue: "$125B",
                ceoPay: "Private",
                effectiveTaxRate: "Private",
                evilScore: 96,
                primarySin: "Largest private company, created network to buy elections ($400M+ per cycle)",
                allSins: [
                    "Funded climate denial for decades",
                    "$400M+ per election cycle in political spending",
                    "Created Americans for Prosperity (astroturf)",
                    "Funded Heritage, ALEC, Cato, Federalist Society",
                    "Environmental violations across multiple states",
                    "Anti-union crusade",
                    "Shaped Republican Party ideology"
                ],
                politicalInfluence: "Created modern conservative infrastructure, controls GOP primaries",
                alternatives: "Boycott Georgia-Pacific, Brawny, Angel Soft (Koch brands)",
                currentThreat: true
            ),
            
            // FOOD & AGRICULTURE
            EvilCorporation(
                name: "Nestlé",
                sector: .food,
                revenue: "$100B",
                ceoPay: "$11M",
                effectiveTaxRate: nil,
                evilScore: 88,
                primarySin: "Former CEO said water is not a human right, baby formula scandal killed babies",
                allSins: [
                    "Former CEO: 'Water is not a human right'",
                    "Pumps water from drought areas for pennies",
                    "Baby formula scandal: marketed in developing countries, babies died",
                    "Child labor in cocoa supply chain",
                    "Owns 2,000+ brands (hard to boycott)",
                    "Plastic pollution leader",
                    "California water extraction during drought"
                ],
                politicalInfluence: "Global lobbying against water regulations",
                alternatives: "Local products, avoid: Hot Pockets, Stouffer's, DiGiorno, Gerber, Poland Spring",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Tyson Foods",
                sector: .food,
                revenue: "$53B",
                ceoPay: "$12M",
                effectiveTaxRate: nil,
                evilScore: 82,
                primarySin: "Managers BET on how many workers would get COVID",
                allSins: [
                    "Managers bet on COVID infections among workers",
                    "Dangerous conditions: injuries, COVID outbreaks",
                    "Environmental pollution from factory farms",
                    "Price-fixing lawsuits (settled)",
                    "Exploits immigrant workers",
                    "Animal cruelty documented",
                    "Antibiotic overuse"
                ],
                politicalInfluence: "Lobbies against worker protections, meat regulations",
                alternatives: "Local farms, plant-based options, certified humane",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Monsanto (now Bayer)",
                sector: .food,
                revenue: "Part of Bayer",
                ceoPay: "N/A",
                effectiveTaxRate: "N/A",
                evilScore: 95,
                primarySin: "Roundup causes cancer (juries agree), Agent Orange, seed patents",
                allSins: [
                    "Roundup (glyphosate) linked to cancer - $10B+ settlements",
                    "Produced Agent Orange (Vietnam)",
                    "Patents seeds, sues farmers",
                    "Destroys biodiversity through monoculture",
                    "Ghostwrote 'scientific' studies",
                    "Regulatory capture of USDA/EPA",
                    "Bayer lost $63B in market cap after buying Monsanto"
                ],
                politicalInfluence: "Revolving door with FDA, funded industry-friendly research",
                alternatives: "Organic food, heirloom seeds, local farms",
                currentThreat: true
            ),
            
            // RETAIL & CONSUMER
            EvilCorporation(
                name: "Walmart",
                sector: .retail,
                revenue: "$648B",
                ceoPay: "$27M",
                effectiveTaxRate: "21%",
                evilScore: 80,
                primarySin: "Workers need food stamps while Waltons worth $250B+, destroyed Main Street",
                allSins: [
                    "Poverty wages require government assistance",
                    "Walton family: $250B+ while workers earn $14/hour",
                    "Closes stores that vote to unionize",
                    "Destroyed small town retail nationwide",
                    "Gender discrimination (largest class action ever)",
                    "Anti-union training",
                    "Wage theft settlements"
                ],
                politicalInfluence: "Lobbies against minimum wage increases",
                alternatives: "Local businesses, Costco (treats workers better)",
                currentThreat: true
            ),
            EvilCorporation(
                name: "Dollar General",
                sector: .retail,
                revenue: "$38B",
                ceoPay: "$16M",
                effectiveTaxRate: "23%",
                evilScore: 75,
                primarySin: "Stores are so understaffed they're dangerous, preys on poor communities",
                allSins: [
                    "Extreme understaffing creates safety hazards",
                    "Workers threatened, assaulted, killed in robberies",
                    "Targets poor communities with no options",
                    "Undercuts local groceries, then raises prices",
                    "OSHA fines for safety violations",
                    "Food desert creator",
                    "Poverty wages"
                ],
                politicalInfluence: "Lobbies against safety regulations",
                alternatives: "Grocery stores, farmers markets",
                currentThreat: true
            ),
            
            // PRIVATE PRISONS
            EvilCorporation(
                name: "CoreCivic",
                sector: .prisons,
                revenue: "$1.9B",
                ceoPay: "$4M",
                effectiveTaxRate: nil,
                evilScore: 90,
                primarySin: "Profits from mass incarceration, lobbies for harsher sentences",
                allSins: [
                    "Profits from imprisoning people",
                    "Lobbies for harsher sentences (more prisoners = more profit)",
                    "ICE detention contracts: profits from family separation",
                    "Worse conditions than public prisons",
                    "Guards paid poorly, undertrained",
                    "Deaths in custody",
                    "Guaranteed occupancy contracts (must fill beds)"
                ],
                politicalInfluence: "Donates to 'tough on crime' candidates, lobbies for mandatory minimums",
                alternatives: "Support prison abolition, vote for reform candidates",
                currentThreat: true
            ),
            EvilCorporation(
                name: "GEO Group",
                sector: .prisons,
                revenue: "$2.4B",
                ceoPay: "$5M",
                effectiveTaxRate: nil,
                evilScore: 90,
                primarySin: "Second largest private prison company, same evils as CoreCivic",
                allSins: [
                    "Second largest private prison operator",
                    "Immigration detention centers",
                    "Sexual abuse allegations at facilities",
                    "Medical neglect deaths",
                    "Lobbies for immigration enforcement",
                    "Donated $500K to Trump inauguration",
                    "Converted to REIT for tax advantages"
                ],
                politicalInfluence: "Major GOP donor, benefits from anti-immigrant policy",
                alternatives: "Support ending private prisons",
                currentThreat: true
            ),
            
            // INSURANCE
            EvilCorporation(
                name: "UnitedHealth Group",
                sector: .insurance,
                revenue: "$372B",
                ceoPay: "$23M",
                effectiveTaxRate: "22%",
                evilScore: 92,
                primarySin: "Largest health insurer, denies claims algorithmically, people die",
                allSins: [
                    "Denies 32% of claims in some markets",
                    "AI denies claims without human review",
                    "CEO made $23M while people die from denials",
                    "Prior authorization delays kill patients",
                    "Owns doctors (Optum) - conflict of interest",
                    "Spends more on administration than care",
                    "Medicare Advantage gaming"
                ],
                politicalInfluence: "Largest health sector lobbyist, fights Medicare for All",
                alternatives: "Support single-payer healthcare",
                currentThreat: true
            ),
            
            // WEAPONS
            EvilCorporation(
                name: "Lockheed Martin",
                sector: .defense,
                revenue: "$67B",
                ceoPay: "$25M",
                effectiveTaxRate: "15%",
                evilScore: 80,
                primarySin: "Largest defense contractor, profits from endless war",
                allSins: [
                    "Largest defense contractor",
                    "F-35 program: $1.7 trillion lifetime cost, doesn't work well",
                    "Lobbies for military spending increases",
                    "Profits from every war",
                    "Revolving door with Pentagon",
                    "Board includes former generals",
                    "Stock price rises with conflict"
                ],
                politicalInfluence: "Facilities in key congressional districts, major lobbying",
                alternatives: "Support defense spending cuts, peace candidates",
                currentThreat: true
            )
        ]
    }
}

// MARK: - Models

enum CorpSector: String, CaseIterable {
    case all = "All"
    case finance = "Finance"
    case tech = "Big Tech"
    case pharma = "Pharma"
    case energy = "Energy"
    case food = "Food"
    case retail = "Retail"
    case prisons = "Prisons"
    case insurance = "Insurance"
    case defense = "Defense"
    
    var icon: String {
        switch self {
        case .all: return "square.grid.2x2"
        case .finance: return "dollarsign.circle"
        case .tech: return "laptopcomputer"
        case .pharma: return "pills"
        case .energy: return "bolt.fill"
        case .food: return "fork.knife"
        case .retail: return "cart"
        case .prisons: return "lock.fill"
        case .insurance: return "heart.text.square"
        case .defense: return "airplane"
        }
    }
}

enum SortOption {
    case evilScore
    case revenue
    case alphabetical
}

struct EvilCorporation {
    let name: String
    let sector: CorpSector
    let revenue: String
    let ceoPay: String
    let effectiveTaxRate: String?
    let evilScore: Int
    let primarySin: String
    let allSins: [String]
    let politicalInfluence: String
    let alternatives: String
    let currentThreat: Bool
}

// MARK: - Detail View

struct CorporationDetailView: View {
    let corp: EvilCorporation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(corp.name)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .fill(Color.red.opacity(0.2))
                                .frame(width: 60, height: 60)
                            VStack(spacing: 0) {
                                Text("\(corp.evilScore)")
                                    .font(.system(size: 24, weight: .black))
                                    .foregroundColor(.red)
                                Text("EVIL")
                                    .font(.system(size: 8, weight: .bold))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Text(corp.sector.rawValue)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    if corp.currentThreat {
                        Text("⚠️ CURRENT ACTIVE THREAT")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.red)
                    }
                }
                
                // Stats
                HStack(spacing: 20) {
                    statBox("Revenue", corp.revenue)
                    statBox("CEO Pay", corp.ceoPay)
                    if let tax = corp.effectiveTaxRate {
                        statBox("Tax Rate", tax)
                    }
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                // All sins
                sectionHeader("DOCUMENTED HARM", icon: "exclamationmark.triangle.fill", color: .red)
                
                ForEach(corp.allSins, id: \.self) { sin in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                        Text(sin)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                // Political influence
                sectionHeader("POLITICAL INFLUENCE", icon: "building.columns.fill", color: .purple)
                
                Text(corp.politicalInfluence)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.9))
                
                Divider().background(Color.white.opacity(0.2))
                
                // Alternatives
                sectionHeader("ALTERNATIVES", icon: "leaf.fill", color: .green)
                
                Text(corp.alternatives)
                    .font(.system(size: 14))
                    .foregroundColor(.green)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func statBox(_ label: String, _ value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(10)
    }
    
    private func sectionHeader(_ title: String, icon: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(title)
                .font(.system(size: 14, weight: .black))
                .foregroundColor(color)
        }
    }
}

#Preview {
    NavigationView {
        EvilCorporationsDatabaseView()
    }
}
