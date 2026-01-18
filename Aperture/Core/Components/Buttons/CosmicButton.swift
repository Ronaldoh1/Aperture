// CosmicButton.swift

import SwiftUI

enum CosmicButtonStyle {
    
    case primary
    case secondary
    
}

struct CosmicButton: View {
    
    let title: String
    let style: CosmicButtonStyle
    let systemImage: String?
    let isDisabled: Bool
    let action: () -> Void
    
    init(
        title: String,
        style: CosmicButtonStyle = .primary,
        systemImage: String? = nil,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        
        self.title = title
        self.style = style
        self.systemImage = systemImage
        self.isDisabled = isDisabled
        self.action = action
        
    }
    
    var body: some View {
        
        Button(action: action) {
            
            ZStack {
                
                background
                geometryOverlay
                
                HStack(spacing: 12) {
                    
                    Text(title)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                    
                    if let systemImage {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .bold))
                        
                    }
                    
                }
                .foregroundColor(foregroundColor)
                .padding(.horizontal, 22)
                
            }
            .frame(height: 56)
            .cosmicFormWidth()
            
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.55 : 1.0)
        
    }
    
    private var foregroundColor: Color {
        
        switch style {
        case .primary:
            return .black
        case .secondary:
            return .white
        }
        
    }
    
    private var background: some View {
        
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(backgroundGradient)
            .overlay(border)
            .shadow(color: shadowColor, radius: 18, x: 0, y: 10)
            .overlay(glassSheen.mask(RoundedRectangle(cornerRadius: 18, style: .continuous)))
        
    }
    
    private var backgroundGradient: LinearGradient {
        
        switch style {
        case .primary:
            return LinearGradient(
                colors: [
                    Color(red: 0.98, green: 0.82, blue: 0.25),
                    Color(red: 0.20, green: 0.85, blue: 0.95)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .secondary:
            return LinearGradient(
                colors: [
                    Color.white.opacity(0.12),
                    Color.white.opacity(0.06)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        
    }
    
    private var glassSheen: some View {
        
        LinearGradient(
            colors: [
                Color.white.opacity(0.18),
                Color.white.opacity(0.02),
                Color.clear
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
    }
    
    private var border: some View {
        
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.18),
                        Color.cyan.opacity(0.22),
                        Color.purple.opacity(0.18)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
        
    }
    
    private var shadowColor: Color {
        
        switch style {
        case .primary:
            return Color.cyan.opacity(0.18)
        case .secondary:
            return Color.black.opacity(0.35)
        }
        
    }
    
    private var geometryOverlay: some View {
        
        GeometryReader { proxy in
            
            let size = min(proxy.size.width, proxy.size.height)
            
            ZStack {
                
                if style == .primary {
                    
                    StarTetrahedron()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.22),
                                    Color.cyan.opacity(0.20),
                                    Color.purple.opacity(0.18)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                        .frame(width: size * 0.92, height: size * 0.92)
                        .opacity(0.18)
                        .blendMode(.screen)
                    
                    VesicaPiscis()
                        .stroke(Color.white.opacity(0.10), lineWidth: 1)
                        .frame(width: size * 0.78, height: size * 0.78)
                        .opacity(0.12)
                        .blendMode(.screen)
                    
                } else {
                    
                    FlowerOfLife()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.14),
                                    Color.cyan.opacity(0.12),
                                    Color.purple.opacity(0.10)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                        .frame(width: size * 0.92, height: size * 0.92)
                        .opacity(0.14)
                        .blendMode(.screen)
                    
                    SeedOfLife()
                        .stroke(Color.white.opacity(0.10), lineWidth: 1)
                        .frame(width: size * 0.72, height: size * 0.72)
                        .opacity(0.10)
                        .blendMode(.screen)
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .allowsHitTesting(false)
        
    }
    
}
