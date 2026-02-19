// EvilCorporationsDatabase.swift
// The comprehensive guide to corporate villainy
// Who's destroying the world for profit

import SwiftUI

struct EvilCorporationsDatabase: View {
    
    @State private var selectedSector: CorporateSector = .all
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection
                
                // Big picture
                bigPictureSection
                
                // Search
                searchBar
                
                // Sector filter
                sectorPicker
                
                // Corporations
                ForEach(filteredCorps, id: \.name) { corp in
                    NavigationLink(destination: CorpDetailView(corp: corp)) {
                        corpCard(corp)
                    }
                }
                
                // The system section
                systemSection
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
                Image(systemName: "building.2.crop.circle.badge.exclamationmark")
                    .font(.system(size: 36))
                    .foregroundColor(.red)
            }
            
            Text("Evil Corporations Database")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            
            Text("The villains hiding in plain sight")
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Big Picture
    
    private var bigPictureSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE BIG PICTURE")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.red)
            
            HStack(spacing: 12) {
                statBox("$3.3T", "Corporate\nProfits 2023")
                statBox("399x", "CEO vs Worker\nPay Ratio")
                statBox("$4.5B", "Annual\nLobbying")
            }
            
            Text("While they blame immigrants, workers, and regulations—corporations extract record wealth from America.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func statBox(_ value: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 18, weight: .black))
                .foregroundColor(.red)
            Text(label)
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    // MARK: - Search
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search corporations...", text: $searchText)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
    
    // MARK: - Sector Picker
    
    private var sectorPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(CorporateSector.allCases, id: \.self) { sector in
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
    
    // MARK: - Corp Card
    
    private func corpCard(_ corp: DatabaseEvilCorp) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(corp.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    Text(corp.sector.rawValue)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Evil score
                ZStack {
                    Circle()
                        .fill(evilColor(corp.evilScore).opacity(0.2))
                        .frame(width: 44, height: 44)
                    VStack(spacing: 0) {
                        Text("\(corp.evilScore)")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(evilColor(corp.evilScore))
                        Text("EVIL")
                            .font(.system(size: 6, weight: .bold))
                            .foregroundColor(.gray)
                    }
                }
            }
            
            // Quick stats
            HStack(spacing: 16) {
                miniStat("Revenue", corp.revenue)
                miniStat("CEO Pay", corp.ceoPay)
                if let taxRate = corp.effectiveTaxRate {
                    miniStat("Tax Rate", taxRate)
                }
            }
            
            // Primary crime
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 10))
                Text(corp.primaryCrime)
                    .font(.system(size: 12))
                    .foregroundColor(.orange)
                    .lineLimit(2)
            }
            
            // Tap for more
            HStack {
                Spacer()
                Text("Tap for full profile →")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(evilColor(corp.evilScore).opacity(0.3), lineWidth: 1)
        )
    }
    
    private func miniStat(_ label: String, _ value: String) -> some View {
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
    
    // MARK: - System Section
    
    private var systemSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THE SYSTEM IS THE PROBLEM")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.purple)
            
            Text("These corporations aren't exceptions—they're the system working as designed. Capitalism without restraint produces extraction, not prosperity.")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(alignment: .leading, spacing: 8) {
                systemRow("Corporations must maximize shareholder value (legally)")
                systemRow("Externalized costs (pollution, health) are profitable")
                systemRow("Regulatory capture is normal")
                systemRow("Politicians depend on corporate money")
                systemRow("Workers have no power without unions")
            }
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func systemRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(.purple)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Filtered Corps
    
    private var filteredCorps: [DatabaseEvilCorp] {
        var corps = allCorporations
        
        if selectedSector != .all {
            corps = corps.filter { $0.sector == selectedSector }
        }
        
        if !searchText.isEmpty {
            corps = corps.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        return corps.sorted { $0.evilScore > $1.evilScore }
    }
    
    // MARK: - All Corporations Data
    
    private var allCorporations: [DatabaseEvilCorp] {
        [
            // FINANCE
            DatabaseEvilCorp(
                name: "BlackRock",
                sector: .finance,
                revenue: "$17.9B",
                ceoPay: "$26M",
                effectiveTaxRate: nil,
                evilScore: 95,
                primaryCrime: "Controls $10 TRILLION in assets—buys up housing, votes shares to cut worker pay",
                allCrimes: [
                    "Largest asset manager in history ($10T AUM)",
                    "Major buyer of single-family homes, driving up prices",
                    "With Vanguard/State Street, controls voting rights over most major corporations",
                    "CEO Larry Fink advises governments while profiting from policies",
                    "Greenwashes while investing heavily in fossil fuels",
                    "Uses voting power to push wage suppression as 'efficiency'"
                ],
                politicalInfluence: "Larry Fink connected to both parties. Revolving door with Treasury, Fed.",
                workers: "Exempt from scrutiny despite enormous power over economy"
            ),
            DatabaseEvilCorp(
                name: "Goldman Sachs",
                sector: .finance,
                revenue: "$47B",
                ceoPay: "$31M",
                effectiveTaxRate: "19%",
                evilScore: 92,
                primaryCrime: "Bet against clients in 2008 crash, multiple executives became Treasury Secretary",
                allCrimes: [
                    "Bet against mortgage securities while selling them to clients (2008)",
                    "Multiple executives become Treasury Secretary ('Government Sachs')",
                    "$5B+ in fines for 2008 crisis role",
                    "Malaysia 1MDB scandal ($6.5B embezzlement facilitated)",
                    "Manipulated commodity markets",
                    "Paid settlements but no executives jailed"
                ],
                politicalInfluence: "Alumni throughout government: Treasury, NEC, Fed, World Bank. Both parties.",
                workers: "Extreme work culture documented, 100+ hour weeks"
            ),
            DatabaseEvilCorp(
                name: "JPMorgan Chase",
                sector: .finance,
                revenue: "$154B",
                ceoPay: "$34.5M",
                effectiveTaxRate: "17%",
                evilScore: 88,
                primaryCrime: "$39 BILLION in fines since 2000, still largest bank in US",
                allCrimes: [
                    "Largest bank in US despite $39B in fines",
                    "Enabled Bernie Madoff's Ponzi scheme",
                    "Manipulated energy markets",
                    "Discriminatory lending practices",
                    "Largest financer of fossil fuels",
                    "Too big to fail, too big to jail"
                ],
                politicalInfluence: "Jamie Dimon is Wall Street's main spokesman, regular White House access",
                workers: "Laid off workers while executives got bonuses"
            ),
            
            // BIG TECH
            DatabaseEvilCorp(
                name: "Amazon",
                sector: .tech,
                revenue: "$575B",
                ceoPay: "$1.3M + stock",
                effectiveTaxRate: "6%",
                evilScore: 93,
                primaryCrime: "Paid $0 federal tax in 2018, workers pee in bottles, destroyed small business",
                allCrimes: [
                    "Paid $0 federal income tax in 2018 despite $11B profit",
                    "Warehouse injury rate double industry average",
                    "Workers urinate in bottles due to time pressure",
                    "Spent $4.3M on anti-union consultants for ONE warehouse",
                    "Destroyed small retail businesses across America",
                    "AWS hosts ICE databases",
                    "Bezos worth $180B+ while workers on food stamps"
                ],
                politicalInfluence: "Massive lobbying ($20M+/year), owns Washington Post",
                workers: "High turnover by design, surveillance, anti-union"
            ),
            DatabaseEvilCorp(
                name: "Meta (Facebook)",
                sector: .tech,
                revenue: "$135B",
                ceoPay: "$27M",
                effectiveTaxRate: "11%",
                evilScore: 94,
                primaryCrime: "Internal docs show they KNEW Instagram harms teen mental health, did nothing",
                allCrimes: [
                    "Knew Instagram harms teen mental health (internal research)",
                    "Algorithm amplified content enabling Myanmar genocide",
                    "Cambridge Analytica scandal (87M users' data)",
                    "Spreads misinformation at scale for engagement",
                    "Tracks users across internet",
                    "Destroyed journalism by stealing ad revenue",
                    "Frances Haugen whistleblower exposed lies"
                ],
                politicalInfluence: "Zuckerberg meets with Trump, massive lobbying, hires from both parties",
                workers: "Content moderators get PTSD, poor support"
            ),
            DatabaseEvilCorp(
                name: "Google (Alphabet)",
                sector: .tech,
                revenue: "$307B",
                ceoPay: "$226M",
                effectiveTaxRate: "15%",
                evilScore: 85,
                primaryCrime: "DOJ found guilty of illegal monopoly in 2024, tracks everything you do",
                allCrimes: [
                    "90%+ search monopoly—DOJ found guilty (2024)",
                    "Tracks everything you do online and sells it",
                    "YouTube algorithms promoted extremism",
                    "AI trained on copyrighted content",
                    "Killed journalism by taking ad revenue",
                    "Anti-competitive contracts with Apple, Android",
                    "'Don't be evil' motto abandoned"
                ],
                politicalInfluence: "Heavy lobbying, revolving door, funds think tanks",
                workers: "Retaliated against union organizers"
            ),
            DatabaseEvilCorp(
                name: "Apple",
                sector: .tech,
                revenue: "$383B",
                ceoPay: "$63M",
                effectiveTaxRate: "14%",
                evilScore: 72,
                primaryCrime: "Held $252B offshore to avoid $78B in taxes, Foxconn worker suicides",
                allCrimes: [
                    "Held $252B offshore, avoided $78B in taxes",
                    "Foxconn suicides—installed nets instead of improving conditions",
                    "Planned obsolescence (admitted to slowing old phones)",
                    "30% App Store tax stifles competition",
                    "Child labor in cobalt supply chain",
                    "Fights right-to-repair",
                    "Censors apps for China"
                ],
                politicalInfluence: "Lobbies against right-to-repair and tax reform",
                workers: "Foxconn conditions, retail workers underpaid"
            ),
            
            // PHARMA
            DatabaseEvilCorp(
                name: "Purdue Pharma (Sacklers)",
                sector: .pharma,
                revenue: "Bankrupt",
                ceoPay: "N/A",
                effectiveTaxRate: "N/A",
                evilScore: 100,
                primaryCrime: "Created opioid epidemic killing 500,000+ Americans. NO ONE went to prison.",
                allCrimes: [
                    "Created opioid epidemic: 500,000+ American deaths",
                    "Knew OxyContin was highly addictive, marketed as safe",
                    "Paid doctors to overprescribe",
                    "Funded fake patient advocacy groups",
                    "Sackler family extracted $10B+ before bankruptcy",
                    "NO ONE went to prison",
                    "Killed more Americans than Vietnam War"
                ],
                politicalInfluence: "Lobbied to block opioid restrictions for years",
                workers: "N/A"
            ),
            DatabaseEvilCorp(
                name: "Johnson & Johnson",
                sector: .pharma,
                revenue: "$85B",
                ceoPay: "$26M",
                effectiveTaxRate: "12%",
                evilScore: 88,
                primaryCrime: "Knew baby powder contained asbestos for DECADES, caused cancer",
                allCrimes: [
                    "Baby powder contained asbestos for decades (internal docs proved it)",
                    "Knew and hid cancer risk",
                    "Opioid lawsuits (settled for billions)",
                    "Defective hip implants harmed thousands",
                    "Risperdal marketed illegally to children",
                    "Texas Two-Step bankruptcy maneuver to avoid liability"
                ],
                politicalInfluence: "Major lobbying, fights lawsuit reforms",
                workers: "Prioritized profit over consumer safety"
            ),
            DatabaseEvilCorp(
                name: "Pfizer",
                sector: .pharma,
                revenue: "$58B",
                ceoPay: "$33M",
                effectiveTaxRate: "8%",
                evilScore: 78,
                primaryCrime: "$2.3B fraud settlement (2009)—largest in history at the time",
                allCrimes: [
                    "$2.3B fraud settlement (2009)—largest ever at time",
                    "Illegal marketing of multiple drugs",
                    "Price gouging on essential medications",
                    "Lobbies against drug price negotiation",
                    "Hid Celebrex heart attack risks",
                    "Bextra withdrawn for safety, marketed illegally"
                ],
                politicalInfluence: "Massive lobbying against price controls",
                workers: "Standard pharma"
            ),
            
            // OIL & GAS
            DatabaseEvilCorp(
                name: "ExxonMobil",
                sector: .energy,
                revenue: "$413B",
                ceoPay: "$36M",
                effectiveTaxRate: "8%",
                evilScore: 98,
                primaryCrime: "Knew about climate change in 1977, funded denial for 40+ years",
                allCrimes: [
                    "Scientists predicted climate change in 1977—accurately",
                    "Funded climate denial for 40+ years despite knowing truth",
                    "Valdez oil spill (1989), still fighting cleanup costs",
                    "Record profits during 'inflation' ($56B in 2022)",
                    "Largest corporate polluter in history",
                    "Lobbies against climate action",
                    "Sued for misleading investors on climate risk"
                ],
                politicalInfluence: "Funded Heritage, ALEC, entire climate denial apparatus",
                workers: "Refinery conditions, contract workers"
            ),
            DatabaseEvilCorp(
                name: "Chevron",
                sector: .energy,
                revenue: "$246B",
                ceoPay: "$24M",
                effectiveTaxRate: "9%",
                evilScore: 92,
                primaryCrime: "Dumped 16 BILLION gallons toxic waste in Amazon, evades $9.5B cleanup",
                allCrimes: [
                    "Texaco (now Chevron) dumped 16B gallons toxic waste in Ecuador",
                    "30+ year legal battle to avoid $9.5B cleanup judgment",
                    "Persecuted lawyer Steven Donziger who won the case",
                    "Climate denial funding",
                    "Richmond refinery explosion (2012)",
                    "Record profits during gas price spikes"
                ],
                politicalInfluence: "Major lobbying, fights environmental regulations",
                workers: "Dangerous refinery conditions"
            ),
            DatabaseEvilCorp(
                name: "Koch Industries",
                sector: .energy,
                revenue: "$125B",
                ceoPay: "Private",
                effectiveTaxRate: "Private",
                evilScore: 96,
                primaryCrime: "Created political network spending $400M+ per election to buy America",
                allCrimes: [
                    "Funded climate denial for decades",
                    "$400M+ per election cycle in political spending",
                    "Created Americans for Prosperity (astroturf)",
                    "Funded Heritage, ALEC, Cato, Federalist Society",
                    "Environmental violations across multiple states",
                    "Anti-union crusade",
                    "Shaped Republican Party into current form"
                ],
                politicalInfluence: "Built modern conservative infrastructure, controls GOP primaries in many states",
                workers: "Poor environmental/safety records at facilities"
            ),
            
            // FOOD
            DatabaseEvilCorp(
                name: "Nestlé",
                sector: .food,
                revenue: "$100B",
                ceoPay: "$11M",
                effectiveTaxRate: nil,
                evilScore: 88,
                primaryCrime: "Former CEO said 'water is not a human right,' baby formula scandal killed babies",
                allCrimes: [
                    "Former CEO: 'Water is not a human right'",
                    "Pumps water from drought areas for pennies",
                    "Baby formula scandal: marketed in developing countries, babies died",
                    "Child labor in cocoa supply chain (documented)",
                    "Owns 2,000+ brands making boycott hard",
                    "Plastic pollution leader",
                    "Extracted water from California during drought"
                ],
                politicalInfluence: "Global lobbying against water regulations",
                workers: "Supply chain child labor"
            ),
            DatabaseEvilCorp(
                name: "Tyson Foods",
                sector: .food,
                revenue: "$53B",
                ceoPay: "$12M",
                effectiveTaxRate: nil,
                evilScore: 82,
                primaryCrime: "Managers BET on how many workers would get COVID",
                allCrimes: [
                    "Managers bet on COVID infections among workers",
                    "Dangerous working conditions, high injury rates",
                    "Environmental pollution from factory farms",
                    "Price-fixing lawsuits (settled)",
                    "Exploits immigrant workers",
                    "Animal cruelty documented",
                    "Antibiotic overuse contributing to superbugs"
                ],
                politicalInfluence: "Lobbies against worker protections, meat regulations",
                workers: "Poverty wages, dangerous conditions, mostly immigrant"
            ),
            DatabaseEvilCorp(
                name: "Monsanto (Bayer)",
                sector: .food,
                revenue: "Part of Bayer",
                ceoPay: "N/A",
                effectiveTaxRate: "N/A",
                evilScore: 95,
                primaryCrime: "Roundup causes cancer—$10B+ settlements. Also made Agent Orange.",
                allCrimes: [
                    "Roundup (glyphosate) linked to cancer—$10B+ settlements",
                    "Produced Agent Orange (Vietnam)",
                    "Patents seeds, sues farmers who don't pay",
                    "Destroys biodiversity through monoculture",
                    "Ghostwrote 'scientific' studies",
                    "Regulatory capture of USDA/EPA",
                    "Bayer lost $63B in value after buying Monsanto"
                ],
                politicalInfluence: "Revolving door with FDA/USDA, funded friendly research",
                workers: "Exposed workers to chemicals"
            ),
            DatabaseEvilCorp(
                name: "Coca-Cola",
                sector: .food,
                revenue: "$46B",
                ceoPay: "$24M",
                effectiveTaxRate: "19%",
                evilScore: 78,
                primaryCrime: "Major contributor to obesity epidemic, funded junk science to blame consumers",
                allCrimes: [
                    "Major contributor to global obesity epidemic",
                    "Funded 'Global Energy Balance Network' to blame exercise, not diet",
                    "Plastic pollution leader",
                    "Water extraction in drought areas",
                    "Marketed aggressively to children globally",
                    "Fought soda taxes worldwide",
                    "Linked to violence against union organizers in Colombia"
                ],
                politicalInfluence: "Lobbies against soda taxes, sugar regulations",
                workers: "Violence against union organizers (Colombia)"
            ),
            
            // RETAIL
            DatabaseEvilCorp(
                name: "Walmart",
                sector: .retail,
                revenue: "$648B",
                ceoPay: "$27M",
                effectiveTaxRate: "21%",
                evilScore: 80,
                primaryCrime: "Workers need food stamps while Walton family worth $250B+",
                allCrimes: [
                    "Poverty wages require government assistance (taxpayer subsidy)",
                    "Walton family: $250B+ while workers earn $14/hour",
                    "Closes stores that vote to unionize",
                    "Destroyed small town retail across America",
                    "Gender discrimination (largest class action ever)",
                    "Anti-union training mandatory",
                    "Wage theft settlements"
                ],
                politicalInfluence: "Lobbies against minimum wage increases",
                workers: "Poverty wages, anti-union, high turnover by design"
            ),
            
            // PRIVATE PRISONS
            DatabaseEvilCorp(
                name: "CoreCivic",
                sector: .prisons,
                revenue: "$1.9B",
                ceoPay: "$4M",
                effectiveTaxRate: nil,
                evilScore: 90,
                primaryCrime: "Profits from mass incarceration, lobbies for harsher sentences",
                allCrimes: [
                    "Profits from imprisoning humans",
                    "Lobbies for harsher sentences (more prisoners = more profit)",
                    "ICE detention contracts profit from family separation",
                    "Worse conditions than public prisons",
                    "Deaths in custody",
                    "Guaranteed occupancy contracts (must fill beds)",
                    "Guards poorly paid and trained"
                ],
                politicalInfluence: "Donates to 'tough on crime' candidates, lobbies for mandatory minimums",
                workers: "Guards poorly paid, high turnover"
            ),
            DatabaseEvilCorp(
                name: "GEO Group",
                sector: .prisons,
                revenue: "$2.4B",
                ceoPay: "$5M",
                effectiveTaxRate: nil,
                evilScore: 90,
                primaryCrime: "Second largest private prison company, donated $500K to Trump inauguration",
                allCrimes: [
                    "Second largest private prison operator",
                    "Immigration detention centers with poor conditions",
                    "Sexual abuse allegations at facilities",
                    "Medical neglect deaths",
                    "Lobbies for immigration enforcement",
                    "Donated $500K to Trump inauguration",
                    "Converted to REIT for tax advantages"
                ],
                politicalInfluence: "Major GOP donor, benefits from harsh immigration policy",
                workers: "Poor conditions for both prisoners and guards"
            ),
            
            // INSURANCE
            DatabaseEvilCorp(
                name: "UnitedHealth Group",
                sector: .insurance,
                revenue: "$372B",
                ceoPay: "$23M",
                effectiveTaxRate: "22%",
                evilScore: 92,
                primaryCrime: "Largest health insurer—denies 32% of claims, uses AI to reject without review",
                allCrimes: [
                    "Denies 32% of claims in some markets",
                    "AI algorithms deny claims without human review",
                    "CEO made $23M while patients die from denials",
                    "Prior authorization delays kill patients",
                    "Owns doctors (Optum)—massive conflict of interest",
                    "Spends more on administration than care",
                    "Medicare Advantage gaming"
                ],
                politicalInfluence: "Largest health sector lobbyist, fights Medicare for All",
                workers: "Call center workers pressured to deny claims"
            ),
            
            // DEFENSE
            DatabaseEvilCorp(
                name: "Lockheed Martin",
                sector: .defense,
                revenue: "$67B",
                ceoPay: "$25M",
                effectiveTaxRate: "15%",
                evilScore: 75,
                primaryCrime: "F-35 program: $1.7 TRILLION lifetime cost, doesn't work properly",
                allCrimes: [
                    "Largest defense contractor",
                    "F-35: $1.7T lifetime cost, still doesn't work well",
                    "Lobbies for military spending increases",
                    "Profits from every war",
                    "Revolving door with Pentagon",
                    "Board includes former generals",
                    "Stock rises with international conflict"
                ],
                politicalInfluence: "Facilities in every state (congressional leverage), massive lobbying",
                workers: "Decent pay but dependent on perpetual war"
            ),
            DatabaseEvilCorp(
                name: "Raytheon (RTX)",
                sector: .defense,
                revenue: "$67B",
                ceoPay: "$22M",
                effectiveTaxRate: "13%",
                evilScore: 78,
                primaryCrime: "Makes missiles used on civilians in Yemen, profits from Saudi arms deals",
                allCrimes: [
                    "Missiles used on civilians in Yemen",
                    "Profits from Saudi Arabia arms deals",
                    "Former executive was Secretary of Defense (Lloyd Austin worked with)",
                    "Lobbies for military interventions",
                    "Profits from global instability",
                    "Revolving door with Pentagon"
                ],
                politicalInfluence: "Deep Pentagon connections, lobbies for arms sales",
                workers: "Defense industry standard"
            ),
            
            // TELECOM
            DatabaseEvilCorp(
                name: "Comcast",
                sector: .telecom,
                revenue: "$121B",
                ceoPay: "$32M",
                effectiveTaxRate: "24%",
                evilScore: 75,
                primaryCrime: "Owns NBC/MSNBC while being your internet provider—massive conflict of interest",
                allCrimes: [
                    "Worst customer service ratings consistently",
                    "Local monopolies—no competition in many areas",
                    "Owns NBC/MSNBC (media + ISP = conflict)",
                    "Lobbied against net neutrality",
                    "Data caps and hidden fees",
                    "Throttles streaming competitors",
                    "Spent millions fighting municipal broadband"
                ],
                politicalInfluence: "Lobbies against broadband competition, net neutrality",
                workers: "Call center workers rated on sales, not help"
            ),
            DatabaseEvilCorp(
                name: "AT&T",
                sector: .telecom,
                revenue: "$120B",
                ceoPay: "$22M",
                effectiveTaxRate: "21%",
                evilScore: 72,
                primaryCrime: "NSA spying partner, laid off 50,000 after getting $20B tax cut",
                allCrimes: [
                    "NSA spying partner (Room 641A, warrantless surveillance)",
                    "Laid off 50,000 workers after getting $20B tax cut",
                    "Disastrous Time Warner acquisition",
                    "Lobbied against net neutrality",
                    "Local monopolies",
                    "Poor rural coverage despite subsidies"
                ],
                politicalInfluence: "Major lobbying, NSA cooperation, against competition",
                workers: "Mass layoffs despite tax windfall"
            )
        ]
    }
}

// MARK: - Models

enum CorporateSector: String, CaseIterable {
    case all = "All"
    case finance = "Finance"
    case tech = "Big Tech"
    case pharma = "Pharma"
    case energy = "Oil & Gas"
    case food = "Food"
    case retail = "Retail"
    case prisons = "Prisons"
    case insurance = "Insurance"
    case defense = "Defense"
    case telecom = "Telecom"
    
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
        case .telecom: return "antenna.radiowaves.left.and.right"
        }
    }
}

struct DatabaseEvilCorp {
    let name: String
    let sector: CorporateSector
    let revenue: String
    let ceoPay: String
    let effectiveTaxRate: String?
    let evilScore: Int
    let primaryCrime: String
    let allCrimes: [String]
    let politicalInfluence: String
    let workers: String
}

// MARK: - Detail View

struct CorpDetailView: View {
    let corp: DatabaseEvilCorp
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(corp.name)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        Text(corp.sector.rawValue)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
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
                
                // Stats
                HStack(spacing: 12) {
                    detailStat("Revenue", corp.revenue)
                    detailStat("CEO Pay", corp.ceoPay)
                    if let tax = corp.effectiveTaxRate {
                        detailStat("Tax Rate", tax)
                    }
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                // All crimes
                sectionLabel("DOCUMENTED HARM")
                
                ForEach(corp.allCrimes, id: \.self) { crime in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                        Text(crime)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                // Political influence
                sectionLabel("POLITICAL INFLUENCE")
                
                Text(corp.politicalInfluence)
                    .font(.system(size: 14))
                    .foregroundColor(.purple)
                
                // Workers
                sectionLabel("WORKER TREATMENT")
                
                Text(corp.workers)
                    .font(.system(size: 14))
                    .foregroundColor(.orange)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func detailStat(_ label: String, _ value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    private func sectionLabel(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.red)
            .padding(.top, 8)
    }
}

#Preview {
    NavigationStack {
        EvilCorporationsDatabase()
    }
}
