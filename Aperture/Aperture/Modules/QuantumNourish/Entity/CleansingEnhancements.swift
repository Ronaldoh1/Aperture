// CleansingEnhancements.swift
// FASTING MILESTONES + EWG LABELS + KILL LIST ENHANCEMENTS + REFEEDING GUIDE + MACRO TOTALS
// ☀️ SunFlow: Reignited

import SwiftUI
import UserNotifications

// ═══════════════════════════════════════════════
// MARK: - FASTING MILESTONE NOTIFICATIONS

// ═══════════════════════════════════════════════

enum FastingMilestoneManager {
  static let milestones: [FastingMilestone] = [
    FastingMilestone(
      hours: 4, title: "Digestion Complete",
      body: "Your body has finished processing your last meal. Blood sugar normalizing.",
      icon: "leaf.fill", color: "#3498DB"),
    FastingMilestone(
      hours: 8, title: "Fat Burning Begins",
      body: "Glycogen stores depleting. Your body is starting to switch to fat for fuel.",
      icon: "flame.fill", color: "#F39C12"),
    FastingMilestone(
      hours: 12, title: "Ketosis Approaching",
      body: "Growth hormone rising. Insulin dropping. Fat oxidation accelerating.",
      icon: "bolt.fill", color: "#FF6B35"),
    FastingMilestone(
      hours: 14, title: "Autophagy Initiating",
      body: "Your cells are beginning to recycle damaged proteins. Cellular cleanup has started.",
      icon: "sparkles", color: "#9B59B6"),
    FastingMilestone(
      hours: 16, title: "AUTOPHAGY ACTIVE",
      body:
        "Deep cellular cleanup underway. Damaged mitochondria being recycled. This is the magic zone.",
      icon: "eye.fill", color: "#9B59B6"),
    FastingMilestone(
      hours: 18, title: "Deep Fat Burning",
      body:
        "Significant ketone production. Your brain is now running partly on ketones. Mental clarity increasing.",
      icon: "brain.head.profile", color: "#2ECC71"),
    FastingMilestone(
      hours: 24, title: "24-HOUR WARRIOR",
      body:
        "Full day fasted. Growth hormone surging (up to 500%). Immune system beginning reset. Incredible discipline.",
      icon: "star.fill", color: "#FFD700"),
    FastingMilestone(
      hours: 36, title: "Deep Autophagy",
      body: "Autophagy at maximum. Your body is aggressively recycling damaged cells and proteins.",
      icon: "wand.and.stars", color: "#9933FF"),
    FastingMilestone(
      hours: 48, title: "Immune Reset Beginning",
      body: "Stem cell production increasing. Old immune cells being cleared. Deep healing.",
      icon: "heart.fill", color: "#E74C3C"),
    FastingMilestone(
      hours: 72, title: "IMMUNE SYSTEM REBORN",
      body:
        "Full immune regeneration (USC research). New stem cells producing fresh white blood cells. You did it. Break fast CAREFULLY.",
      icon: "crown.fill", color: "#FFD700"),
  ]

  static func scheduleMilestoneNotifications(fastStartDate: Date) {
    let center = UNUserNotificationCenter.current()

    // Remove old ones
    center.removePendingNotificationRequests(
      withIdentifiers: milestones.map { "fasting_milestone_\($0.hours)" })

    for milestone in milestones {
      let content = UNMutableNotificationContent()
      content.title = "⏳ \(milestone.title)"
      content.body = milestone.body
      content.sound = .default
      content.categoryIdentifier = "aperture_fasting"
      content.userInfo = ["hours": milestone.hours]

      let triggerDate = fastStartDate.addingTimeInterval(TimeInterval(milestone.hours * 3600))
      guard triggerDate > Date() else { continue }

      let components = Calendar.current.dateComponents(
        [.year, .month, .day, .hour, .minute, .second], from: triggerDate)
      let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

      let request = UNNotificationRequest(
        identifier: "fasting_milestone_\(milestone.hours)", content: content, trigger: trigger)
      center.add(request)
    }
  }

  static func cancelAllMilestoneNotifications() {
    UNUserNotificationCenter.current().removePendingNotificationRequests(
      withIdentifiers: milestones.map { "fasting_milestone_\($0.hours)" }
    )
  }
}

struct FastingMilestone: Identifiable {
  let id = UUID()
  let hours: Int
  let title: String
  let body: String
  let icon: String
  let color: String
}

// MARK: - Milestone Timeline View (embeddable in CleansingView)

struct FastingMilestoneTimeline: View {
  let fastStartDate: Date?
  @State private var now = Date()
  let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

  private var elapsedHours: Double {
    guard let start = fastStartDate else { return 0 }
    return now.timeIntervalSince(start) / 3600
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "flag.checkered").foregroundColor(Color(hex: "#FFD700"))
        Text("FASTING MILESTONES").font(.system(size: 10, weight: .bold)).tracking(1.5)
          .foregroundColor(Color(hex: "#FFD700"))
      }

      ForEach(FastingMilestoneManager.milestones) { milestone in
        let reached = elapsedHours >= Double(milestone.hours)
        HStack(spacing: 12) {
          // Timeline dot
          ZStack {
            Circle().fill(reached ? Color(hex: milestone.color) : Color.white.opacity(0.1)).frame(
              width: 32, height: 32)
            Image(systemName: milestone.icon).font(.system(size: 14))
              .foregroundColor(reached ? .white : Palette.text.muted)
          }

          VStack(alignment: .leading, spacing: 2) {
            HStack {
              Text("\(milestone.hours)h").font(
                .system(size: 12, weight: .bold, design: .monospaced)
              ).foregroundColor(Color(hex: milestone.color))
              Text(milestone.title).font(.system(size: 13, weight: .bold, design: .rounded))
                .foregroundColor(reached ? Palette.text.primary : Palette.text.muted)
            }
            Text(milestone.body).font(.system(size: 11, weight: .medium)).foregroundColor(
              Palette.text.muted
            ).lineLimit(2)
          }

          Spacer()

          if reached {
            Image(systemName: "checkmark.circle.fill").foregroundColor(Color(hex: milestone.color))
          }
        }
        .opacity(reached ? 1 : 0.5)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color(hex: "#FFD700").opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(hex: "#FFD700").opacity(0.12), lineWidth: 1))
    )
    .onReceive(timer) { _ in now = Date() }
  }
}

// ═══════════════════════════════════════════════
// MARK: - EWG DATA YEAR LABELS

// ═══════════════════════════════════════════════

struct EWGDataLabel: View {
  let dataYear: Int
  let source: String

  init(dataYear: Int = 2024, source: String = "EWG Dirty Dozen / Clean Fifteen") {
    self.dataYear = dataYear
    self.source = source
  }

  var body: some View {
    HStack(spacing: 6) {
      Image(systemName: "calendar.badge.clock").font(.system(size: 10)).foregroundColor(
        Palette.text.muted)
      Text("Data: \(source) (\(String(dataYear)))").font(.system(size: 9, weight: .medium))
        .foregroundColor(Palette.text.muted)
      Text("•").foregroundColor(Palette.text.muted)
      Text("Updated annually").font(.system(size: 9)).foregroundColor(Palette.text.muted)
    }
  }
}

// ═══════════════════════════════════════════════
// MARK: - KILL LIST "WHERE IT HIDES"

// ═══════════════════════════════════════════════

enum KillListWhereItHides {
  static let hidingPlaces: [KillListHidingEntry] = [
    KillListHidingEntry(
      chemical: "High Fructose Corn Syrup",
      aliases: ["HFCS", "corn sugar", "glucose-fructose syrup", "isoglucose"],
      hidesIn: [
        "Bread", "Ketchup", "Salad dressing", "Yogurt", "Granola bars", "Juice 'drinks'", "Cereal",
        "Canned fruit",
      ],
      sneakyFact:
        "The FDA let them petition to rename it 'corn sugar' in 2010. Denied, but the industry keeps trying."
    ),
    KillListHidingEntry(
      chemical: "MSG",
      aliases: [
        "Monosodium glutamate", "glutamic acid", "hydrolyzed protein", "autolyzed yeast",
        "yeast extract", "sodium caseinate",
      ],
      hidesIn: [
        "Chips", "Canned soup", "Frozen dinners", "Ranch dressing", "Ramen", "Sausage",
        "Fast food everything",
      ],
      sneakyFact:
        "'Natural flavors' and 'yeast extract' are legal ways to add MSG without listing MSG. Over 40 aliases exist."
    ),
    KillListHidingEntry(
      chemical: "Fluoride",
      aliases: ["Sodium fluoride", "fluorosilicic acid", "sodium fluorosilicate"],
      hidesIn: [
        "Tap water (70% of US)", "Toothpaste", "Non-organic tea",
        "Wine/grape juice (pesticide residue)", "Non-stick cookware",
        "Processed foods made with fluoridated water",
      ],
      sneakyFact:
        "Fluorosilicic acid (the form in your water) is an industrial waste byproduct of phosphate fertilizer production. Not pharmaceutical grade."
    ),
    KillListHidingEntry(
      chemical: "Seed Oils",
      aliases: [
        "Vegetable oil", "canola oil", "soybean oil", "sunflower oil", "safflower oil", "corn oil",
        "cottonseed oil",
      ],
      hidesIn: [
        "Restaurant food (90%+)", "Salad dressing", "Mayo", "Chips", "Crackers", "Bread",
        "Protein bars", "Roasted nuts", "Baby formula",
      ],
      sneakyFact:
        "Seed oils require industrial extraction with hexane (a neurotoxin). They didn't exist in the human diet before 1900."
    ),
    KillListHidingEntry(
      chemical: "Artificial Colors",
      aliases: ["Red 40", "Yellow 5", "Yellow 6", "Blue 1", "Red 3", "FD&C colors"],
      hidesIn: [
        "Children's cereal", "Candy", "Sports drinks", "Pickles", "Cheese (yes, cheddar)",
        "Smoked salmon", "Medications", "Pet food",
      ],
      sneakyFact:
        "Red 40 is made from petroleum. The EU requires warning labels: 'May have adverse effects on activity and attention in children.' The US requires nothing."
    ),
    KillListHidingEntry(
      chemical: "Glyphosate", aliases: ["Roundup", "N-(phosphonomethyl)glycine"],
      hidesIn: [
        "Non-organic wheat/bread", "Oats/oatmeal", "Chickpeas/hummus", "Wine", "Beer",
        "Orange juice", "Honey",
      ],
      sneakyFact:
        "Used as a desiccant (drying agent) on wheat and oats right before harvest. Highest residues are in 'health' foods like oatmeal and hummus."
    ),
    KillListHidingEntry(
      chemical: "Titanium Dioxide", aliases: ["E171", "TiO2", "CI 77891"],
      hidesIn: [
        "Supplements (white coating)", "Chewing gum", "Coffee creamer", "Candy", "Frosting",
        "Sunscreen",
      ],
      sneakyFact:
        "Banned in the EU for food use since 2022 as a nanoparticle that damages DNA. Still FDA approved in the US with no restrictions."
    ),
    KillListHidingEntry(
      chemical: "Aspartame", aliases: ["NutraSweet", "Equal", "E951", "APM"],
      hidesIn: [
        "Diet soda", "Sugar-free gum", "Light yogurt", "Crystal Light", "Some medications",
        "Children's vitamins",
      ],
      sneakyFact:
        "WHO classified aspartame as 'possibly carcinogenic' (Group 2B) in July 2023. The FDA disagreed. It was approved despite FDA scientists objecting."
    ),
  ]
}

struct KillListHidingEntry: Identifiable {
  let id = UUID()
  let chemical: String
  let aliases: [String]
  let hidesIn: [String]
  let sneakyFact: String
}

// MARK: - Kill List "Where It Hides" Card View

struct KillListHidingCard: View {
  let entry: KillListHidingEntry
  @State private var expanded = false

  var body: some View {
    Button {
      withAnimation(.spring(response: 0.4)) { expanded.toggle() }
      HapticManager.shared.light()
    } label: {
      VStack(alignment: .leading, spacing: expanded ? 14 : 0) {
        HStack {
          Image(systemName: "eye.slash.fill").font(.system(size: 18)).foregroundColor(.red)
          Text(entry.chemical).font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Spacer()
          Image(systemName: expanded ? "chevron.up" : "chevron.down").foregroundColor(
            Palette.text.muted)
        }

        if expanded {
          VStack(alignment: .leading, spacing: 12) {
            // Aliases
            VStack(alignment: .leading, spacing: 6) {
              Text("ALSO CALLED").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
                .orange)
              Text(entry.aliases.joined(separator: " • "))
                .font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted)
            }

            // Where it hides
            VStack(alignment: .leading, spacing: 6) {
              Text("WHERE IT HIDES").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(.red)
              FlowLayout(spacing: 6) {
                ForEach(entry.hidesIn, id: \.self) { place in
                  Text(place)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.red)
                    .padding(.horizontal, 8).padding(.vertical, 4)
                    .background(Capsule().fill(Color.red.opacity(0.12)))
                }
              }
            }

            // Sneaky fact
            HStack(alignment: .top, spacing: 8) {
              Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 12))
                .foregroundColor(Color(hex: "#FFD700"))
              Text(entry.sneakyFact).font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary).lineSpacing(3)
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(hex: "#FFD700").opacity(0.06)))
          }
          .transition(.opacity.combined(with: .move(edge: .top)))
        }
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14).fill(Color.red.opacity(expanded ? 0.06 : 0.03))
          .overlay(
            RoundedRectangle(cornerRadius: 14).stroke(
              Color.red.opacity(expanded ? 0.2 : 0.1), lineWidth: 1)))
    }
    .buttonStyle(PlainButtonStyle())
  }
}

// ═══════════════════════════════════════════════
// MARK: - 72-HOUR REFEEDING GUIDE

// ═══════════════════════════════════════════════

struct RefeedingGuideView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            VStack(spacing: 10) {
              Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 44))
                .foregroundColor(.red)
              Text("REFEEDING GUIDE").font(.system(size: 10, weight: .bold)).tracking(3)
                .foregroundColor(.red)
              Text("How to Break an Extended Fast Safely").font(
                .system(size: 20, weight: .bold, design: .rounded)
              ).foregroundColor(Palette.text.primary)
            }.padding(.top, 12)

            // Critical warning
            VStack(spacing: 10) {
              Text("⚠️ REFEEDING SYNDROME IS REAL AND CAN BE FATAL")
                .font(.system(size: 12, weight: .bold)).foregroundColor(.red)
                .multilineTextAlignment(.center)
              Text(
                "After extended fasting (24+ hours), your body's electrolyte balance is fragile. Eating too much too fast can cause dangerous shifts in phosphorus, potassium, and magnesium. Follow this guide carefully."
              )
              .font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary)
              .lineSpacing(3).multilineTextAlignment(.center)
            }
            .padding(16).background(
              RoundedRectangle(cornerRadius: 16).fill(Color.red.opacity(0.08))
                .overlay(
                  RoundedRectangle(cornerRadius: 16).stroke(Color.red.opacity(0.3), lineWidth: 2)))

            // Phase 1
            refeedPhase(
              phase: 1, title: "First 2 Hours — Liquids Only", color: Color(hex: "#3498DB"),
              items: [
                RefeedItem(
                  name: "Warm bone broth (homemade if possible)",
                  why: "Easily absorbed minerals without stressing the gut"),
                RefeedItem(
                  name: "Diluted fresh juice (50/50 with water)",
                  why: "Gentle glucose to ease out of ketosis"),
                RefeedItem(
                  name: "Warm water with lemon", why: "Stimulates bile production for digestion"),
                RefeedItem(
                  name: "Herbal tea (chamomile or ginger)", why: "Calms the digestive system"),
              ],
              avoid: [
                "DO NOT eat solid food yet", "DO NOT drink cold beverages", "DO NOT consume dairy",
              ])

            // Phase 2
            refeedPhase(
              phase: 2, title: "Hours 2-6 — Soft Foods", color: Color(hex: "#2ECC71"),
              items: [
                RefeedItem(
                  name: "Small portion of steamed vegetables",
                  why: "Fiber restarts peristalsis without overwhelming"),
                RefeedItem(
                  name: "Half an avocado",
                  why: "Healthy fats + potassium (electrolyte replenishment)"),
                RefeedItem(
                  name: "A few bites of ripe banana", why: "Gentle potassium and natural sugar"),
                RefeedItem(
                  name: "Small bowl of miso soup", why: "Probiotics + sodium + easy digestion"),
              ],
              avoid: [
                "No red meat yet", "No processed food", "No sugar or refined carbs", "No caffeine",
              ])

            // Phase 3
            refeedPhase(
              phase: 3, title: "Hours 6-24 — Light Meals", color: Color(hex: "#F1C40F"),
              items: [
                RefeedItem(
                  name: "Steamed fish or poached egg",
                  why: "Light protein to restart amino acid metabolism"),
                RefeedItem(
                  name: "Quinoa or sweet potato (small portion)",
                  why: "Complex carbs to gently refill glycogen"),
                RefeedItem(
                  name: "Fermented foods (sauerkraut, kimchi)",
                  why: "Rebuild gut bacteria after fasting period"),
                RefeedItem(
                  name: "Coconut water", why: "Natural electrolytes — potassium, magnesium, sodium"),
              ],
              avoid: [
                "Still avoid heavy meals", "No dairy products", "No alcohol", "No fried food",
              ])

            // Phase 4
            refeedPhase(
              phase: 4, title: "Day 2-3 — Return to Normal", color: Color(hex: "#9B59B6"),
              items: [
                RefeedItem(
                  name: "Gradually increase portion sizes",
                  why: "Your stomach has physically shrunk — respect it"),
                RefeedItem(
                  name: "Reintroduce healthy fats (olive oil, nuts)",
                  why: "Fat-soluble vitamin absorption restarts"),
                RefeedItem(
                  name: "Full meals by Day 3", why: "Digestive enzymes are fully active again"),
                RefeedItem(
                  name: "Continue prioritizing whole foods",
                  why: "Your clean slate deserves clean fuel"),
              ],
              avoid: [
                "Processed food (your body will reject it harder now)",
                "Binge eating (the #1 mistake post-fast)",
              ])

            // Warning signs
            VStack(alignment: .leading, spacing: 12) {
              HStack(spacing: 6) {
                Image(systemName: "staroflife.fill").foregroundColor(.red)
                Text("SEEK MEDICAL HELP IF:").font(.system(size: 11, weight: .bold)).tracking(1)
                  .foregroundColor(.red)
              }
              ForEach(
                [
                  "Rapid heartbeat or chest pain", "Severe muscle weakness or cramping",
                  "Confusion or disorientation", "Swelling in hands/feet (edema)",
                  "Difficulty breathing", "Seizures",
                ], id: \.self
              ) { symptom in
                HStack(spacing: 8) {
                  Image(systemName: "exclamationmark.circle.fill").font(.system(size: 10))
                    .foregroundColor(.red)
                  Text(symptom).font(.system(size: 13, weight: .medium)).foregroundColor(
                    Palette.text.primary)
                }
              }
            }.padding(16).background(
              RoundedRectangle(cornerRadius: 16).fill(Color.red.opacity(0.06))
                .overlay(
                  RoundedRectangle(cornerRadius: 16).stroke(Color.red.opacity(0.2), lineWidth: 1)))

            DisclaimerStack(types: [.medical, .fasting])

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
            }.foregroundColor(.red)
          }
        }
        ToolbarItem(placement: .principal) {
          Text("REFEEDING GUIDE").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(
            2
          ).foregroundColor(.red)
        }
      }
    }
  }

  private func refeedPhase(
    phase: Int, title: String, color: Color, items: [RefeedItem], avoid: [String]
  ) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Text("\(phase)").font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(
          .black
        )
        .frame(width: 28, height: 28).background(Circle().fill(color))
        Text(title).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(color)
      }

      ForEach(items, id: \.name) { item in
        VStack(alignment: .leading, spacing: 3) {
          HStack(spacing: 6) {
            Image(systemName: "checkmark.circle.fill").font(.system(size: 12)).foregroundColor(
              color)
            Text(item.name).font(.system(size: 13, weight: .bold)).foregroundColor(
              Palette.text.primary)
          }
          Text(item.why).font(.system(size: 11, weight: .medium)).foregroundColor(
            Palette.text.muted
          ).padding(.leading, 20)
        }
      }

      if !avoid.isEmpty {
        VStack(alignment: .leading, spacing: 4) {
          Text("AVOID:").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.red)
          ForEach(avoid, id: \.self) { item in
            HStack(spacing: 6) {
              Image(systemName: "xmark.circle").font(.system(size: 10)).foregroundColor(
                .red.opacity(0.7))
              Text(item).font(.system(size: 11, weight: .medium)).foregroundColor(.red.opacity(0.8))
            }
          }
        }
      }
    }
    .padding(16).background(
      RoundedRectangle(cornerRadius: 16).fill(color.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(color.opacity(0.15), lineWidth: 1)))
  }
}

struct RefeedItem {
  let name: String
  let why: String
}

// ═══════════════════════════════════════════════
// MARK: - MEAL PLAN MACRO SUMMARY CARD

// ═══════════════════════════════════════════════

struct MacroSummaryCard: View {
  let mealName: String
  let calories: Int
  let protein: Int  // grams
  let carbs: Int
  let fat: Int
  let fiber: Int

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("MACRO BREAKDOWN").font(.system(size: 9, weight: .bold)).tracking(1.5).foregroundColor(
          Color(hex: "#FF6B35"))
        Spacer()
        Text("\(calories) cal").font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
      }

      HStack(spacing: 8) {
        macroBar(label: "Protein", grams: protein, color: Color(hex: "#E74C3C"), total: calories)
        macroBar(label: "Carbs", grams: carbs, color: Color(hex: "#3498DB"), total: calories)
        macroBar(label: "Fat", grams: fat, color: Color(hex: "#F1C40F"), total: calories)
        macroBar(label: "Fiber", grams: fiber, color: Color(hex: "#2ECC71"), total: calories)
      }
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#FF6B35").opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 12).stroke(
            Color(hex: "#FF6B35").opacity(0.12), lineWidth: 1)))
  }

  private func macroBar(label: String, grams: Int, color: Color, total _: Int) -> some View {
    VStack(spacing: 4) {
      Text("\(grams)g").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(
        color)
      RoundedRectangle(cornerRadius: 3).fill(color)
        .frame(height: max(4, CGFloat(grams) / CGFloat(max(protein, carbs, fat, 1)) * 30))
      Text(label).font(.system(size: 8, weight: .bold)).tracking(0.5).foregroundColor(
        Palette.text.muted)
    }.frame(maxWidth: .infinity)
  }
}

// MARK: - Daily Macro Totals (aggregated across meals)

struct DailyMacroTotals: View {
  let meals: [(name: String, cal: Int, protein: Int, carbs: Int, fat: Int)]

  private var totalCal: Int {
    meals.reduce(0) { $0 + $1.cal }
  }

  private var totalProtein: Int {
    meals.reduce(0) { $0 + $1.protein }
  }

  private var totalCarbs: Int {
    meals.reduce(0) { $0 + $1.carbs }
  }

  private var totalFat: Int {
    meals.reduce(0) { $0 + $1.fat }
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("DAILY TOTALS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(
        Color(hex: "#FF6B35"))

      HStack(spacing: 0) {
        totalStat("\(totalCal)", "Calories", Color(hex: "#FF6B35"))
        divider
        totalStat("\(totalProtein)g", "Protein", Color(hex: "#E74C3C"))
        divider
        totalStat("\(totalCarbs)g", "Carbs", Color(hex: "#3498DB"))
        divider
        totalStat("\(totalFat)g", "Fat", Color(hex: "#F1C40F"))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color(hex: "#FF6B35").opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(hex: "#FF6B35").opacity(0.15), lineWidth: 1)))
  }

  private func totalStat(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value).font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(color)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(Palette.text.muted)
    }.frame(maxWidth: .infinity)
  }

  private var divider: some View {
    Rectangle().fill(Color.white.opacity(0.08)).frame(width: 1, height: 30)
  }
}
