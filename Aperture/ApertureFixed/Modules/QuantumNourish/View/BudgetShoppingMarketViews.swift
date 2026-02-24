// BudgetShoppingMarketViews.swift
// BUDGET MODE + SHOPPING LIST + LOCAL MARKET FINDER
// Consciousness education shouldn't require a Whole Foods salary.
// ☀️ SunFlow: Reignited

import SwiftUI
import MapKit

// ═══════════════════════════════════════════════
// MARK: - BUDGET MODE VIEW
// ═══════════════════════════════════════════════

struct BudgetModeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var budget: BudgetTier = .moderate
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 10) {
                            Image(systemName: "dollarsign.circle.fill").font(.system(size: 44)).foregroundColor(Color(hex: "#2ECC71"))
                            Text("BUDGET MODE").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(Color(hex: "#2ECC71"))
                            Text("Upgrade What Matters First").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                            Text("You don't need to buy all organic tomorrow. Here's what to switch FIRST for maximum impact on any budget.")
                                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary).multilineTextAlignment(.center).lineSpacing(3)
                        }.padding(.top, 12)
                        
                        // Budget selector
                        VStack(alignment: .leading, spacing: 10) {
                            Text("YOUR WEEKLY GROCERY BUDGET").font(.system(size: 10, weight: .bold)).tracking(1.5).foregroundColor(Palette.text.muted)
                            HStack(spacing: 8) {
                                ForEach(BudgetTier.allCases, id: \.self) { tier in
                                    Button {
                                        budget = tier
                                        HapticManager.shared.light()
                                    } label: {
                                        VStack(spacing: 4) {
                                            Text(tier.label).font(.system(size: 11, weight: .bold)).foregroundColor(budget == tier ? .black : Palette.text.muted)
                                            Text(tier.range).font(.system(size: 9)).foregroundColor(budget == tier ? .black.opacity(0.7) : Palette.text.muted)
                                        }
                                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(budget == tier ? Color(hex: "#2ECC71") : Color.white.opacity(0.05)))
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        
                        // Priority swaps
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 6) {
                                Image(systemName: "1.circle.fill").foregroundColor(Color(hex: "#E74C3C"))
                                Text("SWITCH THESE FIRST").font(.system(size: 10, weight: .bold)).tracking(1.5).foregroundColor(Color(hex: "#E74C3C"))
                            }
                            Text("Highest pesticide load + biggest health impact. Switch these before anything else.")
                                .font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.muted)
                            
                            ForEach(BudgetSwapDatabase.dirtyDozen, id: \.item) { swap in
                                swapRow(swap, priority: .critical)
                            }
                        }.padding(16).background(RoundedRectangle(cornerRadius: 16).fill(Color(hex: "#E74C3C").opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#E74C3C").opacity(0.15), lineWidth: 1)))
                        
                        // Clean Fifteen
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.circle.fill").foregroundColor(Color(hex: "#2ECC71"))
                                Text("SAVE MONEY HERE — CONVENTIONAL IS FINE").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#2ECC71"))
                            }
                            Text("Low pesticide residue even when non-organic. Buy conventional and save your budget for the Dirty Dozen.")
                                .font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.muted)
                            
                            ForEach(BudgetSwapDatabase.cleanFifteen, id: \.self) { item in
                                HStack(spacing: 10) {
                                    Image(systemName: "checkmark.circle").font(.system(size: 14)).foregroundColor(Color(hex: "#2ECC71"))
                                    Text(item).font(.system(size: 14, weight: .medium)).foregroundColor(Palette.text.primary)
                                    Spacer()
                                    Text("SAVE $").font(.system(size: 10, weight: .bold)).foregroundColor(Color(hex: "#2ECC71"))
                                }
                            }
                        }.padding(16).background(RoundedRectangle(cornerRadius: 16).fill(Color(hex: "#2ECC71").opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#2ECC71").opacity(0.15), lineWidth: 1)))
                        
                        // Budget tips
                        VStack(alignment: .leading, spacing: 12) {
                            Text("💡 BUDGET HACKS").font(.system(size: 10, weight: .bold)).tracking(1.5).foregroundColor(Palette.accent.gold)
                            ForEach(budget.tips, id: \.self) { tip in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "lightbulb.fill").font(.system(size: 12)).foregroundColor(Palette.accent.gold)
                                    Text(tip).font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary).lineSpacing(3)
                                }
                            }
                        }.padding(16).background(RoundedRectangle(cornerRadius: 16).fill(Palette.accent.gold.opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Palette.accent.gold.opacity(0.15), lineWidth: 1)))
                        
                        DisclaimerStack(types: [.nutritional])
                        
                        Spacer(minLength: 100)
                    }.padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { HStack(spacing: 4) { Image(systemName: "chevron.left"); Text("Back") }.foregroundColor(Color(hex: "#2ECC71")) }
                }
                ToolbarItem(placement: .principal) {
                    Text("BUDGET MODE").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Color(hex: "#2ECC71"))
                }
            }
        }
    }
    
    private func swapRow(_ swap: BudgetSwap, priority: SwapPriority) -> some View {
        HStack(spacing: 12) {
            Text(swap.icon).font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(swap.item).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                Text(swap.reason).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted).lineLimit(2)
            }
            Spacer()
            if let savings = budget.savings(for: swap) {
                Text(savings).font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(Color(hex: "#2ECC71"))
            }
        }.padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
    }
}

enum SwapPriority { case critical, medium, low }

enum BudgetTier: String, CaseIterable {
    case tight = "tight"
    case moderate = "moderate"
    case comfortable = "comfortable"
    
    var label: String {
        switch self {
        case .tight: return "Tight"
        case .moderate: return "Moderate"
        case .comfortable: return "Flexible"
        }
    }
    
    var range: String {
        switch self {
        case .tight: return "<$75/wk"
        case .moderate: return "$75-150/wk"
        case .comfortable: return "$150+/wk"
        }
    }
    
    var tips: [String] {
        switch self {
        case .tight: return [
            "Buy frozen organic produce — same nutrition, half the price, no food waste.",
            "Farmers markets at closing time often sell at 50% off to avoid hauling produce back.",
            "Rice, beans, lentils, and oats are high-vibe staples that cost pennies per serving.",
            "Grow your own sprouts on a windowsill — 4 days from seed to superfood for under $3.",
            "Filter your tap water with a basic carbon filter ($20) instead of buying bottled."
        ]
        case .moderate: return [
            "Join a CSA (Community Supported Agriculture) — bulk organic produce for 30-40% less.",
            "Costco/Sam's Club organic section has competitive prices on staples.",
            "Buy whole chickens instead of breasts — more food, make bone broth from the carcass.",
            "Invest in a water filter pitcher — removes fluoride and chlorine for months per filter.",
            "Batch cook on Sundays — one pot of organic rice and beans feeds you all week."
        ]
        case .comfortable: return [
            "Go 100% organic for the Dirty Dozen — your biggest impact move.",
            "Invest in a Berkey water filter — removes fluoride, heavy metals, and pharmaceuticals.",
            "Buy grass-fed beef and pasture-raised eggs — the nutrient density justifies the cost.",
            "Subscribe to Thrive Market or Butcher Box for delivered organic at wholesale prices.",
            "Consider a home garden or tower garden — ROI is incredible after the first harvest."
        ]
        }
    }
    
    func savings(for swap: BudgetSwap) -> String? {
        switch self {
        case .tight: return "→ frozen org"
        case .moderate: return "→ organic"
        case .comfortable: return "→ local org"
        }
    }
}

struct BudgetSwap: Identifiable {
    let id = UUID()
    let item: String
    let icon: String
    let reason: String
}

struct BudgetSwapDatabase {
    static let dirtyDozen: [BudgetSwap] = [
        BudgetSwap(item: "Strawberries", icon: "🍓", reason: "Highest pesticide residue of any produce — up to 22 different pesticides found"),
        BudgetSwap(item: "Spinach", icon: "🥬", reason: "Contains permethrin, a neurotoxic insecticide. Wash won't remove it."),
        BudgetSwap(item: "Kale / Collards", icon: "🥗", reason: "DCPA (Dacthal) detected — an herbicide classified as possible carcinogen"),
        BudgetSwap(item: "Nectarines", icon: "🍑", reason: "94% of samples had 2+ pesticides. Thin skin = easy absorption."),
        BudgetSwap(item: "Apples", icon: "🍎", reason: "Diphenylamine residue — banned in the EU since 2012. Still on US apples."),
        BudgetSwap(item: "Grapes", icon: "🍇", reason: "Up to 15 pesticides per sample. Thin skin, no peeling option."),
        BudgetSwap(item: "Bell Peppers", icon: "🫑", reason: "87 different pesticides detected across samples. High variety = high concern."),
        BudgetSwap(item: "Cherries", icon: "🍒", reason: "High pesticide load. Go organic or frozen organic."),
        BudgetSwap(item: "Peaches", icon: "🍑", reason: "Fuzzy skin traps pesticides. Peeling helps but doesn't eliminate."),
        BudgetSwap(item: "Pears", icon: "🍐", reason: "Multiple fungicide residues detected."),
        BudgetSwap(item: "Celery", icon: "🌿", reason: "No protective outer peel. Absorbs everything from the soil."),
        BudgetSwap(item: "Tomatoes", icon: "🍅", reason: "Thin skin absorbs pesticides. Canned organic is a budget alternative."),
    ]
    
    static let cleanFifteen: [String] = [
        "Avocados", "Sweet Corn", "Pineapple", "Onions", "Papaya",
        "Frozen Sweet Peas", "Asparagus", "Honeydew Melon", "Kiwi",
        "Cabbage", "Mushrooms", "Mangoes", "Sweet Potatoes", "Watermelon", "Carrots"
    ]
}

// ═══════════════════════════════════════════════
// MARK: - SHOPPING LIST VIEW
// ═══════════════════════════════════════════════

struct ShoppingListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var list = ShoppingListManager.shared
    @State private var newItemText = ""
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Image(systemName: "cart.fill").font(.system(size: 44)).foregroundColor(Color(hex: "#2ECC71"))
                            Text("QUANTUM SHOPPING LIST").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(Color(hex: "#2ECC71"))
                            Text("Your Conscious Grocery Run").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }.padding(.top, 12)
                        
                        // Add item
                        HStack(spacing: 10) {
                            TextField("Add custom item...", text: $newItemText)
                                .font(.system(size: 14)).foregroundColor(Palette.text.primary)
                                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                                .onSubmit { addCustomItem() }
                            Button { addCustomItem() } label: {
                                Image(systemName: "plus.circle.fill").font(.system(size: 32)).foregroundColor(Color(hex: "#2ECC71"))
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                        // Stats
                        let checkedCount: Int = list.items.filter({ $0.checked }).count
                        let needCount: Int = list.items.filter({ !$0.checked }).count
                        HStack(spacing: 16) {
                            statBadge("\(list.items.count)", "items", Color(hex: "#2ECC71"))
                            statBadge("\(checkedCount)", "got it", Color(hex: "#3498DB"))
                            statBadge("\(needCount)", "need", Color(hex: "#FF6B35"))
                        }
                        
                        // Grouped by category
                        ForEach(ShoppingCategory.allCases, id: \.self) { cat in
                            let catItems: [ShoppingItem] = list.items.filter({ $0.category == cat })
                            if !catItems.isEmpty {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text(cat.icon).font(.system(size: 16))
                                        Text(cat.rawValue.uppercased()).font(.system(size: 10, weight: .bold)).tracking(1.5).foregroundColor(cat.color)
                                        Spacer()
                                        Text("\(catItems.count)").font(.system(size: 11, weight: .bold, design: .rounded)).foregroundColor(Palette.text.muted)
                                    }
                                    ForEach(catItems) { item in
                                        shoppingRow(item)
                                    }
                                }
                                .padding(14)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
                                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(cat.color.opacity(0.1), lineWidth: 1)))
                            }
                        }
                        
                        // Clear buttons
                        if !list.items.isEmpty {
                            HStack(spacing: 12) {
                                Button {
                                    list.clearChecked()
                                    HapticManager.shared.medium()
                                } label: {
                                    Label("Clear Checked", systemImage: "checkmark.circle")
                                        .font(.system(size: 12, weight: .bold)).foregroundColor(Palette.text.muted)
                                        .frame(maxWidth: .infinity).padding(12)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                                }.buttonStyle(PlainButtonStyle())
                                
                                Button {
                                    list.clearAll()
                                    HapticManager.shared.medium()
                                } label: {
                                    Label("Clear All", systemImage: "trash")
                                        .font(.system(size: 12, weight: .bold)).foregroundColor(.red.opacity(0.7))
                                        .frame(maxWidth: .infinity).padding(12)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }.padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { HStack(spacing: 4) { Image(systemName: "chevron.left"); Text("Back") }.foregroundColor(Color(hex: "#2ECC71")) }
                }
                ToolbarItem(placement: .principal) {
                    Text("SHOPPING LIST").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Color(hex: "#2ECC71"))
                }
            }
        }
    }
    
    private func shoppingRow(_ item: ShoppingItem) -> some View {
        HStack(spacing: 12) {
            Button {
                list.toggleChecked(item)
                HapticManager.shared.light()
            } label: {
                Image(systemName: item.checked ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20)).foregroundColor(item.checked ? Color(hex: "#2ECC71") : Palette.text.muted)
            }.buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.name).font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(item.checked ? Palette.text.muted : Palette.text.primary)
                    .strikethrough(item.checked, color: Palette.text.muted)
                if let qty = item.quantity {
                    Text(qty).font(.system(size: 11)).foregroundColor(Palette.text.muted)
                }
            }
            Spacer()
            if item.isOrganic {
                Text("ORG").font(.system(size: 8, weight: .bold)).foregroundColor(Color(hex: "#2ECC71"))
                    .padding(.horizontal, 6).padding(.vertical, 3)
                    .background(Capsule().fill(Color(hex: "#2ECC71").opacity(0.15)))
            }
            
            Button {
                list.remove(item)
                HapticManager.shared.light()
            } label: {
                Image(systemName: "xmark.circle").font(.system(size: 16)).foregroundColor(.red.opacity(0.4))
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    private func addCustomItem() {
        guard !newItemText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        list.add(ShoppingItem(name: newItemText.trimmingCharacters(in: .whitespaces), quantity: nil, category: .other, isOrganic: false))
        newItemText = ""
        HapticManager.shared.medium()
    }
    
    private func statBadge(_ value: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(Palette.text.muted)
        }.frame(maxWidth: .infinity)
    }
}

// MARK: - Shopping List Manager

@MainActor
class ShoppingListManager: ObservableObject {
    static let shared = ShoppingListManager()
    
    @Published var items: [ShoppingItem] = []
    private let key = "quantum.shopping.list"
    
    init() { load() }
    
    func add(_ item: ShoppingItem) {
        items.append(item)
        persist()
    }
    
    func remove(_ item: ShoppingItem) {
        items.removeAll { $0.id == item.id }
        persist()
    }
    
    func toggleChecked(_ item: ShoppingItem) {
        if let idx = items.firstIndex(where: { $0.id == item.id }) {
            items[idx].checked.toggle()
            persist()
        }
    }
    
    func clearChecked() {
        items.removeAll { $0.checked }
        persist()
    }
    
    func clearAll() {
        items.removeAll()
        persist()
    }
    
    func addFromMealPlan(_ foods: [(name: String, qty: String?, category: ShoppingCategory)]) {
        for food in foods {
            let alreadyExists = items.contains(where: { $0.name.lowercased() == food.name.lowercased() })
            guard !alreadyExists else { continue }
            let shouldBeOrganic = BudgetSwapDatabase.dirtyDozen.contains(where: { $0.item.lowercased() == food.name.lowercased() })
            let newItem = ShoppingItem(name: food.name, quantity: food.qty, category: food.category, isOrganic: shouldBeOrganic)
            items.append(newItem)
        }
        persist()
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([ShoppingItem].self, from: data) {
            items = decoded
        }
    }
    
    private func persist() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

struct ShoppingItem: Identifiable, Codable {
    let id: String
    let name: String
    let quantity: String?
    let category: ShoppingCategory
    let isOrganic: Bool
    var checked: Bool
    
    init(name: String, quantity: String?, category: ShoppingCategory, isOrganic: Bool) {
        self.id = UUID().uuidString
        self.name = name
        self.quantity = quantity
        self.category = category
        self.isOrganic = isOrganic
        self.checked = false
    }
}

enum ShoppingCategory: String, CaseIterable, Codable {
    case produce = "Produce"
    case protein = "Protein"
    case grains = "Grains & Legumes"
    case dairy = "Dairy & Alternatives"
    case pantry = "Pantry Staples"
    case supplements = "Supplements"
    case other = "Other"
    
    var icon: String {
        switch self {
        case .produce: return "🥬"
        case .protein: return "🥩"
        case .grains: return "🌾"
        case .dairy: return "🥛"
        case .pantry: return "🏪"
        case .supplements: return "💊"
        case .other: return "📦"
        }
    }
    
    var color: Color {
        switch self {
        case .produce: return Color(hex: "#2ECC71")
        case .protein: return Color(hex: "#E74C3C")
        case .grains: return Color(hex: "#F1C40F")
        case .dairy: return Color(hex: "#3498DB")
        case .pantry: return Color(hex: "#FF6B35")
        case .supplements: return Color(hex: "#9B59B6")
        case .other: return Palette.text.muted
        }
    }
}

// ═══════════════════════════════════════════════
// MARK: - LOCAL MARKET FINDER VIEW
// ═══════════════════════════════════════════════

struct LocalMarketFinderView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var locationManager = MarketLocationManager()
    @State private var selectedCategory: MarketCategory = .all
    @State private var searchRadius: Double = 25.0 // km
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Image(systemName: "map.fill").font(.system(size: 44)).foregroundColor(Color(hex: "#2ECC71"))
                            Text("LOCAL MARKET FINDER").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(Color(hex: "#2ECC71"))
                            Text("Find Clean Food Near You").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }.padding(.top, 12)
                        
                        // Category filter
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(MarketCategory.allCases, id: \.self) { cat in
                                    Button {
                                        selectedCategory = cat
                                        locationManager.search(category: cat, radius: searchRadius)
                                        HapticManager.shared.light()
                                    } label: {
                                        HStack(spacing: 4) {
                                            Text(cat.icon)
                                            Text(cat.rawValue).font(.system(size: 11, weight: .bold))
                                        }
                                        .foregroundColor(selectedCategory == cat ? .black : Palette.text.muted)
                                        .padding(.horizontal, 14).padding(.vertical, 8)
                                        .background(Capsule().fill(selectedCategory == cat ? Color(hex: "#2ECC71") : Color.white.opacity(0.06)))
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        
                        // Map
                        if !locationManager.results.isEmpty {
                            Map {
                                ForEach(locationManager.results) { market in
                                    Annotation(market.name, coordinate: market.coordinate) {
                                        VStack(spacing: 2) {
                                            Image(systemName: "mappin.circle.fill").font(.system(size: 24)).foregroundColor(Color(hex: "#2ECC71"))
                                            Text(market.name).font(.system(size: 8, weight: .bold)).foregroundColor(Palette.text.primary)
                                                .padding(.horizontal, 4).padding(.vertical, 2)
                                                .background(Capsule().fill(Color.black.opacity(0.7)))
                                        }
                                    }
                                }
                            }
                            .frame(height: 250)
                            .cornerRadius(16)
                        }
                        
                        // Results
                        if locationManager.isSearching {
                            HStack(spacing: 10) {
                                ProgressView().tint(Color(hex: "#2ECC71"))
                                Text("Searching nearby...").font(.system(size: 13)).foregroundColor(Palette.text.muted)
                            }.padding(.top, 20)
                        } else if locationManager.results.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "location.slash.fill").font(.system(size: 36)).foregroundColor(Palette.text.muted)
                                Text("Enable location or search a category").font(.system(size: 14, weight: .medium)).foregroundColor(Palette.text.muted)
                            }.padding(.top, 30)
                        } else {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(locationManager.results.count) MARKETS FOUND").font(.system(size: 10, weight: .bold)).tracking(1.5).foregroundColor(Color(hex: "#2ECC71"))
                                
                                ForEach(locationManager.results) { market in
                                    marketCard(market)
                                }
                            }
                        }
                        
                        // Market type tips
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🧭 WHY EACH MARKET TYPE MATTERS").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(Palette.accent.gold)
                            let marketTypes: [MarketCategory] = MarketCategory.allCases.filter({ $0 != .all })
                            ForEach(marketTypes, id: \.self) { cat in
                                HStack(alignment: .top, spacing: 10) {
                                    Text(cat.icon).font(.system(size: 16))
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(cat.rawValue).font(.system(size: 13, weight: .bold)).foregroundColor(Palette.text.primary)
                                        Text(cat.whyVisit).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted).lineSpacing(2)
                                    }
                                }
                            }
                        }.padding(16).background(RoundedRectangle(cornerRadius: 16).fill(Palette.accent.gold.opacity(0.04)))
                        
                        Spacer(minLength: 100)
                    }.padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { HStack(spacing: 4) { Image(systemName: "chevron.left"); Text("Back") }.foregroundColor(Color(hex: "#2ECC71")) }
                }
                ToolbarItem(placement: .principal) {
                    Text("MARKET FINDER").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Color(hex: "#2ECC71"))
                }
            }
            .onAppear { locationManager.search(category: selectedCategory, radius: searchRadius) }
        }
    }
    
    private func marketCard(_ market: MarketResult) -> some View {
        HStack(spacing: 14) {
            ZStack {
                Circle().fill(Color(hex: "#2ECC71").opacity(0.15)).frame(width: 44, height: 44)
                Image(systemName: "storefront.fill").font(.system(size: 18)).foregroundColor(Color(hex: "#2ECC71"))
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(market.name).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                if let addr = market.address {
                    Text(addr).font(.system(size: 11)).foregroundColor(Palette.text.muted).lineLimit(1)
                }
            }
            Spacer()
            if let dist = market.distance {
                VStack(spacing: 2) {
                    Text(String(format: "%.1f", dist)).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Color(hex: "#2ECC71"))
                    Text("km").font(.system(size: 9)).foregroundColor(Palette.text.muted)
                }
            }
            Button {
                openInMaps(market)
            } label: {
                Image(systemName: "arrow.triangle.turn.up.right.circle.fill").font(.system(size: 26)).foregroundColor(Color(hex: "#3498DB"))
            }.buttonStyle(PlainButtonStyle())
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#2ECC71").opacity(0.1), lineWidth: 1)))
    }
    
    private func openInMaps(_ market: MarketResult) {
        let placemark = MKPlacemark(coordinate: market.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = market.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

// MARK: - Market Models

enum MarketCategory: String, CaseIterable {
    case all = "All"
    case healthFood = "Health Food"
    case organic = "Organic"
    case farmersMarket = "Farmers Market"
    case asian = "Asian Market"
    case mexican = "Mexican Market"
    case bulk = "Bulk Foods"
    case indian = "Indian Market"
    case middleEastern = "Middle Eastern"
    case wholefoods = "Whole Foods"
    
    var icon: String {
        switch self {
        case .all: return "🗺️"
        case .healthFood: return "🏪"
        case .organic: return "🌿"
        case .farmersMarket: return "🧑‍🌾"
        case .asian: return "🏯"
        case .mexican: return "🇲🇽"
        case .bulk: return "🪣"
        case .indian: return "🇮🇳"
        case .middleEastern: return "🧆"
        case .wholefoods: return "🍏"
        }
    }
    
    var searchTerms: [String] {
        switch self {
        case .all: return ["health food store", "organic grocery", "farmers market"]
        case .healthFood: return ["health food store", "natural foods"]
        case .organic: return ["organic grocery store", "organic market"]
        case .farmersMarket: return ["farmers market"]
        case .asian: return ["asian grocery", "asian market"]
        case .mexican: return ["mexican grocery", "latin market", "mercado"]
        case .bulk: return ["bulk food store", "bulk grocery"]
        case .indian: return ["indian grocery", "indian market"]
        case .middleEastern: return ["middle eastern grocery", "halal market"]
        case .wholefoods: return ["Whole Foods Market"]
        }
    }
    
    var whyVisit: String {
        switch self {
        case .all: return "Explore all market types near you."
        case .healthFood: return "Curated selection of clean supplements, organic staples, and hard-to-find superfoods."
        case .organic: return "Certified organic produce without the Whole Foods markup. Often locally sourced."
        case .farmersMarket: return "Direct from farm = peak freshness, highest nutrition, lowest food miles. Talk to the person who grew it."
        case .asian: return "Fermented foods (kimchi, miso, natto), fresh herbs, and whole spices at a fraction of health store prices."
        case .mexican: return "Nopales, jicama, fresh herbs, dried chiles, and traditional foods your abuela knew were medicine."
        case .bulk: return "Buy exactly what you need. Zero packaging waste. Nuts, seeds, grains, and spices at wholesale prices."
        case .indian: return "The world's best spice selection. Turmeric, ashwagandha, moringa, plus lentils and rice in bulk."
        case .middleEastern: return "Tahini, dates, sumac, za'atar, pomegranate, and the Mediterranean diet staples proven to extend life."
        case .wholefoods: return "Strict quality standards (365 Banned Ingredient list). Use the bulk section and sales to manage cost."
        }
    }
}

struct MarketResult: Identifiable {
    let id = UUID()
    let name: String
    let address: String?
    let coordinate: CLLocationCoordinate2D
    let distance: Double? // km
}

// MARK: - Location Manager for Markets

@MainActor
class MarketLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
    @Published var results: [MarketResult] = []
    @Published var isSearching = false
    
    private let locationManager = CLLocationManager()
    private var userLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        Task { @MainActor in
            self.userLocation = loc
            self.region = MKCoordinateRegion(center: loc.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
        }
    }
    
    func search(category: MarketCategory, radius: Double) {
        isSearching = true
        results = []
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = category.searchTerms.first ?? "health food store"
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            Task { @MainActor in
                guard let self = self else { return }
                self.isSearching = false
                guard let response = response else { return }
                
                var mapped: [MarketResult] = []
                for item in response.mapItems {
                    var dist: Double? = nil
                    if let userLoc = self.userLocation,
                       let itemLoc = item.placemark.location {
                        dist = itemLoc.distance(from: userLoc) / 1000.0
                    }
                    let parts: [String?] = [item.placemark.thoroughfare, item.placemark.locality, item.placemark.administrativeArea]
                    let addr: String = parts.compactMap({ $0 }).joined(separator: ", ")
                    let result = MarketResult(
                        name: item.name ?? "Unknown Market",
                        address: addr,
                        coordinate: item.placemark.coordinate,
                        distance: dist
                    )
                    mapped.append(result)
                }
                self.results = mapped.sorted(by: { ($0.distance ?? 999) < ($1.distance ?? 999) })
            }
        }
    }
}
