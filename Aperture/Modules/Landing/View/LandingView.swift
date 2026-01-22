// LandingView.swift

import SwiftUI

struct LandingView: View {
    
    @StateObject private var presenterBox: LandingPresenterBox
    
    private var presenter: LandingPresenterType {
        presenterBox.presenter
    }
    
    init(presenter: LandingPresenterType) {
        _presenterBox = StateObject(wrappedValue: LandingPresenterBox(presenter: presenter))
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
            .navigationTitle("Aperture")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    private var headerSection: some View {
        
        VStack(spacing: 12) {
            
            Text("Welcome to Aperture")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.text.primary,
                            Palette.primary.cyan.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Your consciousness journey begins")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
        }
        
    }
    
    private var contentSection: some View {
        
        VStack(spacing: 16) {
            
            cosmicCard(
                icon: "sparkles",
                title: "Explore",
                description: "Discover new dimensions of awareness"
            )
            
            cosmicCard(
                icon: "waveform.path.ecg",
                title: "Connect",
                description: "Align with universal frequencies"
            )
            
            cosmicCard(
                icon: "infinity",
                title: "Transcend",
                description: "Expand beyond the illusion"
            )
            
        }
        
    }
    
    private func cosmicCard(icon: String, title: String, description: String) -> some View {
        
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Palette.primary.cyan)
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .fill(Palette.primary.cyan.opacity(0.15))
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
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.surface.fieldFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Palette.surface.fieldStroke, lineWidth: 1)
                )
        )
        
    }
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()
            
            ForEach(0..<50, id: \.self) { _ in
                Circle()
                    .fill(Palette.text.primary)
                    .frame(width: CGFloat.random(in: 1...2), height: CGFloat.random(in: 1...2))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(Double.random(in: 0.2...0.6))
            }
            
        }
        
    }
    
}
