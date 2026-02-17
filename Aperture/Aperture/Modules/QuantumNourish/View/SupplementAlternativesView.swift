// SupplementAlternativesView.swift
// SUPPLEMENT ALTERNATIVES — Replace, Don't Just Remove
// When we flag something, we give you a better option.
// ☀️ SunFlow: Reignited

import SwiftUI

struct SupplementAlternativesView: View {
  @Environment(\.dismiss) var dismiss
  @State private var selectedCategory: SupplementCategory = .all
  @State private var searchText = ""

  private var filtered: [SupplementSwap] {
    var cats: [SupplementSwap]
    if selectedCategory == .all {
      cats = SupplementSwapDatabase.swaps
    } else {
      cats = SupplementSwapDatabase.swaps.filter { $0.category == selectedCategory }
    }
    if searchText.isEmpty { return cats }
    return cats.filter {
      $0.avoid.localizedCaseInsensitiveContains(searchText)
        || $0.useInstead.localizedCaseInsensitiveContains(searchText)
    }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Header
            VStack(spacing: 10) {
              Image(systemName: "arrow.triangle.swap")
                .font(.system(size: 40)).foregroundColor(Color(hex: "#2ECC71"))
              Text("SUPPLEMENT ALTERNATIVES")
                .font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(
                  Color(hex: "#2ECC71"))
              Text("Replace, Don't Just Remove")
                .font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(
                  Palette.text.primary)
              Text(
                "Every flagged ingredient has a cleaner alternative. We don't just scare you — we give you the upgrade path."
              )
              .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary)
              .multilineTextAlignment(.center).lineSpacing(3)
            }.padding(.top, 12)

            // Search
            HStack(spacing: 10) {
              Image(systemName: "magnifyingglass").foregroundColor(
                Color(hex: "#2ECC71").opacity(0.6))
              TextField("Search supplements...", text: $searchText)
                .font(.system(size: 14)).foregroundColor(Palette.text.primary)
            }
            .padding(12).background(
              RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))

            // Category filter
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 8) {
                ForEach(SupplementCategory.allCases, id: \.self) { cat in
                  Button {
                    selectedCategory = cat
                    HapticManager.shared.light()
                  } label: {
                    Text(cat.rawValue)
                      .font(.system(size: 11, weight: .bold))
                      .foregroundColor(selectedCategory == cat ? .black : Palette.text.muted)
                      .padding(.horizontal, 14).padding(.vertical, 8)
                      .background(
                        Capsule().fill(
                          selectedCategory == cat
                            ? Color(hex: "#2ECC71") : Color.white.opacity(0.06)))
                  }.buttonStyle(PlainButtonStyle())
                }
              }
            }

            // Disclaimer
            DisclaimerStack(types: [.supplement])

            // Cards
            ForEach(filtered) { swap in
              swapCard(swap)
            }

            Spacer(minLength: 100)
          }.padding(.horizontal, 20).padding(.top, 16)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Back")
            }
            .foregroundColor(Color(hex: "#2ECC71"))
          }
        }
        ToolbarItem(placement: .principal) {
          Text("ALTERNATIVES").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2)
            .foregroundColor(Color(hex: "#2ECC71"))
        }
      }
    }
  }

  private func swapCard(_ swap: SupplementSwap) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      // AVOID
      HStack(spacing: 10) {
        Image(systemName: "xmark.circle.fill").font(.system(size: 20)).foregroundColor(.red)
        VStack(alignment: .leading, spacing: 2) {
          Text("AVOID").font(.system(size: 9, weight: .bold)).tracking(1.5).foregroundColor(.red)
          Text(swap.avoid).font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(
            Palette.text.primary)
        }
        Spacer()
        Text(swap.category.rawValue).font(.system(size: 9, weight: .bold))
          .foregroundColor(Color(hex: "#2ECC71")).padding(.horizontal, 8).padding(.vertical, 4)
          .background(Capsule().fill(Color(hex: "#2ECC71").opacity(0.12)))
      }
      Text(swap.whyAvoid).font(.system(size: 12, weight: .medium)).foregroundColor(
        Palette.text.muted
      ).lineSpacing(3)

      // Arrow
      HStack {
        Spacer()
        Image(systemName: "arrow.down.circle.fill").font(.system(size: 24)).foregroundColor(
          Color(hex: "#2ECC71"))
        Spacer()
      }

      // USE INSTEAD
      HStack(spacing: 10) {
        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(
          Color(hex: "#2ECC71"))
        VStack(alignment: .leading, spacing: 2) {
          Text("USE INSTEAD").font(.system(size: 9, weight: .bold)).tracking(1.5).foregroundColor(
            Color(hex: "#2ECC71"))
          Text(swap.useInstead).font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(Color(hex: "#2ECC71"))
        }
      }
      Text(swap.whyBetter).font(.system(size: 12, weight: .medium)).foregroundColor(
        Palette.text.secondary
      ).lineSpacing(3)

      if !swap.lookFor.isEmpty {
        VStack(alignment: .leading, spacing: 6) {
          Text("LOOK FOR ON LABEL").font(.system(size: 9, weight: .bold)).tracking(1)
            .foregroundColor(Palette.text.muted)
          HStack(spacing: 6) {
            ForEach(swap.lookFor, id: \.self) { item in
              Text(item).font(.system(size: 10, weight: .semibold)).foregroundColor(
                Color(hex: "#2ECC71")
              )
              .padding(.horizontal, 8).padding(.vertical, 4)
              .background(Capsule().fill(Color(hex: "#2ECC71").opacity(0.1)))
            }
          }
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(hex: "#2ECC71").opacity(0.12), lineWidth: 1)))
  }
}

// MARK: - Data

enum SupplementCategory: String, CaseIterable {
  case all = "All"
  case preworkout = "Pre-Workout"
  case protein = "Protein"
  case vitamins = "Vitamins"
  case minerals = "Minerals"
  case greens = "Greens"
  case recovery = "Recovery"
}

struct SupplementSwap: Identifiable {
  let id = UUID()
  let avoid: String
  let whyAvoid: String
  let useInstead: String
  let whyBetter: String
  let category: SupplementCategory
  let lookFor: [String]
}

enum SupplementSwapDatabase {
  static let swaps: [SupplementSwap] = [
    SupplementSwap(
      avoid: "Pre-Workout with Sucralose + Artificial Dyes",
      whyAvoid:
        "Most pre-workouts are loaded with sucralose (gut destroyer), Red 40 (petroleum), acesulfame K, and 'proprietary blends' that hide actual doses. You're paying for a chemical cocktail.",
      useInstead: "Creatine Monohydrate (plain) + Black Coffee",
      whyBetter:
        "Creatine mono is the most researched supplement in history — 5g/day, zero additives needed. Pair with organic black coffee for caffeine. Clean, effective, transparent.",
      category: .preworkout, lookFor: ["Creapure®", "100% creatine monohydrate"]),
    SupplementSwap(
      avoid: "Whey Protein with Artificial Sweeteners",
      whyAvoid:
        "Most commercial whey contains sucralose, ace-K, artificial flavors, soy lecithin, and sometimes heavy metals. 'Natural flavors' is an FDA loophole hiding 100+ possible chemicals.",
      useInstead: "Grass-Fed Whey Isolate or Plant Protein (Pea + Rice)",
      whyBetter:
        "Grass-fed whey isolate has higher bioavailability, lower lactose, and no hormones. Or go plant-based with pea+rice blend for complete amino profile. Sweeten with stevia leaf or monk fruit.",
      category: .protein, lookFor: ["Grass-fed", "Cold-processed", "No artificial"]),
    SupplementSwap(
      avoid: "Synthetic Vitamin D (D2 / Ergocalciferol)",
      whyAvoid:
        "D2 is the cheap synthetic form. Your body converts it poorly compared to D3. Most budget supplements use D2 and pair it with questionable fillers.",
      useInstead: "Vitamin D3 (Cholecalciferol) with K2 (MK-7)",
      whyBetter:
        "D3 is the natural form your skin makes from sun. K2 ensures calcium goes to bones, not arteries. Take with fat for absorption. 5000 IU daily for most adults.",
      category: .vitamins, lookFor: ["D3", "Cholecalciferol", "K2 MK-7"]),
    SupplementSwap(
      avoid: "Magnesium Oxide",
      whyAvoid:
        "4% bioavailability — you're basically paying for expensive laxative. Your body can barely absorb it. Found in most cheap multivitamins.",
      useInstead: "Magnesium Glycinate or Threonate",
      whyBetter:
        "Glycinate: 80%+ absorption, calming, great for sleep and muscle recovery. Threonate (Magtein®): crosses blood-brain barrier, supports cognitive function. Take 400mg before bed.",
      category: .minerals, lookFor: ["Glycinate", "Bisglycinate", "Threonate"]),
    SupplementSwap(
      avoid: "Greens Powder with Proprietary Blends",
      whyAvoid:
        "If you see 'Green Blend 5000mg' with 30 ingredients listed, each ingredient could be dust-level doses. You're paying for label decoration.",
      useInstead: "Spirulina + Chlorella (standalone)",
      whyBetter:
        "Buy them separately with verified amounts. 3g spirulina + 2g chlorella daily. Heavy metal tested. More effective than any proprietary blend at 1/3 the price.",
      category: .greens, lookFor: ["Organic", "Heavy metal tested", "Broken cell wall"]),
    SupplementSwap(
      avoid: "Fish Oil (generic, not tested)",
      whyAvoid:
        "Cheap fish oil oxidizes fast, may contain mercury and PCBs, and often uses ethyl ester form (poor absorption). Fishy burps = rancid oil.",
      useInstead: "Algae-Based Omega-3 (DHA + EPA)",
      whyBetter:
        "Vegan source. No mercury risk. No ocean ecosystem damage. Triglyceride form absorbs better. Fish get their omega-3 from algae anyway — cut out the middlefish.",
      category: .recovery, lookFor: ["Algae-derived", "Triglyceride form", "Third-party tested"]),
    SupplementSwap(
      avoid: "BCAA Supplements",
      whyAvoid:
        "BCAAs alone are mostly useless if you eat adequate protein. Often loaded with artificial colors and sucralose. The research showing benefits was funded by supplement companies.",
      useInstead: "Essential Amino Acids (EAAs) or Whole Food Protein",
      whyBetter:
        "EAAs include all 9 essential aminos (BCAAs are only 3). But honestly? Eat 0.8-1g protein per pound of bodyweight from real food and you need neither.",
      category: .recovery, lookFor: ["All 9 EAAs", "Fermented", "No artificial"]),
    SupplementSwap(
      avoid: "Centrum / One A Day Multivitamins",
      whyAvoid:
        "Cheap synthetic forms of every vitamin, magnesium oxide, iron that blocks other mineral absorption, artificial colors, titanium dioxide coating. A multivitamin that makes you feel nothing.",
      useInstead: "Food-Based Multivitamin or Targeted Supplementation",
      whyBetter:
        "If you eat well, you may only need D3+K2, Magnesium, and Omega-3. If you want a multi, choose food-based (whole food sourced) with methylated B vitamins (methylfolate, methylcobalamin).",
      category: .vitamins, lookFor: ["Methylfolate", "Methylcobalamin", "Food-based"]),
  ]
}
