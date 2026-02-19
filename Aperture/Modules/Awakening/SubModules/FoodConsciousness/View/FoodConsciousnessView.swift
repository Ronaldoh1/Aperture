import SwiftUI

// MARK: - Food Consciousness Hub

struct FoodConsciousnessView: View {
    @StateObject private var chemicalsDB = ToxicChemicalsDatabase.shared
    @StateObject private var fastFoodDB = FastFoodExposedDatabase.shared
    @StateObject private var drinksDB = ToxicDrinksDatabase.shared
    
    @State private var selectedTab = 0
    @State private var showScanner = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(hex: "#1a1a2e"),
                        Color(hex: "#16213e"),
                        Color(hex: "#0f3460")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        headerSection
                        
                        // Quick Actions
                        quickActionsSection
                        
                        // Tab Selection
                        tabSelector
                        
                        // Content based on selected tab
                        switch selectedTab {
                        case 0:
                            ingredientScannerSection
                        case 1:
                            fastFoodSection
                        case 2:
                            toxicDrinksSection
                        case 3:
                            hydrationCoachSection
                        default:
                            EmptyView()
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding()
                }
            }
            .navigationTitle("Food Consciousness")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showScanner) {
                IngredientScannerView()
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "leaf.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.green, Color(hex: "#90EE90")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("Know What You Consume")
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Text("Your body is a temple. Know what you're putting into it.")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        HStack(spacing: 16) {
            FoodQuickActionButton(
                icon: "camera.viewfinder",
                title: "Scan",
                subtitle: "Ingredients",
                color: .green
            ) {
                showScanner = true
            }
            
            NavigationLink(destination: FastFoodExposedView()) {
                FoodQuickActionCard(
                    icon: "fork.knife",
                    title: "Fast Food",
                    subtitle: "Exposed",
                    color: .red
                )
            }
            
            NavigationLink(destination: ToxicDrinksView()) {
                FoodQuickActionCard(
                    icon: "cup.and.saucer.fill",
                    title: "Drinks",
                    subtitle: "Exposed",
                    color: .orange
                )
            }
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                FoodTabButton(title: "Scan", icon: "barcode.viewfinder", isSelected: selectedTab == 0) {
                    withAnimation { selectedTab = 0 }
                }
                
                FoodTabButton(title: "Fast Food", icon: "fork.knife", isSelected: selectedTab == 1) {
                    withAnimation { selectedTab = 1 }
                }
                
                FoodTabButton(title: "Drinks", icon: "cup.and.saucer.fill", isSelected: selectedTab == 2) {
                    withAnimation { selectedTab = 2 }
                }
                
                FoodTabButton(title: "Hydration", icon: "drop.fill", isSelected: selectedTab == 3) {
                    withAnimation { selectedTab = 3 }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Ingredient Scanner Section
    
    private var ingredientScannerSection: some View {
        VStack(spacing: 16) {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white.opacity(0.5))
                
                TextField("Search ingredients...", text: $searchText)
                    .foregroundColor(.white)
                    .autocapitalization(.none)
                
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            
            // Search Results or Categories
            if searchText.isEmpty {
                toxicCategoriesGrid
            } else {
                searchResultsView
            }
            
            // Critical Chemicals Warning
            criticalChemicalsSection
        }
    }
    
    private var toxicCategoriesGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            ForEach(ToxicChemical.ToxicCategory.allCases, id: \.self) { category in
                NavigationLink(destination: ChemicalCategoryView(category: category)) {
                    CategoryCard(category: category)
                }
            }
        }
    }
    
    private var searchResultsView: some View {
        VStack(spacing: 12) {
            let results = chemicalsDB.searchIngredient(searchText)
            
            if results.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    Text("No known toxins found")
                        .foregroundColor(.white)
                    Text("This ingredient isn't in our database")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding()
            } else {
                ForEach(results) { chemical in
                    NavigationLink(destination: ChemicalDetailView(chemical: chemical)) {
                        ToxicChemicalCard(chemical: chemical)
                    }
                }
            }
        }
    }
    
    private var criticalChemicalsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("Critical Chemicals to Avoid")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            ForEach(chemicalsDB.getCriticalChemicals().prefix(3)) { chemical in
                NavigationLink(destination: ChemicalDetailView(chemical: chemical)) {
                    ToxicChemicalCard(chemical: chemical)
                }
            }
            
            NavigationLink(destination: AllToxicChemicalsView()) {
                Text("View All \(chemicalsDB.chemicals.count) Chemicals →")
                    .font(.subheadline.bold())
                    .foregroundColor(Color(hex: "#FFD700"))
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
    }
    
    // MARK: - Fast Food Section
    
    private var fastFoodSection: some View {
        VStack(spacing: 16) {
            // State Selector
            NavigationLink(destination: FastFoodByStateView()) {
                HStack {
                    Image(systemName: "map.fill")
                        .foregroundColor(.orange)
                    Text("View by State")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
            }
            
            // Worst Chains
            VStack(alignment: .leading, spacing: 12) {
                Text("Worst Offenders")
                    .font(.headline)
                    .foregroundColor(.white)
                
                ForEach(fastFoodDB.getWorstChains()) { chain in
                    NavigationLink(destination: FastFoodChainDetailView(chain: chain)) {
                        FastFoodChainCard(chain: chain)
                    }
                }
            }
        }
    }
    
    // MARK: - Toxic Drinks Section
    
    private var toxicDrinksSection: some View {
        VStack(spacing: 16) {
            // Sugar Warning
            VStack(spacing: 8) {
                Image(systemName: "cube.fill")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                Text("The average American drinks 45 gallons of soda per year")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.pink.opacity(0.2))
            .cornerRadius(16)
            
            // Categories
            ForEach(ToxicDrink.DrinkCategory.allCases, id: \.self) { category in
                let drinks = drinksDB.getDrinksByCategory(category)
                if !drinks.isEmpty {
                    NavigationLink(destination: DrinkCategoryView(category: category)) {
                        DrinkCategoryCard(category: category, count: drinks.count)
                    }
                }
            }
        }
    }
    
    // MARK: - Hydration Coach Section
    
    private var hydrationCoachSection: some View {
        VStack(spacing: 16) {
            // Water reminder
            VStack(spacing: 12) {
                Image(systemName: "drop.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.cyan)
                
                Text("Your Body is 60% Water")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Stay hydrated with clean water. Avoid sugary drinks and artificial sweeteners.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [.cyan.opacity(0.3), .blue.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(16)
            
            // Fasting Benefits
            NavigationLink(destination: FastingGuideView()) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Intermittent Fasting")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Learn the benefits of giving your body a break")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    Spacer()
                    Image(systemName: "clock.fill")
                        .foregroundColor(.orange)
                }
                .padding()
                .background(Color.orange.opacity(0.2))
                .cornerRadius(12)
            }
            
            // Clean Eating Tips
            NavigationLink(destination: CleanEatingGuideView()) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Clean Eating Guide")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Organic fruits, vegetables, and whole foods")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    Spacer()
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - Supporting Views

struct FoodQuickActionButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            FoodQuickActionCard(icon: icon, title: title, subtitle: subtitle, color: color)
        }
    }
}

struct FoodQuickActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            
            VStack(spacing: 2) {
                Text(title)
                    .font(.caption.bold())
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.6))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.2))
        .cornerRadius(12)
    }
}

struct FoodTabButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                Text(title)
            }
            .font(.subheadline)
            .foregroundColor(isSelected ? .black : .white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isSelected ? Color(hex: "#90EE90") : Color.white.opacity(0.1))
            .cornerRadius(20)
        }
    }
}

struct CategoryCard: View {
    let category: ToxicChemical.ToxicCategory
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: category.icon)
                .font(.title)
                .foregroundColor(category.color)
            
            Text(category.rawValue)
                .font(.caption.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(category.color.opacity(0.2))
        .cornerRadius(12)
    }
}

struct ToxicChemicalCard: View {
    let chemical: ToxicChemical
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: chemical.dangerLevel.icon)
                .font(.title2)
                .foregroundColor(chemical.dangerLevel.color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(chemical.name)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Text(chemical.category.rawValue)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
            
            Text(chemical.dangerLevel.name)
                .font(.caption.bold())
                .foregroundColor(chemical.dangerLevel.color)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(chemical.dangerLevel.color.opacity(0.2))
                .cornerRadius(8)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct FastFoodChainCard: View {
    let chain: FastFoodChain
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: chain.logo)
                .font(.title)
                .foregroundColor(chain.overallScore.color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(chain.name)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Text("\(chain.exposedIngredients.count) toxic ingredients")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Image(systemName: chain.overallScore.icon)
                Text(chain.overallScore.name)
            }
            .font(.caption.bold())
            .foregroundColor(chain.overallScore.color)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct DrinkCategoryCard: View {
    let category: ToxicDrink.DrinkCategory
    let count: Int
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: category.icon)
                .font(.title2)
                .foregroundColor(category.color)
            
            Text(category.rawValue)
                .font(.subheadline.bold())
                .foregroundColor(.white)
            
            Spacer()
            
            Text("\(count) drinks")
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.3))
        }
        .padding()
        .background(category.color.opacity(0.15))
        .cornerRadius(12)
    }
}

// MARK: - Placeholder Views (to be expanded)

struct IngredientScannerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var ingredientText = ""
    @State private var analysisResults: [ToxicChemical] = []
    @StateObject private var chemicalsDB = ToxicChemicalsDatabase.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#1a1a2e").ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Instructions
                    VStack(spacing: 8) {
                        Image(systemName: "text.viewfinder")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
                        
                        Text("Paste Ingredients Here")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Copy the ingredient list from a product and paste it below")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Text Input
                    TextEditor(text: $ingredientText)
                        .frame(height: 150)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                    
                    // Analyze Button
                    Button(action: analyzeIngredients) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Analyze Ingredients")
                        }
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#90EE90"))
                        .cornerRadius(12)
                    }
                    
                    // Results
                    if !analysisResults.isEmpty {
                        ScrollView {
                            VStack(spacing: 12) {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.red)
                                    Text("Found \(analysisResults.count) Toxic Ingredients")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                
                                ForEach(analysisResults) { chemical in
                                    ToxicChemicalCard(chemical: chemical)
                                }
                            }
                        }
                    } else if !ingredientText.isEmpty && analysisResults.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            Text("No known toxins detected!")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Ingredient Scanner")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func analyzeIngredients() {
        analysisResults = chemicalsDB.analyzeIngredientList(ingredientText)
    }
}

struct FastFoodExposedView: View {
    @StateObject private var fastFoodDB = FastFoodExposedDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(fastFoodDB.chains) { chain in
                        NavigationLink(destination: FastFoodChainDetailView(chain: chain)) {
                            FastFoodChainCard(chain: chain)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Fast Food Exposed")
    }
}

struct ToxicDrinksView: View {
    @StateObject private var drinksDB = ToxicDrinksDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(drinksDB.getWorstDrinks(count: 20)) { drink in
                        NavigationLink(destination: DrinkDetailView(drink: drink)) {
                            ToxicDrinkCard(drink: drink)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Toxic Drinks")
    }
}

struct ToxicDrinkCard: View {
    let drink: ToxicDrink
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: drink.category.icon)
                .font(.title2)
                .foregroundColor(drink.category.color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(drink.name)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Text("\(Int(drink.sugarGrams))g sugar")
                    .font(.caption)
                    .foregroundColor(.pink)
            }
            
            Spacer()
            
            Text(drink.dangerLevel.name)
                .font(.caption.bold())
                .foregroundColor(drink.dangerLevel.color)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// Placeholder detail views
struct ChemicalDetailView: View {
    let chemical: ToxicChemical
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: chemical.dangerLevel.icon)
                            .font(.system(size: 50))
                            .foregroundColor(chemical.dangerLevel.color)
                        
                        Text(chemical.name)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        
                        Text(chemical.dangerLevel.name)
                            .font(.headline)
                            .foregroundColor(chemical.dangerLevel.color)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("What is it?")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(chemical.description)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Health Effects
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Health Effects")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        ForEach(chemical.effects) { effect in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(.red)
                                VStack(alignment: .leading) {
                                    Text(effect.effect)
                                        .font(.subheadline.bold())
                                        .foregroundColor(.white)
                                    Text(effect.description)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Commonly Found In
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Commonly Found In")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        ForEach(chemical.commonlyFoundIn, id: \.self) { item in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 6))
                                Text(item)
                            }
                            .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Banned In
                    if !chemical.bannedIn.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Banned In")
                                .font(.headline)
                                .foregroundColor(.purple)
                            
                            Text(chemical.bannedIn.joined(separator: ", "))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    // Safe Alternatives
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Safe Alternatives")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        ForEach(chemical.safeAlternatives, id: \.self) { alt in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(alt)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle(chemical.name)
    }
}

struct ChemicalCategoryView: View {
    let category: ToxicChemical.ToxicCategory
    @StateObject private var chemicalsDB = ToxicChemicalsDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(chemicalsDB.getChemicalsByCategory(category)) { chemical in
                        NavigationLink(destination: ChemicalDetailView(chemical: chemical)) {
                            ToxicChemicalCard(chemical: chemical)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.rawValue)
    }
}

struct AllToxicChemicalsView: View {
    @StateObject private var chemicalsDB = ToxicChemicalsDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(chemicalsDB.chemicals) { chemical in
                        NavigationLink(destination: ChemicalDetailView(chemical: chemical)) {
                            ToxicChemicalCard(chemical: chemical)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("All Toxic Chemicals")
    }
}

struct FastFoodByStateView: View {
    @StateObject private var fastFoodDB = FastFoodExposedDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(fastFoodDB.stateStats) { state in
                        NavigationLink(destination: StateDetailView(state: state)) {
                            StateCard(state: state)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("By State")
    }
}

struct StateCard: View {
    let state: StateStats
    
    var body: some View {
        HStack(spacing: 12) {
            Text(state.id)
                .font(.title.bold())
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(state.stateName)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Text("Obesity: \(String(format: "%.1f", state.obesityRate))%")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.3))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct StateDetailView: View {
    let state: StateStats
    @StateObject private var fastFoodDB = FastFoodExposedDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Stats
                    HStack(spacing: 16) {
                        FoodStatBox(title: "Obesity", value: "\(String(format: "%.1f", state.obesityRate))%", color: .red)
                        FoodStatBox(title: "Diabetes", value: "\(String(format: "%.1f", state.diabetesRate))%", color: .orange)
                    }
                    
                    // Top Chains
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Top Fast Food Chains")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        ForEach(fastFoodDB.getChainsForState(state.id)) { chain in
                            FastFoodChainCard(chain: chain)
                        }
                    }
                    
                    // Warnings
                    if !state.localWarnings.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Local Warnings")
                                .font(.headline)
                                .foregroundColor(.red)
                            
                            ForEach(state.localWarnings, id: \.self) { warning in
                                HStack(alignment: .top) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.yellow)
                                    Text(warning)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                            }
                        }
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(state.stateName)
    }
}

struct FoodStatBox: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title.bold())
                .foregroundColor(color)
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.2))
        .cornerRadius(12)
    }
}

struct FastFoodChainDetailView: View {
    let chain: FastFoodChain
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: chain.logo)
                            .font(.system(size: 60))
                            .foregroundColor(chain.overallScore.color)
                        
                        Text(chain.name)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        
                        HStack {
                            Image(systemName: chain.overallScore.icon)
                            Text(chain.overallScore.name)
                        }
                        .foregroundColor(chain.overallScore.color)
                    }
                    .padding()
                    
                    // Exposed Ingredients
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Toxic Ingredients Found")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        ForEach(chain.exposedIngredients) { ingredient in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(ingredient.ingredient)
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                                Text(ingredient.issue)
                                    .font(.caption)
                                    .foregroundColor(.red.opacity(0.8))
                                Text("Found in: \(ingredient.foundIn.joined(separator: ", "))")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    // Dirty Secrets
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Dirty Secrets")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        ForEach(chain.dirtySecrets) { secret in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(secret.title)
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                                Text(secret.description)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .padding()
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    // Marketing Lies
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Marketing vs Reality")
                            .font(.headline)
                            .foregroundColor(.purple)
                        
                        ForEach(chain.marketingLies, id: \.self) { lie in
                            HStack(alignment: .top) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text(lie)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Healthier Alternatives
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Healthier Alternatives")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        ForEach(chain.healthierAlternatives, id: \.self) { alt in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(alt)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle(chain.name)
    }
}

struct DrinkCategoryView: View {
    let category: ToxicDrink.DrinkCategory
    @StateObject private var drinksDB = ToxicDrinksDatabase.shared
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(drinksDB.getDrinksByCategory(category)) { drink in
                        NavigationLink(destination: DrinkDetailView(drink: drink)) {
                            ToxicDrinkCard(drink: drink)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.rawValue)
    }
}

struct DrinkDetailView: View {
    let drink: ToxicDrink
    
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: drink.category.icon)
                            .font(.system(size: 50))
                            .foregroundColor(drink.category.color)
                        
                        Text(drink.name)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        
                        Text(drink.brand)
                            .foregroundColor(.white.opacity(0.6))
                        
                        // Sugar display
                        HStack(spacing: 4) {
                            Image(systemName: "cube.fill")
                                .foregroundColor(.pink)
                            Text("\(Int(drink.sugarGrams))g sugar")
                                .font(.headline)
                                .foregroundColor(.pink)
                            Text("(\(Int(drink.sugarGrams / 4)) teaspoons)")
                                .font(.caption)
                                .foregroundColor(.pink.opacity(0.7))
                        }
                    }
                    .padding()
                    
                    // Harmful Ingredients
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Harmful Ingredients")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        ForEach(drink.harmfulIngredients) { ingredient in
                            HStack(alignment: .top) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                                VStack(alignment: .leading) {
                                    Text(ingredient.name)
                                        .font(.subheadline.bold())
                                        .foregroundColor(.white)
                                    Text(ingredient.effect)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Marketing vs Reality
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Marketing:")
                                .font(.caption.bold())
                                .foregroundColor(.white.opacity(0.5))
                            Text(drink.marketingClaim)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        
                        HStack(alignment: .top) {
                            Text("Reality:")
                                .font(.caption.bold())
                                .foregroundColor(.red)
                            Text(drink.reality)
                                .font(.caption)
                                .foregroundColor(.red.opacity(0.8))
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Healthier Alternative
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Healthier Alternative")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text(drink.healthierAlternative)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle(drink.name)
    }
}

// Placeholder guide views
struct FastingGuideView: View {
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                    
                    Text("Intermittent Fasting")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("Coming Soon")
                        .foregroundColor(.white.opacity(0.6))
                    
                    // Benefits preview
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Benefits of Fasting")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        ForEach(["Autophagy - cellular cleanup", "Improved insulin sensitivity", "Mental clarity", "Weight management", "Longevity benefits"], id: \.self) { benefit in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(benefit)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Fasting Guide")
    }
}

struct CleanEatingGuideView: View {
    var body: some View {
        ZStack {
            Color(hex: "#1a1a2e").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                    
                    Text("Clean Eating Guide")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    // Foods to eat
                    VStack(alignment: .leading, spacing: 12) {
                        Text("✅ Foods to Embrace")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        ForEach(["Organic fruits and vegetables", "Grass-fed/pasture-raised meats", "Wild-caught fish", "Nuts and seeds", "Whole grains (if tolerated)", "Filtered water"], id: \.self) { food in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(food)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Foods to avoid
                    VStack(alignment: .leading, spacing: 12) {
                        Text("❌ Foods to Avoid")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        ForEach(["Processed foods", "Fast food", "Sugary drinks", "Artificial sweeteners", "Trans fats", "Foods with ingredients you can't pronounce"], id: \.self) { food in
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text(food)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Clean Eating")
    }
}

// MARK: - Preview

struct FoodConsciousnessView_Previews: PreviewProvider {
    static var previews: some View {
        FoodConsciousnessView()
    }
}
