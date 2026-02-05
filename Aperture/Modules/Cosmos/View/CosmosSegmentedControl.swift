// CosmosSegmentedControl.swift
// Segmented control for Cosmos sections: Spheres, Lies & Truths, Entities

import SwiftUI

// MARK: - Cosmos Section Type

enum CosmosSection: String, CaseIterable {
    case spheres = "Spheres"
    case liesAndTruths = "Lies & Truths"
    case entities = "Entities"
    
    var icon: String {
        switch self {
        case .spheres: return "circle.hexagonpath"
        case .liesAndTruths: return "text.book.closed"
        case .entities: return "sparkles"
        }
    }
}

// MARK: - Cosmos Segmented Control

struct CosmosSegmentedControl: View {
    
    @Binding var selectedSection: CosmosSection
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(CosmosSection.allCases, id: \.self) { section in
                segmentButton(for: section)
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
        .padding(.horizontal, 16)
    }
    
    private func segmentButton(for section: CosmosSection) -> some View {
        let isSelected = selectedSection == section
        
        return Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedSection = section
            }
            HapticManager.shared.selectionChanged()
        }) {
            HStack(spacing: 6) {
                Image(systemName: section.icon)
                    .font(.system(size: 12))
                
                Text(section.rawValue)
                    .font(.system(size: 12, weight: .semibold))
            }
            .foregroundColor(isSelected ? .black : .white.opacity(0.7))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
                Group {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Palette.accent.gold)
                    } else {
                        Color.clear
                    }
                }
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Tappable Mini Map

struct TappableMiniMap: View {
    
    let realms: [CosmicRealm]
    let currentRealmIndex: Int
    let onRealmTap: (Int, String) -> Void
    
    @State private var expandedSection: CosmosSection?
    
    // Additional anchors for other sections
    let additionalAnchors: [(id: String, label: String, color: Color)] = [
        ("demonized", "Demonized", .purple),
        ("lies", "Lies", .red),
        ("angels", "Angels", .cyan)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            mapContent
            Spacer()
        }
        .padding(.trailing, 8)
    }
    
    private var mapContent: some View {
        VStack(spacing: 8) {
            mapHeader
            realmDotsSection
            dividerLine
            additionalAnchorsSection
            currentRealmLabel
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
        .background(mapBackground)
    }
    
    private var mapHeader: some View {
        Text("MAP")
            .font(.system(size: 9, weight: .bold, design: .rounded))
            .tracking(2)
            .foregroundColor(Palette.text.muted)
    }
    
    private var realmDotsSection: some View {
        VStack(spacing: 5) {
            ForEach(Array(realms.enumerated()), id: \.element.id) { index, realm in
                Button(action: {
                    onRealmTap(index, realm.id.uuidString)
                    HapticManager.shared.light()
                }) {
                    TappableMiniMapDot(
                        realm: realm,
                        isActive: index == currentRealmIndex,
                        isCurrent: realm.order == 0
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private var dividerLine: some View {
        Rectangle()
            .fill(Color.white.opacity(0.2))
            .frame(height: 1)
            .padding(.vertical, 4)
    }
    
    private var additionalAnchorsSection: some View {
        VStack(spacing: 5) {
            ForEach(additionalAnchors, id: \.id) { anchor in
                Button(action: {
                    onRealmTap(-1, anchor.id)
                    HapticManager.shared.light()
                }) {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(anchor.color)
                            .frame(width: 6, height: 6)
                        
                        Text(anchor.label)
                            .font(.system(size: 7, weight: .medium))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    @ViewBuilder
    private var currentRealmLabel: some View {
        if let currentRealm = realms[safe: currentRealmIndex] {
            Text(currentRealm.name)
                .font(.system(size: 8, weight: .bold, design: .rounded))
                .foregroundColor(currentRealm.color)
                .lineLimit(1)
                .frame(width: 50)
        }
    }
    
    private var mapBackground: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.black.opacity(0.6))
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
            )
    }
}

// MARK: - Tappable Mini Map Dot

struct TappableMiniMapDot: View {
    
    let realm: CosmicRealm
    let isActive: Bool
    let isCurrent: Bool
    
    var body: some View {
        ZStack {
            // Active ring
            if isActive {
                Circle()
                    .stroke(realm.color, lineWidth: 1.5)
                    .frame(width: 14, height: 14)
            }
            
            // Dot
            Circle()
                .fill(isActive ? realm.color : realm.color.opacity(0.5))
                .frame(width: isCurrent ? 10 : 8, height: isCurrent ? 10 : 8)
            
            // "You are here" indicator
            if isCurrent && !isActive {
                Circle()
                    .stroke(Palette.accent.gold, lineWidth: 1)
                    .frame(width: 12, height: 12)
            }
        }
        .frame(width: 16, height: 16)
    }
}

// MARK: - Collapsible Section

struct CollapsibleCosmosSection<Content: View>: View {
    
    let title: String
    let subtitle: String?
    let icon: String
    let color: Color
    let isExpanded: Bool
    let onToggle: () -> Void
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 0) {
            // Header (tappable)
            Button(action: onToggle) {
                HStack(spacing: 12) {
                    // Icon
                    Image(systemName: icon)
                        .font(.system(size: 18))
                        .foregroundColor(color)
                        .frame(width: 40, height: 40)
                        .background(color.opacity(0.15))
                        .clipShape(Circle())
                    
                    // Title
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                        
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                    
                    Spacer()
                    
                    // Expand/collapse chevron
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(color)
                        .rotationEffect(.degrees(isExpanded ? 0 : 0))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    isExpanded ? color.opacity(0.4) : Color.white.opacity(0.1),
                                    lineWidth: 1
                                )
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            // Content (when expanded)
            if isExpanded {
                content
                    .padding(.top, 12)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: isExpanded)
    }
}

// MARK: - Preview

#Preview("CosmosSegmented") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        
        VStack(spacing: 20) {
            CosmosSegmentedControl(selectedSection: .constant(.spheres))
            
            CollapsibleCosmosSection(
                title: "The Lies They Told",
                subtitle: "Hell, Antichrist, and Fear",
                icon: "flame.fill",
                color: .red,
                isExpanded: true,
                onToggle: {}
            ) {
                Text("Content here")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}
