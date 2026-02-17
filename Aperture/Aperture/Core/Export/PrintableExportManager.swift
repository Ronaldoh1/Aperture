// PrintableExportManager.swift
// PRINTABLE EXPORTS — Knowledge that sticks (to your fridge)
// ☀️ SunFlow: Reignited
//
// One-tap PDF generation for:
// - Kill List (top toxins to avoid)
// - Grocery Swap Cheat Sheet (bad → good alternatives)
// - Budget Shopping Guide
// - Any course summary
//
// Designed for rural users, offline families, and
// anyone who learns better with paper on the fridge.

import PDFKit
import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// EXPORT TYPES
// ═══════════════════════════════════════════════════════════

enum PrintableExportType: String, CaseIterable, Identifiable {
  case killList = "Kill List"
  case grocerySwaps = "Grocery Swaps"
  case budgetGuide = "Budget Shopping Guide"
  case hygieneProtocol = "Digital Hygiene Protocol"
  case courseNotes = "Course Notes"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .killList: return "exclamationmark.triangle.fill"
    case .grocerySwaps: return "arrow.triangle.2.circlepath"
    case .budgetGuide: return "dollarsign.circle.fill"
    case .hygieneProtocol: return "shield.checkered"
    case .courseNotes: return "book.fill"
    }
  }

  var color: Color {
    switch self {
    case .killList: return .red
    case .grocerySwaps: return .green
    case .budgetGuide: return .orange
    case .hygieneProtocol: return .cyan
    case .courseNotes: return .purple
    }
  }

  var subtitle: String {
    switch self {
    case .killList: return "Top toxins to avoid — put it on the fridge"
    case .grocerySwaps: return "Bad → Good alternatives for your shopping list"
    case .budgetGuide: return "Clean eating on a budget — the cheat sheet"
    case .hygieneProtocol: return "Your daily digital hygiene protocol"
    case .courseNotes: return "Key insights from your courses"
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// PDF GENERATOR
// ═══════════════════════════════════════════════════════════

@MainActor
class PrintableExportManager: ObservableObject {
  static let shared = PrintableExportManager()

  @Published var isGenerating = false
  @Published var generatedURL: URL? = nil

  func generatePDF(type: PrintableExportType, customData: [String: Any]? = nil) -> URL? {
    isGenerating = true
    defer { isGenerating = false }

    let pageWidth: CGFloat = 612  // Letter
    let pageHeight: CGFloat = 792
    let margin: CGFloat = 40
    let contentWidth = pageWidth - margin * 2

    let renderer = UIGraphicsPDFRenderer(
      bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight))

    let data = renderer.pdfData { context in
      context.beginPage()
      var y: CGFloat = margin

      switch type {
      case .killList:
        y = drawKillList(
          context: context, y: y, margin: margin, width: contentWidth, pageWidth: pageWidth,
          pageHeight: pageHeight)
      case .grocerySwaps:
        y = drawGrocerySwaps(
          context: context, y: y, margin: margin, width: contentWidth, pageWidth: pageWidth,
          pageHeight: pageHeight)
      case .budgetGuide:
        y = drawBudgetGuide(
          context: context, y: y, margin: margin, width: contentWidth, pageWidth: pageWidth,
          pageHeight: pageHeight)
      case .hygieneProtocol:
        y = drawHygieneProtocol(
          context: context, y: y, margin: margin, width: contentWidth, pageWidth: pageWidth,
          pageHeight: pageHeight)
      case .courseNotes:
        y = drawCourseNotes(
          context: context, y: y, margin: margin, width: contentWidth, pageWidth: pageWidth,
          pageHeight: pageHeight, data: customData)
      }

      // Footer
      let footer = "☀️ SunFlow: Reignited — aperture.app"
      let footerAttrs: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 8, weight: .medium),
        .foregroundColor: UIColor.gray,
      ]
      (footer as NSString).draw(
        at: CGPoint(x: margin, y: pageHeight - 25), withAttributes: footerAttrs)
    }

    let filename =
      "\(type.rawValue.replacingOccurrences(of: " ", with: "_"))_\(Date().timeIntervalSince1970).pdf"
    let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)

    do {
      try data.write(to: url)
      generatedURL = url
      return url
    } catch {
      return nil
    }
  }

  // MARK: - Kill List PDF

  private func drawKillList(
    context: UIGraphicsPDFRendererContext, y: CGFloat, margin: CGFloat, width: CGFloat,
    pageWidth _: CGFloat, pageHeight: CGFloat
  ) -> CGFloat {
    var y = y

    // Title
    let titleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 24, weight: .black), .foregroundColor: UIColor.red,
    ]
    ("⚠️ THE KILL LIST" as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: titleAttrs)
    y += 35

    let subtitleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 11, weight: .medium), .foregroundColor: UIColor.darkGray,
    ]
    ("Ingredients to AVOID — Put this on your fridge" as NSString).draw(
      at: CGPoint(x: margin, y: y), withAttributes: subtitleAttrs)
    y += 25

    // Line
    context.cgContext.setStrokeColor(UIColor.red.cgColor)
    context.cgContext.setLineWidth(2)
    context.cgContext.move(to: CGPoint(x: margin, y: y))
    context.cgContext.addLine(to: CGPoint(x: margin + width, y: y))
    context.cgContext.strokePath()
    y += 15

    let killItems: [(name: String, why: String)] = [
      (
        "High Fructose Corn Syrup",
        "Liver damage, obesity, insulin resistance. In 80%+ of processed foods."
      ),
      (
        "Aspartame (NutraSweet, Equal)",
        "Neurotoxin. Headaches, mood disorders, linked to cancer in studies."
      ),
      (
        "Sodium Nitrite/Nitrate",
        "Preservative in processed meats. Converts to carcinogenic nitrosamines."
      ),
      ("BHT / BHA", "Preservatives banned in many countries. Endocrine disruptors."),
      ("Titanium Dioxide", "Nanoparticle in candy, gum. Damages gut lining. Banned in EU."),
      (
        "Red 40 / Yellow 5 / Yellow 6",
        "Petroleum-based dyes. Hyperactivity in children. Banned in EU for kids."
      ),
      (
        "Potassium Bromate",
        "In bread/flour. Carcinogen. Banned in EU, Canada, Brazil. Legal in US."
      ),
      ("Carrageenan", "In milk alternatives. Triggers inflammation, GI issues."),
      ("Sodium Benzoate", "Preservative. Forms benzene (carcinogen) when combined with Vitamin C."),
      (
        "Partially Hydrogenated Oils",
        "Trans fats. Heart disease, inflammation. 'Banned' but still in foods under 0.5g."
      ),
      (
        "MSG (Monosodium Glutamate)",
        "Excitotoxin. Headaches, obesity link. Hidden under 40+ names."
      ),
      ("Propylparaben", "Preservative. Endocrine disruptor. Mimics estrogen."),
      (
        "Acesulfame Potassium (Ace-K)",
        "Artificial sweetener. Poorly tested. May affect prenatal development."
      ),
      ("TBHQ", "Preservative in fast food. Immune system damage at higher doses."),
      (
        "Brominated Vegetable Oil (BVO)",
        "In citrus drinks. Accumulates in tissue. Thyroid damage. Banned in EU."
      ),
    ]

    let nameAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12, weight: .bold), .foregroundColor: UIColor.black,
    ]
    let whyAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 9, weight: .regular), .foregroundColor: UIColor.darkGray,
    ]

    for item in killItems {
      if y > pageHeight - 60 {
        context.beginPage()
        y = margin
      }
      ("❌ " + item.name as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: nameAttrs)
      y += 16
      let whyRect = CGRect(x: margin + 18, y: y, width: width - 18, height: 30)
      (item.why as NSString).draw(in: whyRect, withAttributes: whyAttrs)
      y += 28
    }

    y += 15
    let tipAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .bold), .foregroundColor: UIColor.red,
    ]
    ("TIP: If you can't pronounce it, your body probably can't process it." as NSString).draw(
      at: CGPoint(x: margin, y: y), withAttributes: tipAttrs)

    return y
  }

  // MARK: - Grocery Swaps PDF

  private func drawGrocerySwaps(
    context: UIGraphicsPDFRendererContext, y: CGFloat, margin: CGFloat, width: CGFloat,
    pageWidth _: CGFloat, pageHeight: CGFloat
  ) -> CGFloat {
    var y = y

    let titleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 22, weight: .black),
      .foregroundColor: UIColor(red: 0.1, green: 0.6, blue: 0.3, alpha: 1),
    ]
    ("🔄 GROCERY SWAP GUIDE" as NSString).draw(
      at: CGPoint(x: margin, y: y), withAttributes: titleAttrs)
    y += 30

    ("Stop buying this → Start buying this" as NSString).draw(
      at: CGPoint(x: margin, y: y),
      withAttributes: [
        .font: UIFont.systemFont(ofSize: 11, weight: .medium), .foregroundColor: UIColor.darkGray,
      ])
    y += 25

    let swaps: [(bad: String, good: String, why: String)] = [
      (
        "Regular peanut butter (Jif, Skippy)", "Single-ingredient peanut butter",
        "No added sugar, palm oil, or hydrogenated oils"
      ),
      (
        "White bread", "Sprouted grain bread (Ezekiel)",
        "Living grains, no processed flour, higher protein"
      ),
      (
        "Canola / Vegetable oil", "Extra virgin olive oil or avocado oil",
        "No seed oil inflammation. Real fats your body needs"
      ),
      ("Regular eggs", "Pasture-raised eggs", "5x more omega-3, higher vitamin D, E, and A"),
      (
        "Fruit juice", "Whole fruit + water",
        "Juice = sugar without fiber. Whole fruit = complete nutrition"
      ),
      (
        "Flavored yogurt", "Plain Greek yogurt + honey",
        "Skip 25g added sugar. Add your own sweetness"
      ),
      (
        "Regular milk", "Organic whole milk or oat milk",
        "No rBGH hormones, antibiotics, or pus cell allowances"
      ),
      (
        "Instant oatmeal packets", "Steel-cut or rolled oats",
        "No added sugar, artificial flavors. Cheaper per serving"
      ),
      (
        "Deli meat", "Fresh roasted chicken/turkey",
        "No nitrites, nitrates, or sodium preservative bombs"
      ),
      (
        "Gatorade / sports drinks", "Coconut water or LMNT",
        "Real electrolytes without Red 40 and 34g sugar"
      ),
      (
        "Boxed mac & cheese", "Real cheese + whole grain pasta",
        "No Yellow 5, phthalates, or preservatives"
      ),
      (
        "Margarine", "Real butter (grass-fed)",
        "Your body knows what butter is. It has no idea what margarine is"
      ),
    ]

    let badAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .bold), .foregroundColor: UIColor.red,
      .strikethroughStyle: NSUnderlineStyle.single.rawValue,
    ]
    let arrowAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12, weight: .black),
      .foregroundColor: UIColor(red: 0.1, green: 0.6, blue: 0.3, alpha: 1),
    ]
    let goodAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .bold),
      .foregroundColor: UIColor(red: 0.1, green: 0.6, blue: 0.3, alpha: 1),
    ]
    let whyAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 8, weight: .regular), .foregroundColor: UIColor.gray,
    ]

    for swap in swaps {
      if y > pageHeight - 60 {
        context.beginPage()
        y = margin
      }
      (swap.bad as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: badAttrs)
      ("→" as NSString).draw(
        at: CGPoint(x: margin + width * 0.48, y: y - 1), withAttributes: arrowAttrs)
      (swap.good as NSString).draw(
        at: CGPoint(x: margin + width * 0.52, y: y), withAttributes: goodAttrs)
      y += 14
      (swap.why as NSString).draw(at: CGPoint(x: margin + 8, y: y), withAttributes: whyAttrs)
      y += 18
    }

    return y
  }

  // MARK: - Budget Guide PDF

  private func drawBudgetGuide(
    context: UIGraphicsPDFRendererContext, y: CGFloat, margin: CGFloat, width: CGFloat,
    pageWidth _: CGFloat, pageHeight: CGFloat
  ) -> CGFloat {
    var y = y

    let titleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 22, weight: .black), .foregroundColor: UIColor.orange,
    ]
    ("💰 CLEAN EATING ON A BUDGET" as NSString).draw(
      at: CGPoint(x: margin, y: y), withAttributes: titleAttrs)
    y += 35

    let rules: [(rule: String, detail: String)] = [
      (
        "1. Switch the Dirty Dozen FIRST",
        "These 12 fruits/veggies have the most pesticides. Buy organic ONLY for these. Save money buying conventional for the Clean 15."
      ),
      (
        "2. Buy store brand, not name brand",
        "Store brand organic is 20-40% cheaper. Same product, different label."
      ),
      (
        "3. Frozen > Fresh (sometimes)",
        "Frozen organic vegetables are flash-frozen at peak nutrition. Cheaper, last longer, less waste."
      ),
      (
        "4. Buy in bulk: rice, beans, oats",
        "These are the cheapest clean calories on Earth. A 25lb bag of rice is ~$15 and lasts months."
      ),
      (
        "5. Drink water, not beverages",
        "The average American spends $1,000+/year on beverages. Water is free (or pennies filtered)."
      ),
      (
        "6. Cook once, eat 3 times",
        "Sunday meal prep saves time AND money. One chicken = dinner + lunch + bone broth."
      ),
      (
        "7. Grow something — anything",
        "Even a windowsill herb garden saves $5-10/week. A small garden bed saves $50+/month."
      ),
      (
        "8. Shop the perimeter",
        "Outside aisles = real food. Inside aisles = processed. Your cart should be 80% perimeter."
      ),
      (
        "9. Never shop hungry",
        "Hungry shopping increases spending 25%+. Eat before you go. Bring a list. Stick to it."
      ),
      (
        "10. Check the Aperture Kill List",
        "If it's on the Kill List, don't buy it at ANY price. Cheap poison is still poison."
      ),
    ]

    let ruleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 11, weight: .bold), .foregroundColor: UIColor.black,
    ]
    let detailAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 9, weight: .regular), .foregroundColor: UIColor.darkGray,
    ]

    for rule in rules {
      if y > pageHeight - 60 {
        context.beginPage()
        y = margin
      }
      (rule.rule as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: ruleAttrs)
      y += 15
      let rect = CGRect(x: margin + 12, y: y, width: width - 12, height: 30)
      (rule.detail as NSString).draw(in: rect, withAttributes: detailAttrs)
      y += 30
    }

    return y
  }

  // MARK: - Hygiene Protocol PDF

  private func drawHygieneProtocol(
    context: UIGraphicsPDFRendererContext, y: CGFloat, margin: CGFloat, width _: CGFloat,
    pageWidth _: CGFloat, pageHeight: CGFloat
  ) -> CGFloat {
    var y = y

    let titleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 22, weight: .black),
      .foregroundColor: UIColor(red: 0, green: 0.7, blue: 0.8, alpha: 1),
    ]
    ("🛡️ DIGITAL HYGIENE PROTOCOL" as NSString).draw(
      at: CGPoint(x: margin, y: y), withAttributes: titleAttrs)
    y += 35

    let levels: [(level: String, rules: [String])] = [
      (
        "LEVEL 1 — AWARENESS",
        [
          "Turn on Screen Time tracking",
          "Write down your daily average (be honest)",
          "Identify your top 3 time-sink apps",
          "Notice what triggers you to open social media",
          "No changes yet — just observe for 7 days",
        ]
      ),
      (
        "LEVEL 2 — REDUCTION",
        [
          "Move social apps off home screen",
          "Turn off ALL social media push notifications",
          "Set Screen Time limit: 2.5 hours combined",
          "Unfollow 10 accounts that trigger negative emotions",
          "Replace one scroll session with 10 min of something real",
        ]
      ),
      (
        "LEVEL 3 — INTENTIONAL",
        [
          "Check social media only 3x per day",
          "Set a timer before each session",
          "Unfollow all outrage and drama accounts",
          "Follow accounts that teach, not react",
          "Ask before posting: sharing or performing?",
        ]
      ),
    ]

    let levelAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12, weight: .black),
      .foregroundColor: UIColor(red: 0, green: 0.5, blue: 0.6, alpha: 1),
    ]
    let stepAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .medium), .foregroundColor: UIColor.black,
    ]

    for level in levels {
      if y > pageHeight - 100 {
        context.beginPage()
        y = margin
      }
      (level.level as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: levelAttrs)
      y += 18
      for step in level.rules {
        ("☐ " + step as NSString).draw(at: CGPoint(x: margin + 12, y: y), withAttributes: stepAttrs)
        y += 16
      }
      y += 10
    }

    return y
  }

  // MARK: - Course Notes PDF

  private func drawCourseNotes(
    context: UIGraphicsPDFRendererContext, y: CGFloat, margin: CGFloat, width: CGFloat,
    pageWidth _: CGFloat, pageHeight: CGFloat, data: [String: Any]?
  ) -> CGFloat {
    var y = y

    let title = data?["title"] as? String ?? "Course Notes"
    let notes = data?["notes"] as? [String] ?? ["No notes saved yet."]

    let titleAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 22, weight: .black), .foregroundColor: UIColor.purple,
    ]
    ("📚 \(title)" as NSString).draw(at: CGPoint(x: margin, y: y), withAttributes: titleAttrs)
    y += 35

    let noteAttrs: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 11, weight: .medium), .foregroundColor: UIColor.black,
    ]

    for note in notes {
      if y > pageHeight - 60 {
        context.beginPage()
        y = margin
      }
      let rect = CGRect(x: margin, y: y, width: width, height: 50)
      ("• " + note as NSString).draw(in: rect, withAttributes: noteAttrs)
      y += 35
    }

    return y
  }
}

// MARK: - ═══════════════════════════════════════════════════

// EXPORT VIEW
// ═══════════════════════════════════════════════════════════

struct PrintableExportView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var exporter = PrintableExportManager.shared
  @State private var showShare = false
  @State private var shareURL: URL? = nil

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 12) {
            Text("PRINT & SHARE").font(.system(size: 10, weight: .bold)).tracking(3)
              .foregroundColor(.cyan.opacity(0.4))
            Text("One-Tap PDF Exports").font(.system(size: 20, weight: .bold)).foregroundColor(
              .white)
            Text("Print it. Stick it on the fridge.\nShare it with family.")
              .font(.system(size: 12)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(
                .center)

            ForEach(PrintableExportType.allCases) { type in
              Button {
                if let url = exporter.generatePDF(type: type) {
                  shareURL = url
                  showShare = true
                }
              } label: {
                HStack(spacing: 12) {
                  Image(systemName: type.icon).font(.system(size: 18)).foregroundColor(type.color)
                    .frame(width: 28)
                  VStack(alignment: .leading, spacing: 2) {
                    Text(type.rawValue).font(.system(size: 14, weight: .bold)).foregroundColor(
                      .white)
                    Text(type.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(
                      .white.opacity(0.4))
                  }
                  Spacer()
                  Image(systemName: "arrow.down.doc.fill").foregroundColor(type.color.opacity(0.5))
                }
                .padding(14)
                .background(
                  RoundedRectangle(cornerRadius: 14).fill(type.color.opacity(0.04))
                    .overlay(
                      RoundedRectangle(cornerRadius: 14).stroke(
                        type.color.opacity(0.1), lineWidth: 1)))
              }
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Printable Exports")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
      .sheet(isPresented: $showShare) {
        if let url = shareURL {
          ShareSheet(activityItems: [url])
        }
      }
    }
  }
}

// MARK: - Share Sheet

struct ShareSheet: UIViewControllerRepresentable {
  let activityItems: [Any]
  func makeUIViewController(context _: Context) -> UIActivityViewController {
    UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
  }

  func updateUIViewController(_: UIActivityViewController, context _: Context) {}
}
