// AlexandriaView.swift

import SwiftUI

struct AlexandriaView: View {
    
    @StateObject private var presenterBox: AlexandriaPresenterBox
    
    private var presenter: AlexandriaPresenterType {
        presenterBox.presenter
    }
    
    init(presenter: AlexandriaPresenterType) {
        _presenterBox = StateObject(wrappedValue: AlexandriaPresenterBox(presenter: presenter))
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
            .navigationTitle("Alexandria")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    private var headerSection: some View {
        
        VStack(spacing: 12) {
            
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.accent.gold,
                            Palette.primary.orange
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("The Library")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.text.primary,
                            Palette.accent.gold.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Ancient wisdom meets modern awakening")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
        }
        
    }
    
    private var contentSection: some View {
        
        VStack(spacing: 16) {
            
            knowledgeCard(
                icon: "book.closed.fill",
                title: "Sacred Texts",
                description: "Decoded teachings from across time",
                gradient: [Palette.accent.gold, Palette.primary.orange]
            )
            
            knowledgeCard(
                icon: "scroll.fill",
                title: "Hidden Knowledge",
                description: "What they don't teach in school",
                gradient: [Palette.primary.cyan, Palette.primary.violet]
            )
            
            knowledgeCard(
                icon: "brain.head.profile",
                title: "Consciousness Studies",
                description: "The science of awakening",
                gradient: [Palette.primary.violet, Palette.primary.blue]
            )
            
            knowledgeCard(
                icon: "eye.fill",
                title: "Pattern Recognition",
                description: "Learn to see through the programming",
                gradient: [Palette.primary.cyan, Palette.accent.cyan]
            )
            
        }
        
    }
    
    private func knowledgeCard(icon: String, title: String, description: String, gradient: [Color]) -> some View {
        
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
            
            // Ancient library dust particles
            ForEach(0..<40, id: \.self) { _ in
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Palette.accent.gold.opacity(Double.random(in: 0.2...0.5)),
                                Palette.primary.orange.opacity(Double.random(in: 0.2...0.5))
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: CGFloat.random(in: 1...2), height: CGFloat.random(in: 1...2))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .blur(radius: Double.random(in: 0.5...1))
            }
            
        }
        
    }
    
}
