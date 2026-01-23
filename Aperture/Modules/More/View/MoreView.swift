// MoreView.swift
// Cosmic More Menu - Awakening & Profile

import SwiftUI

struct MoreView: View {
    
    @Binding var selectedTab: Int
    @State private var showAwakening = false
    @State private var showProfile = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // Cosmic Background
                cosmicBackground
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 24) {
                        
                        // Header
                        headerSection
                        
                        // Menu Items
                        menuSection
                        
                        // App Info
                        appInfoSection
                        
                        Spacer(minLength: 100)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showAwakening) {
                AwakeningEntryView(presenter: AppContainer.shared.container.resolve(AwakeningPresenterType.self)!)
            }
            .navigationDestination(isPresented: $showProfile) {
                ProfileEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 MoreView: Profile route - \(route)")
                }
            }
            
        }
        
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        
        VStack(spacing: 12) {
            
            ZStack {
                
                // Glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.primary.violet.opacity(0.4), Color.clear],
                            center: .center,
                            startRadius: 20,
                            endRadius: 50
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "ellipsis.circle.fill")
                    .font(.system(size: 50, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.primary.cyan, Palette.primary.violet],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
            }
            
            Text("MORE")
                .font(.system(size: 24, weight: .black, design: .rounded))
                .tracking(4)
                .foregroundColor(Palette.text.primary)
            
            Text("Continue your journey")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
            
        }
        .padding(.top, 40)
        .padding(.bottom, 10)
        
    }
    
    // MARK: - Menu Section
    
    private var menuSection: some View {
        
        VStack(spacing: 16) {
            
            // Awakening
            MoreMenuCard(
                icon: "sun.max.fill",
                title: "Awakening",
                subtitle: "Courses & consciousness training",
                color: Palette.accent.gold,
                badge: "12 courses"
            ) {
                showAwakening = true
            }
            
            // Profile
            MoreMenuCard(
                icon: "person.circle.fill",
                title: "Profile",
                subtitle: "Your spiritual journey stats",
                color: Palette.primary.cyan,
                badge: nil
            ) {
                showProfile = true
            }
            
            // Settings (future)
            MoreMenuCard(
                icon: "gearshape.fill",
                title: "Settings",
                subtitle: "Customize your experience",
                color: Palette.text.muted,
                badge: nil
            ) {
                // TODO: Navigate to settings
            }
            
            // About
            MoreMenuCard(
                icon: "info.circle.fill",
                title: "About Aperture",
                subtitle: "The truth shall set you free",
                color: Palette.primary.violet,
                badge: nil
            ) {
                // TODO: Navigate to about
            }
            
        }
        
    }
    
    // MARK: - App Info Section
    
    private var appInfoSection: some View {
        
        VStack(spacing: 16) {
            
            // Divider
            Rectangle()
                .fill(Palette.text.muted.opacity(0.3))
                .frame(height: 1)
                .padding(.vertical, 10)
            
            // Dragon quote
            VStack(spacing: 8) {
                
                Text("🐉")
                    .font(.system(size: 32))
                
                Text("\"The only prison is the one you don't know you're in.\"")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .italic()
                    .multilineTextAlignment(.center)
                
            }
            .padding(.vertical, 20)
            
            // Version
            Text("Aperture v1.0")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
                .foregroundColor(Palette.text.muted)
            
            Text("Open your eyes")
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted.opacity(0.6))
            
        }
        
    }
    
    // MARK: - Background
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()
            
            // Floating particles
            GeometryReader { geo in
                ForEach(0..<60, id: \.self) { i in
                    Circle()
                        .fill(i % 3 == 0 ? Palette.primary.violet.opacity(0.3) : Color.white)
                        .frame(width: CGFloat(i % 4 + 1))
                        .position(
                            x: CGFloat((i * 29) % max(1, Int(geo.size.width))),
                            y: CGFloat((i * 37) % max(1, Int(geo.size.height)))
                        )
                        .opacity(Double(i % 6) * 0.1 + 0.15)
                }
            }
            
        }
        
    }
    
}

// MARK: - Menu Card

struct MoreMenuCard: View {
    
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let badge: String?
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: 16) {
                
                // Icon
                ZStack {
                    
                    Circle()
                        .fill(color.opacity(0.15))
                        .frame(width: 56, height: 56)
                    
                    Image(systemName: icon)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(color)
                    
                }
                
                // Text
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text(title)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        
                        if let badge = badge {
                            Text(badge)
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundColor(color)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .fill(color.opacity(0.15))
                                )
                        }
                    }
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                    
                }
                
                Spacer()
                
                // Arrow
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
                
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(color.opacity(0.2), lineWidth: 1)
                    )
            )
            
        }
        .buttonStyle(ScaleButtonStyle())
        
    }
    
}
