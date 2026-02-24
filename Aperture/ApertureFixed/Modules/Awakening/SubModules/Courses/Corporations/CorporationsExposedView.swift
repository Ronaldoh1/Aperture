// CorporationsExposedView.swift
// The real villains: corporations destroying America while blaming everyone else
// Follow the money

import SwiftUI

struct CorporationsExposedView: View {
    
    @State private var selectedCategory: CorpCategory = .all
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // The big picture
                bigPictureSection
                
                // Category filter
                categoryPicker
                
                // Corporations list
                corporationsList
                
                // The scapegoating section
                scapegoatSection
                
                // What you can do
                actionSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Corporations Exposed")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "building.2.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("Corporations Exposed")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("The real villains destroying the American Dream")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Big Picture
    
    private var bigPictureSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("THE BIG PICTURE")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.red)
            
            Text("While politicians blame immigrants, 'welfare queens,' and foreign countries, the real extraction of American wealth happens in corporate boardrooms.")
                .font(.system(size: 15))
                .foregroundColor(.white)
            
            // Stats
            VStack(spacing: 12) {
                statRow("Corporate profits", "at all-time highs", "$3.3T in 2023")
                statRow("Worker wages", "stagnant for 50 years", "adjusted for inflation")
                statRow("CEO pay", "399x average worker", "was 21x in 1965")
                statRow("Stock buybacks", "$1.3T in 2022", "instead of raising wages")
                statRow("Housing bought by investors", "1 in 4 homes", "in some markets")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func statRow(_ label: String, _ value: String, _ detail: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(value)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            Spacer()
            Text(detail)
                .font(.system(size: 11))
                .foregroundColor(.orange)
        }
    }
    
    // MARK: - Category Picker
    
    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(CorpCategory.allCases, id: \.self) { category in
                    Button(action: {
                        HapticManager.shared.light()
                        withAnimation { selectedCategory = category }
                    }) {
                        Text(category.rawValue)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(selectedCategory == category ? .black : .white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color.red : Color.white.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    // MARK: - Corporations List
    
    private var corporationsList: some View {
        VStack(spacing: 16) {
            ForEach(filteredCorporations, id: \.name) { corp in
                corporationCard(corp)
            }
        }
    }
    
    private var filteredCorporations: [EvilCorp] {
        if selectedCategory == .all {
            return allCorporations
        }
        return allCorporations.filter { $0.category == selectedCategory }
    }
    
    private func corporationCard(_ corp: EvilCorp) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(corp.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Text(corp.industry)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Evil score
                VStack(spacing: 2) {
                    Text("\(corp.evilScore)")
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(evilScoreColor(corp.evilScore))
                    Text("Evil Score")
                        .font(.system(size: 8))
                        .foregroundColor(.gray)
                }
            }
            
            // Key stats
            HStack(spacing: 16) {
                miniStat("Revenue", corp.revenue)
                miniStat("CEO Pay", corp.ceoPay)
                if let taxes = corp.taxesPaid {
                    miniStat("Tax Rate", taxes)
                }
            }
            
            Divider().background(Color.white.opacity(0.2))
            
            // What they do wrong
            Text("THE PROBLEM")
                .font(.system(size: 10, weight: .black))
                .foregroundColor(.red)
            
            ForEach(corp.crimes, id: \.self) { crime in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 10))
                    Text(crime)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            
            // Political donations
            if !corp.politicalDonations.isEmpty {
                Text("POLITICAL MONEY")
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.orange)
                    .padding(.top, 4)
                
                Text(corp.politicalDonations)
                    .font(.system(size: 11))
                    .foregroundColor(.orange.opacity(0.8))
            }
            
            // Who they blame
            if let scapegoat = corp.scapegoat {
                HStack(spacing: 8) {
                    Text("They blame:")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.yellow)
                    Text(scapegoat)
                        .font(.system(size: 10))
                        .foregroundColor(.yellow.opacity(0.8))
                }
                .padding(8)
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    }
    
    private func miniStat(_ label: String, _ value: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 9))
                .foregroundColor(.gray)
        }
    }
    
    private func evilScoreColor(_ score: Int) -> Color {
        switch score {
        case 90...100: return .red
        case 70..<90: return .orange
        case 50..<70: return .yellow
        default: return .gray
        }
    }
    
    // MARK: - Scapegoat Section
    
    private var scapegoatSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "person.fill.questionmark")
                    .foregroundColor(.yellow)
                Text("THE SCAPEGOATING PLAYBOOK")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.yellow)
            }
            
            Text("When corporations cause problems, they blame others:")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(spacing: 12) {
                scapegoatRow(
                    problem: "Housing unaffordable",
                    blame: "Immigrants",
                    reality: "BlackRock & investors bought 1 in 4 homes. Zoning laws restrict building. Airbnb removes housing stock."
                )
                
                scapegoatRow(
                    problem: "Wages stagnant",
                    blame: "Foreign workers",
                    reality: "Union busting, stock buybacks ($1T+/year), CEO pay explosion. Policy choices, not immigration."
                )
                
                scapegoatRow(
                    problem: "Healthcare expensive",
                    blame: "Government regulation",
                    reality: "Insurance company profits, pharma pricing power, administrative bloat (30% of costs). Other countries do it cheaper."
                )
                
                scapegoatRow(
                    problem: "Inflation",
                    blame: "Stimulus checks",
                    reality: "Corporate profit margins at 70-year highs during 'inflation.' Greedflation is documented."
                )
                
                scapegoatRow(
                    problem: "Crime",
                    blame: "Soft-on-crime DAs",
                    reality: "Poverty, inequality, lack of mental health services. Crime actually down from 1990s peaks."
                )
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func scapegoatRow(problem: String, blame: String, reality: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(problem)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text("They blame: \(blame)")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
            }
            
            Text("Reality: \(reality)")
                .font(.system(size: 11))
                .foregroundColor(.green)
        }
        .padding(10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    // MARK: - Action Section
    
    private var actionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "hand.raised.fill")
                    .foregroundColor(.green)
                Text("WHAT YOU CAN DO")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.green)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                actionRow("Know the real villains", "Don't be distracted by scapegoats")
                actionRow("Support unions", "Worker power is the antidote to corporate power")
                actionRow("Vote for antitrust", "Support politicians who will break up monopolies")
                actionRow("Bank local", "Credit unions over megabanks")
                actionRow("Buy local when possible", "Keep money in your community")
                actionRow("Talk about it", "Help others see through the scapegoating")
            }
            
            Text("The system isn't broken—it's working exactly as designed. To benefit them, not you.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
                .padding(.top, 8)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func actionRow(_ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 14))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Data
    
    private var allCorporations: [EvilCorp] {
        [
            // Asset Management
            EvilCorp(
                name: "BlackRock",
                industry: "Asset Management",
                category: .finance,
                revenue: "$17.9B",
                ceoPay: "$26M",
                taxesPaid: nil,
                evilScore: 95,
                crimes: [
                    "Manages $10 TRILLION in assets—more than any country's GDP except US and China",
                    "Buys up single-family homes, making housing unaffordable",
                    "Votes shares for companies on climate while investing in fossil fuels",
                    "Pushes companies to cut costs (wages) while maximizing 'shareholder value'",
                    "CEO Larry Fink advises governments while profiting from their policies"
                ],
                politicalDonations: "Donates to both parties. Larry Fink is connected to everyone in power.",
                scapegoat: "Immigrants for housing crisis they created"
            ),
            EvilCorp(
                name: "Vanguard",
                industry: "Asset Management",
                category: .finance,
                revenue: "$7.5B",
                ceoPay: "$18M",
                taxesPaid: nil,
                evilScore: 85,
                crimes: [
                    "With BlackRock and State Street, controls voting power over most S&P 500 companies",
                    "'Big Three' own 20%+ of most major corporations",
                    "Enormous influence over corporate decisions without accountability",
                    "Anti-competitive: same owners controlling competing companies"
                ],
                politicalDonations: "Less visible but massive influence through ownership stakes",
                scapegoat: nil
            ),
            
            // Big Tech
            EvilCorp(
                name: "Amazon",
                industry: "E-commerce/Tech",
                category: .tech,
                revenue: "$575B",
                ceoPay: "$1.3M (Jassy) + stock",
                taxesPaid: "6% effective rate",
                evilScore: 90,
                crimes: [
                    "Paid $0 federal income tax in 2018 despite $11B profit",
                    "Brutal warehouse conditions: workers pee in bottles, injury rates double industry average",
                    "Spent $4.3 million on anti-union consultants for ONE warehouse",
                    "Destroyed small businesses while avoiding taxes they paid",
                    "AWS hosts ICE databases, facial recognition sold to police"
                ],
                politicalDonations: "Donates to both parties, massive lobbying ($20M+/year)",
                scapegoat: "'Lazy workers' who won't work for poverty wages"
            ),
            EvilCorp(
                name: "Meta (Facebook)",
                industry: "Social Media",
                category: .tech,
                revenue: "$135B",
                ceoPay: "$27M",
                taxesPaid: "11% effective",
                evilScore: 92,
                crimes: [
                    "Knowingly spreads misinformation (internal docs: 'We knew')",
                    "Instagram harms teen mental health (their own research showed this)",
                    "Enabled genocide in Myanmar through algorithmic amplification",
                    "Sells your data, tracks you across the internet",
                    "Destroyed journalism by taking ad revenue without paying"
                ],
                politicalDonations: "Massive lobbying. Zuckerberg meets with Trump. Donates both sides.",
                scapegoat: "'Bad actors' while their algorithm IS the bad actor"
            ),
            EvilCorp(
                name: "Google (Alphabet)",
                industry: "Tech/Advertising",
                category: .tech,
                revenue: "$307B",
                ceoPay: "$226M (Pichai)",
                taxesPaid: "15% effective",
                evilScore: 85,
                crimes: [
                    "Monopoly on search (90%+ market share), found guilty by DOJ",
                    "Tracks everything you do, sells to advertisers",
                    "Killed journalism by taking ad revenue",
                    "AI Bard/Gemini trained on copyrighted content without permission",
                    "Anti-competitive practices to maintain monopoly"
                ],
                politicalDonations: "Heavy lobbying. Revolving door with government.",
                scapegoat: nil
            ),
            
            // Pharma
            EvilCorp(
                name: "Purdue Pharma (Sacklers)",
                industry: "Pharmaceuticals",
                category: .pharma,
                revenue: "Bankrupt",
                ceoPay: "N/A",
                taxesPaid: "N/A",
                evilScore: 100,
                crimes: [
                    "Created the opioid epidemic—500,000+ Americans dead",
                    "Knew OxyContin was addictive, marketed it as safe",
                    "Paid doctors to prescribe, funded fake patient groups",
                    "Sackler family extracted $10+ billion before bankruptcy",
                    "NO ONE went to prison despite killing more Americans than Vietnam War"
                ],
                politicalDonations: "Millions in donations and lobbying to block regulations",
                scapegoat: "'Drug addicts' they created"
            ),
            EvilCorp(
                name: "Big Pharma (Industry)",
                industry: "Pharmaceuticals",
                category: .pharma,
                revenue: "$600B+ industry",
                ceoPay: "$15-25M average",
                taxesPaid: "Various",
                evilScore: 95,
                crimes: [
                    "Americans pay 2-3x more for drugs than other countries",
                    "Insulin costs $10 to make, sells for $300+",
                    "Spends more on marketing than R&D",
                    "Patent evergreening to block generics",
                    "Most 'new drugs' are reformulations of old ones"
                ],
                politicalDonations: "$300M+ annual lobbying. More lobbyists than Congress members.",
                scapegoat: "'Government regulation' while fighting price controls"
            ),
            
            // Insurance
            EvilCorp(
                name: "Health Insurance Industry",
                industry: "Health Insurance",
                category: .insurance,
                revenue: "$1.3T industry",
                ceoPay: "$20M+ average",
                taxesPaid: "Various",
                evilScore: 95,
                crimes: [
                    "30% of US healthcare spending is administrative costs (vs 2% in Canada)",
                    "Denies claims to boost profits—people die",
                    "CEO of UnitedHealth made $23M while company denied cancer treatments",
                    "Prior authorization delays kill patients",
                    "Exists only in the US among developed nations"
                ],
                politicalDonations: "Massive donations to kill Medicare for All. Both parties.",
                scapegoat: "'Government healthcare would be worse'"
            ),
            
            // Fossil Fuels
            EvilCorp(
                name: "ExxonMobil",
                industry: "Oil & Gas",
                category: .energy,
                revenue: "$413B",
                ceoPay: "$36M",
                taxesPaid: "8% effective in US",
                evilScore: 98,
                crimes: [
                    "KNEW about climate change in 1977, funded denial for 40 years",
                    "Internal scientists predicted current warming accurately",
                    "Spent millions funding climate denial think tanks",
                    "Alaska oil spill (1989), still fighting cleanup costs",
                    "Record profits during 'inflation' crisis ($56B in 2022)"
                ],
                politicalDonations: "Heavy Republican donations. Funded Heritage Foundation, ALEC.",
                scapegoat: "'China emissions' while being largest corporate polluter in history"
            ),
            EvilCorp(
                name: "Koch Industries",
                industry: "Conglomerate/Oil",
                category: .energy,
                revenue: "$125B",
                ceoPay: "Private",
                taxesPaid: "Private",
                evilScore: 95,
                crimes: [
                    "Largest private company in US, zero transparency",
                    "Funded climate denial for decades",
                    "Created network to buy elections: Americans for Prosperity",
                    "Heritage Foundation, ALEC, Cato Institute—all Koch funded",
                    "Environmental violations across multiple states"
                ],
                politicalDonations: "$400M+ per election cycle to Republicans and libertarian causes",
                scapegoat: "Everyone except fossil fuel companies"
            ),
            
            // Private Equity
            EvilCorp(
                name: "Private Equity Industry",
                industry: "Finance",
                category: .finance,
                revenue: "$1T+ AUM",
                ceoPay: "$100M+ top managers",
                taxesPaid: "Carried interest loophole: 20% vs 37%",
                evilScore: 93,
                crimes: [
                    "Buy companies with debt, extract value, let them fail",
                    "Destroyed Toys R Us (30,000 jobs), Sears, many others",
                    "Buy nursing homes, cut staff, patients die (documented)",
                    "Buy housing, raise rents, reduce maintenance",
                    "Carried interest loophole: pay less taxes than workers"
                ],
                politicalDonations: "Both parties. Biden's team includes PE executives.",
                scapegoat: "'Bad management' of companies they looted"
            ),
            
            // Prison Industry
            EvilCorp(
                name: "CoreCivic & GEO Group",
                industry: "Private Prisons",
                category: .prisons,
                revenue: "$4B combined",
                ceoPay: "$4-5M",
                taxesPaid: nil,
                evilScore: 90,
                crimes: [
                    "Profit from mass incarceration",
                    "Lobby for harsher sentences (more inmates = more profit)",
                    "ICE detention contracts: profit from family separation",
                    "Worse conditions than public prisons (documented)",
                    "Pay inmates $0.23-$1.15/hour (legal slavery per 13th Amendment)"
                ],
                politicalDonations: "Heavy Republican donations. Support 'tough on crime' candidates.",
                scapegoat: "'Criminals' to justify their profit model"
            ),
            
            // Food Industry
            EvilCorp(
                name: "Nestlé",
                industry: "Food & Beverage",
                category: .food,
                revenue: "$100B",
                ceoPay: "$11M",
                taxesPaid: nil,
                evilScore: 88,
                crimes: [
                    "Former CEO: 'Water is not a human right'",
                    "Pumps water from drought areas for pennies, sells bottled",
                    "Baby formula scandal: pushed formula in developing countries, babies died",
                    "Child labor in cocoa supply chain (documented)",
                    "Owns 2,000+ brands—hard to boycott"
                ],
                politicalDonations: "Global lobbying against water regulations",
                scapegoat: nil
            ),
            EvilCorp(
                name: "Tyson Foods",
                industry: "Meat Processing",
                category: .food,
                revenue: "$53B",
                ceoPay: "$12M",
                taxesPaid: nil,
                evilScore: 82,
                crimes: [
                    "Dangerous working conditions: COVID outbreaks, injuries",
                    "Managers bet on how many workers would get COVID",
                    "Environmental pollution from factory farms",
                    "Price-fixing lawsuits (settled)",
                    "Exploits immigrant workers, then blames them for problems"
                ],
                politicalDonations: "Both parties. Lobbies against meat worker protections.",
                scapegoat: "'Immigrant workers' they exploit"
            ),
            
            // Retail
            EvilCorp(
                name: "Walmart",
                industry: "Retail",
                category: .retail,
                revenue: "$648B",
                ceoPay: "$27M",
                taxesPaid: "~21%",
                evilScore: 80,
                crimes: [
                    "Pays poverty wages—workers need food stamps (taxpayer subsidized)",
                    "Anti-union: closes stores that vote to unionize",
                    "Destroyed small town retail across America",
                    "Walton family worth $250B+, workers make $14/hour",
                    "Gender discrimination lawsuits (largest class action in history)"
                ],
                politicalDonations: "Both parties. Heavy lobbying against minimum wage increases.",
                scapegoat: "'Lazy workers' while paying poverty wages"
            )
        ]
    }
}

// MARK: - Models

enum CorpCategory: String, CaseIterable {
    case all = "All"
    case finance = "Finance"
    case tech = "Big Tech"
    case pharma = "Pharma"
    case insurance = "Insurance"
    case energy = "Oil & Gas"
    case prisons = "Prisons"
    case food = "Food"
    case retail = "Retail"
}

struct EvilCorp {
    let name: String
    let industry: String
    let category: CorpCategory
    let revenue: String
    let ceoPay: String
    let taxesPaid: String?
    let evilScore: Int
    let crimes: [String]
    let politicalDonations: String
    let scapegoat: String?
}

#Preview {
    NavigationStack {
        CorporationsExposedView()
    }
}
