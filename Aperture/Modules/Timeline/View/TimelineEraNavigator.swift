// TimelineEraNavigator.swift
// Cosmos-style tap-to-jump navigation for Timeline
// Replaces endless scrolling with tappable era chips + mini map
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Era Category Chip Bar (Horizontal Scroll)

struct TimelineEraCategoryBar: View {
    
    let categories: [EraCategory]
    @Binding var selectedCategory: EraCategory?
    let onCategoryTap: (EraCategory) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                // "All" chip
                eraCategoryChip(
                    label: "All Eras",
                    icon: "clock.arrow.circlepath",
                    color: Palette.accent.gold,
                    isSelected: selectedCategory == nil
                ) {
                    selectedCategory = nil
                }
                
                ForEach(categories, id: \.self) { cat in
                    eraCategoryChip(
                        label: cat.shortLabel,
                        icon: cat.chipIcon,
                        color: cat.chipColor,
                        isSelected: selectedCategory == cat
                    ) {
                        selectedCategory = cat
                        onCategoryTap(cat)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
    private func eraCategoryChip(label: String, icon: String, color: Color, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: {
            HapticManager.shared.light()
            action()
        }) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 10, weight: .semibold))
                Text(label)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
            }
            .foregroundColor(isSelected ? .black : color)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(
                Capsule()
                    .fill(isSelected ? color : color.opacity(0.12))
            )
            .overlay(
                Capsule()
                    .stroke(color.opacity(isSelected ? 0 : 0.3), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Timeline Mini Map (Right Rail — Cosmos pattern)

struct TimelineMiniMap: View {
    
    let eras: [TimelineEra]
    let currentEraIndex: Int
    let avatarManager: TimelineAvatarManager
    let onEraTap: (Int) -> Void
    
    private var uniqueCategories: [EraCategory] {
        var seen = Set<String>()
        var result: [EraCategory] = []
        for era in eras {
            if !seen.contains(era.category.rawValue) {
                seen.insert(era.category.rawValue)
                result.append(era.category)
            }
        }
        return result
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            VStack(spacing: 6) {
                Text("MAP")
                    .font(.system(size: 8, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Palette.text.muted)
                
                // Category dots
                ForEach(Array(uniqueCategories.enumerated()), id: \.element) { catIndex, category in
                    let eraIndex: Int = eras.firstIndex(where: { $0.category == category }) ?? 0
                    let isActive: Bool = eras[safe: currentEraIndex]?.category == category
                    
                    Button(action: {
                        HapticManager.shared.light()
                        onEraTap(eraIndex)
                    }) {
                        VStack(spacing: 2) {
                            ZStack {
                                if isActive {
                                    Circle()
                                        .stroke(category.chipColor, lineWidth: 1.5)
                                        .frame(width: 14, height: 14)
                                }
                                Circle()
                                    .fill(isActive ? category.chipColor : category.chipColor.opacity(0.4))
                                    .frame(width: isActive ? 10 : 7, height: isActive ? 10 : 7)
                            }
                            .frame(width: 16, height: 16)
                            
                            Text(category.miniLabel)
                                .font(.system(size: 6, weight: .medium))
                                .foregroundColor(isActive ? category.chipColor : Palette.text.muted)
                                .lineLimit(1)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Avatar "You Are Here" indicator
                VStack(spacing: 3) {
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 6)
                    
                    TimelineAvatarBadge(manager: avatarManager, size: 22)
                    
                    Text("YOU")
                        .font(.system(size: 6, weight: .bold))
                        .foregroundColor(Palette.accent.gold)
                }
                .padding(.top, 4)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 6)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.black.opacity(0.6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )
            
            Spacer()
        }
        .padding(.trailing, 6)
    }
}

// MARK: - Avatar "You Are Here" Indicator (replaces plain text)

struct TimelineYouAreHereIndicator: View {
    
    let era: TimelineEra?
    let avatarManager: TimelineAvatarManager
    
    var body: some View {
        ZStack {
            // Glow halo
            Circle()
                .fill(Palette.accent.gold.opacity(0.18))
                .frame(width: 44, height: 44)
                .blur(radius: 4)

            TimelineAvatarBadge(manager: avatarManager, size: 32)

            // Arrow pointing right
            Image(systemName: "arrowtriangle.right.fill")
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(Palette.accent.gold)
                .shadow(color: Palette.accent.gold.opacity(0.8), radius: 3)
                .offset(x: 22)
        }
    }
}

// MARK: - Avatar Badge (reusable circle)

struct TimelineAvatarBadge: View {
    
    @ObservedObject var manager: TimelineAvatarManager
    let size: CGFloat
    
    var body: some View {
        ZStack {
            if let imageData = manager.avatarImageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Palette.accent.gold, lineWidth: 1.5))
            } else if let preset = manager.selectedPreset {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: preset.gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: size, height: size)
                    .overlay(
                        Text(preset.emoji)
                            .font(.system(size: size * 0.5))
                    )
                    .overlay(Circle().stroke(Palette.accent.gold, lineWidth: 1.5))
            } else {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Palette.accent.gold.opacity(0.3), Palette.primary.cyan.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: size, height: size)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: size * 0.4))
                            .foregroundColor(Palette.accent.gold)
                    )
                    .overlay(Circle().stroke(Palette.accent.gold.opacity(0.5), lineWidth: 1))
            }
        }
    }
}

// MARK: - EraCategory Extensions for Navigation

extension EraCategory {
    
    var shortLabel: String {
        switch self {
        case .modern: return "Modern"
        case .twentieth: return "20th C"
        case .industrial: return "Industrial"
        case .colonial: return "Colonial"
        case .religiousSuppression: return "Suppression"
        case .sunGodErasure: return "Sun Gods"
        case .roman: return "Rome"
        case .ancient: return "Ancient"
        case .gnostic: return "Gnostic"
        case .hiddenHistory: return "Hidden"
        case .governmentDeception: return "Gov't"
        }
    }
    
    var miniLabel: String {
        switch self {
        case .modern: return "NOW"
        case .twentieth: return "20C"
        case .industrial: return "IND"
        case .colonial: return "COL"
        case .religiousSuppression: return "SUP"
        case .sunGodErasure: return "SUN"
        case .roman: return "ROM"
        case .ancient: return "ANC"
        case .gnostic: return "GNO"
        case .hiddenHistory: return "HID"
        case .governmentDeception: return "GOV"
        }
    }
    
    var chipIcon: String {
        switch self {
        case .modern: return "antenna.radiowaves.left.and.right"
        case .twentieth: return "tv.fill"
        case .industrial: return "gearshape.2.fill"
        case .colonial: return "sailboat.fill"
        case .religiousSuppression: return "flame.fill"
        case .sunGodErasure: return "sun.max.fill"
        case .roman: return "building.columns.fill"
        case .ancient: return "triangle.fill"
        case .gnostic: return "eye.trianglebadge.exclamationmark"
        case .hiddenHistory: return "globe.americas.fill"
        case .governmentDeception: return "building.columns.circle.fill"
        }
    }
    
    var chipColor: Color {
        switch self {
        case .modern: return Palette.primary.blue
        case .twentieth: return Palette.primary.violet
        case .industrial: return Palette.primary.orange
        case .colonial: return Palette.primary.red
        case .religiousSuppression: return Color(hex: "#E74C3C")
        case .sunGodErasure: return Palette.accent.gold
        case .roman: return Palette.primary.violet
        case .ancient: return Palette.primary.cyan
        case .gnostic: return Color(hex: "#FFD700")
        case .hiddenHistory: return Palette.primary.orange
        case .governmentDeception: return Palette.primary.red
        }
    }
}


