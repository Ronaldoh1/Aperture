// DailyCheckInSheet.swift

import SwiftUI

struct DailyCheckInSheet: View {
    let onSave: (DailyCheckIn) -> Void
    let onDismiss: () -> Void
    
    @State private var unconsciousnessMoment: String = ""
    @State private var emotionalIntensity: Double = 5
    @State private var selectedCategory: DailyCheckIn.UnconsciousnessCategory = .reactivity
    @State private var insight: String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Text("Daily Check-In").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                    Spacer()
                    Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) }
                }
                .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("🌅 WHERE DID I GO UNCONSCIOUS TODAY?").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.accent.gold)
                            Text("Describe a moment when you lost awareness and reacted automatically.").font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(Palette.text.secondary).lineSpacing(4)
                        }
                        
                        ZStack(alignment: .topLeading) {
                            if unconsciousnessMoment.isEmpty {
                                Text("e.g., I got triggered by a comment and snapped...").font(.system(size: 15, weight: .regular, design: .rounded)).foregroundColor(Palette.text.muted).padding(.top, 12).padding(.leading, 12)
                            }
                            TextEditor(text: $unconsciousnessMoment).font(.system(size: 15, weight: .regular, design: .rounded)).foregroundColor(Palette.text.primary).scrollContentBackground(.hidden).frame(minHeight: 120)
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("CATEGORY").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(DailyCheckIn.UnconsciousnessCategory.allCases, id: \.self) { category in
                                    Button { selectedCategory = category } label: {
                                        HStack(spacing: 8) {
                                            Image(systemName: category.icon).font(.system(size: 14, weight: .semibold))
                                            Text(category.rawValue).font(.system(size: 12, weight: .semibold, design: .rounded))
                                        }
                                        .foregroundColor(selectedCategory == category ? .black : category.color)
                                        .padding(.horizontal, 12).padding(.vertical, 10).frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(selectedCategory == category ? category.color : category.color.opacity(0.15)))
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            Text(selectedCategory.description).font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(selectedCategory.color.opacity(0.9)).padding(12).background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(selectedCategory.color.opacity(0.1)))
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("EMOTIONAL INTENSITY").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                                Spacer()
                                Text("\(Int(emotionalIntensity))/10").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(intensityColor)
                            }
                            Slider(value: $emotionalIntensity, in: 1...10, step: 1).accentColor(intensityColor)
                            HStack {
                                Text("Mild").font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
                                Spacer()
                                Text("Intense").font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("INSIGHT (OPTIONAL)").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                            ZStack(alignment: .topLeading) {
                                if insight.isEmpty { Text("Any realization or pattern...").font(.system(size: 14)).foregroundColor(Palette.text.muted).padding(.top, 12).padding(.leading, 12) }
                                TextEditor(text: $insight).font(.system(size: 14)).foregroundColor(Palette.text.primary).scrollContentBackground(.hidden).frame(minHeight: 80)
                            }
                            .padding(8).background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color.white.opacity(0.05)))
                        }
                        
                        Button { saveCheckIn() } label: {
                            HStack { Image(systemName: "checkmark.circle.fill"); Text("Save Check-In").font(.system(size: 16, weight: .bold, design: .rounded)) }
                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16)
                            .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(LinearGradient(colors: [Palette.accent.gold, Palette.primary.orange], startPoint: .leading, endPoint: .trailing)))
                        }
                        .disabled(unconsciousnessMoment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        .opacity(unconsciousnessMoment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var intensityColor: Color {
        switch Int(emotionalIntensity) {
        case 1...3: return Color.green
        case 4...6: return Color.yellow
        case 7...8: return Palette.primary.orange
        default: return Palette.primary.red
        }
    }
    
    private func saveCheckIn() {
        let checkIn = DailyCheckIn(
            unconsciousnessMoment: unconsciousnessMoment.trimmingCharacters(in: .whitespacesAndNewlines),
            emotionalIntensity: Int(emotionalIntensity),
            category: selectedCategory,
            insight: insight.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : insight.trimmingCharacters(in: .whitespacesAndNewlines)
        )
        HapticManager.shared.success()
        onSave(checkIn)
    }
}
