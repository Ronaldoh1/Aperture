// CosmosEntityDetailView.swift
// Entity detail sheet for Cosmos module

import SwiftUI

// MARK: - Entity Detail View

struct EntityDetailView: View {
    
    let entity: CosmicEntity
    let realm: CosmicRealm?
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Custom header bar
                headerBar
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        entityHeader
                        
                        if !entity.description.isEmpty {
                            detailSection(title: "Description", content: entity.description)
                        }
                        
                        if !entity.symbolism.isEmpty {
                            detailSection(title: "Symbolism", content: entity.symbolism, color: Palette.primary.violet)
                        }
                        
                        if !entity.associatedWith.isEmpty {
                            associatedWithSection
                        }
                        
                        if !entity.gnosticTeaching.isEmpty {
                            detailSection(title: "Gnostic Teaching", content: entity.gnosticTeaching, color: Palette.accent.gold, icon: "book.fill")
                        }
                        
                        if let funFact = entity.funFact, !funFact.isEmpty {
                            funFactSection(funFact: funFact)
                        }
                        
                        crossModuleLinks
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    // MARK: - Header Bar
    
    private var headerBar: some View {
        HStack {
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(Palette.text.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
    
    // MARK: - Entity Header
    
    private var entityHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [entity.color.opacity(0.4), entity.color.opacity(0.05)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 60
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: entity.icon)
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(entity.color)
            }
            .shadow(color: entity.color.opacity(0.4), radius: 20)
            
            Text(entity.name)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .multilineTextAlignment(.center)
            
            if !entity.titles.isEmpty {
                Text(entity.titles.joined(separator: " • "))
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(entity.color)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            if let realm = realm {
                Text("Found in: \(realm.name)")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(realm.color)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(realm.color.opacity(0.15))
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
    }
    
    // MARK: - Associated With Section
    
    private var associatedWithSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader(title: "Associated With", icon: "link", color: Palette.primary.cyan)
            
            CosmosFlowLayout(spacing: 8) {
                ForEach(entity.associatedWith, id: \.self) { item in
                    Text(item)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.primary.cyan)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Palette.primary.cyan.opacity(0.15))
                        )
                }
            }
        }
    }
    
    // MARK: - Cross Module Links
    
    private var crossModuleLinks: some View {
        VStack(spacing: 12) {
            Divider()
                .background(Color.white.opacity(0.1))
            
            HStack {
                Button(action: {
                    onDismiss()
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 14))
                        Text("Ground this in practice")
                            .font(.system(size: 13, weight: .medium))
                    }
                    .foregroundColor(Palette.accent.gold)
                }
                
                Spacer()
            }
        }
        .padding(.top, 16)
    }
    
    // MARK: - Fun Fact Section
    
    private func funFactSection(funFact: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader(title: "Did You Know?", icon: "sparkles", color: Palette.primary.orange)
            
            Text(funFact)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(5)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Palette.primary.orange.opacity(0.1))
                )
        }
    }
    
    private func sectionHeader(title: String, icon: String, color: Color) -> some View {
        Label(title.uppercased(), systemImage: icon)
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(color)
            .tracking(1)
    }
    
    private func detailSection(title: String, content: String, color: Color = Palette.text.secondary, icon: String = "circle.fill") -> some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader(title: title, icon: icon, color: color)
            
            Text(content)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary.opacity(0.9))
                .lineSpacing(5)
        }
    }
}

// MARK: - Flow Layout for Tags

struct CosmosFlowLayout: Layout {
    
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if currentX + size.width > maxWidth && currentX > 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: currentX, y: currentY))
                lineHeight = max(lineHeight, size.height)
                currentX += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: currentY + lineHeight)
        }
    }
}

// MARK: - Preview

#Preview {
    EntityDetailView(
        entity: CosmicEntity(
            name: "Sophia",
            titles: ["Divine Wisdom", "The Fallen Aeon"],
            description: "The divine feminine wisdom who fell from the Pleroma.",
            symbolism: "Represents the soul's journey.",
            color: .purple,
            icon: "sparkles",
            associatedWith: ["Wisdom", "Gnosis", "Light"],
            gnosticTeaching: "She is the mother of the Demiurge.",
            funFact: "Her name means wisdom in Greek."
        ),
        realm: nil,
        onDismiss: {}
    )
}
