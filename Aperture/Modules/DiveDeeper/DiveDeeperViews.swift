// DiveDeeperViews.swift
// The Dive Deeper hub + iceberg reader.
// Scroll deeper. Each layer unlocks the next. More than meets the eye 👀
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// DIVE DEEPER HUB — "This is not vibes anymore"
// ═══════════════════════════════════════════════════════════

struct DiveDeeperHub: View {
    
    @StateObject private var manager = DiveDeeperManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var selectedIceberg: Iceberg?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 10) {
                            Text("👀").font(.system(size: 44))
                            Text("Dive Deeper")
                                .font(.system(size: 24, weight: .black)).foregroundColor(.white)
                            Text("This is not vibes anymore. This is open-minded curiosity\naligned to interrogate beyond the surface level.\nYou will find more than meets the eye.")
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 10)
                        
                        // Available icebergs
                        Text("EXPLORE").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(IcebergCatalog.allIcebergs) { iceberg in
                            icebergCard(iceberg)
                        }
                        
                        // Coming soon
                        Text("COMING SOON").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.15)).frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(IcebergCatalog.comingSoon, id: \.0) { emoji, title, sub in
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(emoji).font(.system(size: 22))
                                    Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.25))
                                    Text(sub).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.12)).lineLimit(2)
                                }
                                .padding(12).frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white) }
                }
                ToolbarItem(placement: .principal) { Text("Dive Deeper").font(.system(size: 17, weight: .bold)).foregroundColor(.white) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(item: $selectedIceberg) { iceberg in
                IcebergDetailView(iceberg: iceberg)
            }
        }
    }
    
    private func icebergCard(_ iceberg: Iceberg) -> some View {
        let completed = manager.completedCount(for: iceberg.id)
        let total = iceberg.layers.count
        let progress = iceberg.layerProgress(unlockedCount: completed)
        
        return Button { selectedIceberg = iceberg } label: {
            VStack(spacing: 0) {
                // Gradient header
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(colors: iceberg.headerGradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 100)
                    
                    // Iceberg shape hint
                    VStack(alignment: .leading, spacing: 4) {
                        Text(iceberg.emoji).font(.system(size: 28))
                        Text(iceberg.title).font(.system(size: 18, weight: .black)).foregroundColor(.white)
                    }
                    .padding(14)
                }
                
                // Info section
                VStack(alignment: .leading, spacing: 8) {
                    Text(iceberg.subtitle)
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    
                    HStack {
                        Text("\(iceberg.layers.count) layers").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.25))
                        Text("•").foregroundColor(.white.opacity(0.1))
                        Text("~\(iceberg.totalReadingMinutes) min").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.25))
                        Spacer()
                        if completed > 0 {
                            Text("\(completed)/\(total)").font(.system(size: 10, weight: .bold)).foregroundColor(.cyan)
                        }
                    }
                    
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.04)).frame(height: 3)
                            RoundedRectangle(cornerRadius: 2).fill(
                                LinearGradient(colors: iceberg.headerGradient, startPoint: .leading, endPoint: .trailing)
                            ).frame(width: geo.size.width * progress, height: 3)
                        }
                    }
                    .frame(height: 3)
                }
                .padding(14)
                .background(Color(hex: "#0a0a0f"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.06), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Iceberg Identifiable conformance
extension Iceberg: Hashable, Equatable {
    static func == (lhs: Iceberg, rhs: Iceberg) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - ═══════════════════════════════════════════════════
// ICEBERG DETAIL VIEW — The deep dive experience
// ═══════════════════════════════════════════════════════════

struct IcebergDetailView: View {
    
    let iceberg: Iceberg
    @StateObject private var manager = DiveDeeperManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var selectedLayer: IcebergLayer?
    @State private var showWarning = true
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header
                    ZStack(alignment: .bottomLeading) {
                        LinearGradient(colors: iceberg.headerGradient, startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(iceberg.emoji).font(.system(size: 36))
                            Text(iceberg.title).font(.system(size: 28, weight: .black)).foregroundColor(.white)
                            Text(iceberg.subtitle).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
                        }
                        .padding(20)
                    }
                    
                    // Content warning
                    if let warning = iceberg.contentWarning, showWarning {
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 14)).foregroundColor(.yellow.opacity(0.6))
                            Text(warning).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35)).lineSpacing(3)
                            Spacer()
                            Button { withAnimation { showWarning = false } } label: {
                                Image(systemName: "xmark").font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                            }
                        }
                        .padding(12)
                        .background(Color.yellow.opacity(0.03))
                    }
                    
                    // Iceberg visualization
                    icebergVisualization
                    
                    // Layers list
                    VStack(spacing: 2) {
                        ForEach(iceberg.layers) { layer in
                            layerRow(layer)
                        }
                    }
                    .padding(.horizontal, 16).padding(.top, 10)
                    
                    // Sources
                    VStack(alignment: .leading, spacing: 6) {
                        Text("SOURCES").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                        Text(iceberg.sourceNotes).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2)).lineSpacing(3)
                    }
                    .padding(16).padding(.top, 10)
                    
                    Spacer(minLength: 80)
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            
            // Dismiss button
            VStack {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28)).foregroundColor(.white.opacity(0.5))
                    }
                    .padding(16)
                    Spacer()
                }
                Spacer()
            }
        }
        .sheet(item: $selectedLayer) { layer in
            LayerReaderView(iceberg: iceberg, layer: layer)
        }
    }
    
    // MARK: - Iceberg Visualization
    
    private var icebergVisualization: some View {
        VStack(spacing: 0) {
            // Water line label
            HStack {
                Rectangle().fill(Color.cyan.opacity(0.2)).frame(height: 1)
                Text("~ SURFACE ~").font(.system(size: 8, weight: .black)).tracking(1.5).foregroundColor(.cyan.opacity(0.3))
                Rectangle().fill(Color.cyan.opacity(0.2)).frame(height: 1)
            }
            .padding(.horizontal, 16).padding(.top, 14)
            
            // Depth bars
            VStack(spacing: 3) {
                ForEach(iceberg.layers) { layer in
                    let isUnlocked = manager.isLayerUnlocked(icebergId: iceberg.id, depth: layer.depth)
                    let isComplete = manager.isLayerComplete(icebergId: iceberg.id, depth: layer.depth)
                    let widthMultiplier = 1.0 - (Double(layer.depth) * 0.06)
                    
                    HStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(isComplete ? layer.depthColor : (isUnlocked ? layer.depthColor.opacity(0.4) : Color.white.opacity(0.03)))
                            .frame(height: 8)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(x: widthMultiplier, anchor: .center)
                    }
                }
            }
            .padding(.horizontal, 30).padding(.vertical, 8)
        }
    }
    
    // MARK: - Layer Row
    
    private func layerRow(_ layer: IcebergLayer) -> some View {
        let isUnlocked = manager.isLayerUnlocked(icebergId: iceberg.id, depth: layer.depth)
        let isComplete = manager.isLayerComplete(icebergId: iceberg.id, depth: layer.depth)
        
        return Button {
            if isUnlocked { selectedLayer = layer }
        } label: {
            HStack(spacing: 12) {
                // Depth indicator
                ZStack {
                    Circle()
                        .fill(isComplete ? layer.depthColor : (isUnlocked ? layer.depthColor.opacity(0.2) : Color.white.opacity(0.03)))
                        .frame(width: 36, height: 36)
                    if isComplete {
                        Image(systemName: "checkmark").font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    } else if !isUnlocked {
                        Image(systemName: "lock.fill").font(.system(size: 10)).foregroundColor(.white.opacity(0.1))
                    } else {
                        Text("\(layer.depth)").font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(layer.depthColor)
                    }
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text(layer.depthLabel).font(.system(size: 8, weight: .black)).tracking(0.5)
                            .foregroundColor(isUnlocked ? layer.depthColor.opacity(0.6) : .white.opacity(0.08))
                        Text("·").foregroundColor(.white.opacity(0.08))
                        Text("\(layer.readingMinutes) min").font(.system(size: 8, weight: .bold))
                            .foregroundColor(.white.opacity(0.1))
                    }
                    Text(layer.title)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(isUnlocked ? .white : .white.opacity(0.15))
                    Text(isUnlocked ? layer.tagline : "Read the layer above to unlock")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(isUnlocked ? .white.opacity(0.35) : .white.opacity(0.08))
                        .lineLimit(1)
                }
                
                Spacer()
                
                if isUnlocked && !isComplete {
                    Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(layer.depthColor.opacity(0.4))
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(
                isComplete ? layer.depthColor.opacity(0.04) : Color.white.opacity(isUnlocked ? 0.015 : 0.005)
            ))
        }
        .buttonStyle(.plain)
        .disabled(!isUnlocked)
    }
}

// Make IcebergLayer work with sheet(item:)
extension IcebergLayer: Hashable, Equatable {
    static func == (lhs: IcebergLayer, rhs: IcebergLayer) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - ═══════════════════════════════════════════════════
// LAYER READER — The immersive reading experience
// ═══════════════════════════════════════════════════════════

struct LayerReaderView: View {
    
    let iceberg: Iceberg
    let layer: IcebergLayer
    @StateObject private var manager = DiveDeeperManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var scrollProgress: CGFloat = 0
    @State private var hasReachedBottom = false
    
    var body: some View {
        ZStack {
            // Background gradient matching depth
            LinearGradient(
                colors: [layer.depthColor.opacity(0.15), Color(hex: "#0a0a0f")],
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()
            
            Color(hex: "#0a0a0f").ignoresSafeArea()
                .opacity(0.85)
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.down").font(.system(size: 14, weight: .semibold)).foregroundColor(.white.opacity(0.4))
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text(layer.depthLabel.uppercased()).font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(layer.depthColor.opacity(0.5))
                        Text(layer.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    }
                    Spacer()
                    Text("\(layer.readingMinutes) min").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
                }
                .padding(.horizontal, 16).padding(.vertical, 12)
                
                // Reading progress
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle().fill(Color.white.opacity(0.03)).frame(height: 2)
                        Rectangle().fill(layer.depthColor).frame(width: geo.size.width * scrollProgress, height: 2)
                    }
                }
                .frame(height: 2)
                
                // Content
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        // Layer header
                        VStack(alignment: .leading, spacing: 8) {
                            Text(layer.tagline)
                                .font(.system(size: 16, weight: .bold)).foregroundColor(layer.depthColor)
                                .lineSpacing(3)
                        }
                        .padding(.top, 16)
                        
                        // Sections
                        ForEach(layer.sections) { section in
                            VStack(alignment: .leading, spacing: 10) {
                                if let heading = section.heading {
                                    Text(heading)
                                        .font(.system(size: 18, weight: .black)).foregroundColor(.white)
                                }
                                Text(section.body)
                                    .font(.system(size: 14, weight: .regular)).foregroundColor(.white.opacity(0.7))
                                    .lineSpacing(6)
                            }
                        }
                        
                        // Bottom - mark complete
                        VStack(spacing: 14) {
                            Rectangle().fill(layer.depthColor.opacity(0.2)).frame(height: 1)
                            
                            let isComplete = manager.isLayerComplete(icebergId: iceberg.id, depth: layer.depth)
                            let isLastLayer = layer.depth == iceberg.layers.count - 1
                            
                            if isComplete {
                                HStack(spacing: 6) {
                                    Image(systemName: "checkmark.circle.fill").foregroundColor(layer.depthColor)
                                    Text("Layer complete").font(.system(size: 13, weight: .bold)).foregroundColor(layer.depthColor)
                                }
                            } else {
                                Button {
                                    manager.completeLayer(icebergId: iceberg.id, depth: layer.depth)
                                    HapticManager.shared.heavy()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { dismiss() }
                                } label: {
                                    VStack(spacing: 4) {
                                        Text(isLastLayer ? "You've reached the bottom." : "Continue deeper →")
                                            .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                        if !isLastLayer {
                                            Text("Unlocks: \(iceberg.layers[safe: layer.depth + 1]?.title ?? "Next layer")")
                                                .font(.system(size: 10, weight: .medium)).foregroundColor(.black.opacity(0.5))
                                        }
                                    }
                                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(layer.depthColor))
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20)
                    .background(
                        GeometryReader { geo in
                            Color.clear.preference(key: ScrollOffsetKey.self, value: geo.frame(in: .named("scroll")).minY)
                        }
                    )
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    let total: CGFloat = 1000 // approximate
                    scrollProgress = min(1, max(0, -value / total))
                }
            }
        }
    }
}

// Helper for scroll tracking
struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}

// Safe array subscript defined in Core/Extensions/Array+Safe.swift
