// CosmosView.swift

import SwiftUI

struct CosmosView: View {
    
    @StateObject private var presenterBox: CosmosPresenterBox
    
    private var presenter: CosmosPresenterType {
        presenterBox.presenter
    }
    
    init(presenter: CosmosPresenterType) {
        _presenterBox = StateObject(wrappedValue: CosmosPresenterBox(presenter: presenter))
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                cosmicBackground
                
                ScrollView {
                    
                    VStack(spacing: 24) {
                        
                        Spacer(minLength: 40)
                        
                        headerSection
                        
                        contentSection
                        
                        Spacer(minLength: 40)
                        
                    }
                    .padding(.horizontal, 24)
                    
                }
                
            }
            .navigationTitle("Cosmos")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    private var headerSection: some View {
        
        VStack(spacing: 12) {
            
            Image(systemName: "globe.americas.fill")
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.primary.cyan,
                            Palette.primary.violet
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("The Cosmos")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.text.primary,
                            Palette.primary.violet.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Explore the infinite expanse")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
        }
        
    }
    
    private var contentSection: some View {
        
        VStack(spacing: 16) {
            
            cosmicCard(
                icon: "star.fill",
                title: "Dimensions",
                description: "Navigate beyond 3D reality",
                gradient: [Palette.primary.cyan, Palette.primary.violet]
            )
            
            cosmicCard(
                icon: "waveform",
                title: "Frequencies",
                description: "Tune into higher vibrations",
                gradient: [Palette.primary.violet, Palette.accent.gold]
            )
            
            cosmicCard(
                icon: "circles.hexagonpath.fill",
                title: "Sacred Geometry",
                description: "Decode universal patterns",
                gradient: [Palette.accent.cyan, Palette.primary.cyan]
            )
            
        }
        
    }
    
    private func cosmicCard(icon: String, title: String, description: String, gradient: [Color]) -> some View {
        
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(
                    LinearGradient(
                        colors: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .fill(gradient[0].opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(description)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Palette.text.secondary.opacity(0.5))
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.surface.fieldFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    gradient[0].opacity(0.3),
                                    gradient[1].opacity(0.1)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
        
    }
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()
            
            // Animated cosmic particles
            ForEach(0..<70, id: \.self) { _ in
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Palette.primary.cyan.opacity(Double.random(in: 0.3...0.7)),
                                Palette.primary.violet.opacity(Double.random(in: 0.3...0.7))
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: CGFloat.random(in: 1...3), height: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .blur(radius: Double.random(in: 0.5...1.5))
            }
            
        }
        
    }
    
}
