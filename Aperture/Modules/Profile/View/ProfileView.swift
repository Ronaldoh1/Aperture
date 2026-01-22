// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var presenterBox: ProfilePresenterBox
    @EnvironmentObject private var session: SessionStore
    
    private var presenter: ProfilePresenterType {
        presenterBox.presenter
    }
    
    init(presenter: ProfilePresenterType) {
        _presenterBox = StateObject(wrappedValue: ProfilePresenterBox(presenter: presenter))
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                cosmicBackground
                
                ScrollView {
                    
                    VStack(spacing: 24) {
                        
                        Spacer(minLength: 40)
                        
                        profileHeader
                        
                        contentSection
                        
                        signOutSection
                        
                        Spacer(minLength: 40)
                        
                    }
                    .padding(.horizontal, 24)
                    
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    private var profileHeader: some View {
        
        VStack(spacing: 16) {
            
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Palette.primary.cyan.opacity(0.3),
                            Palette.primary.violet.opacity(0.3)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(Palette.primary.cyan)
                )
            
            Text("Consciousness Explorer")
                .font(.system(size: 24, weight: .bold, design: .rounded))
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
            
            Text("Your journey continues")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
            
        }
        
    }
    
    private var contentSection: some View {
        
        VStack(spacing: 16) {
            
            profileCard(
                icon: "chart.xyaxis.line",
                title: "Progress",
                description: "Track your awakening journey"
            )
            
            profileCard(
                icon: "star.fill",
                title: "Achievements",
                description: "Milestones and breakthroughs"
            )
            
            profileCard(
                icon: "gear",
                title: "Settings",
                description: "Customize your experience"
            )
            
        }
        
    }
    
    private var signOutSection: some View {
        
        VStack(spacing: 12) {
            
            CosmicButton(
                title: "Sign Out",
                style: .secondary,
                systemImage: "arrow.right.square",
                isDisabled: false
            ) {
                presenter.didTapSignOut()
            }
            
            Text("Version 1.0.0")
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
                .padding(.top, 8)
            
        }
        .padding(.top, 24)
        
    }
    
    private func profileCard(icon: String, title: String, description: String) -> some View {
        
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
