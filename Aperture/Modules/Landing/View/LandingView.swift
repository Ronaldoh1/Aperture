// LandingView.swift
// Site Map - Navigate to all areas of Aperture

import SwiftUI

struct LandingView: View {
    
    @StateObject private var presenterBox: LandingPresenterBox
    @Binding var selectedTab: Int
    
    private var presenter: LandingPresenterType {
        presenterBox.presenter
    }
    
    init(presenter: LandingPresenterType, selectedTab: Binding<Int>) {
        _presenterBox = StateObject(wrappedValue: LandingPresenterBox(presenter: presenter))
        _selectedTab = selectedTab
    }
    
    var body: some View {
        
        ZStack {
            
            cosmicBackground
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 32) {
                    
                    headerSection
                    
                    mainNavigationSection
                    
                    quickActionsSection
                    
                    dragonSection
                    
                    Spacer(minLength: 100)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
            }
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        
        VStack(spacing: 16) {
            
            ZStack {
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.primary.cyan.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "eye.circle.fill")
                    .font(.system(size: 60, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.primary.cyan, Palette.accent.gold],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
            }
            
            VStack(spacing: 8) {
                
                Text("APERTURE")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.text.primary, Palette.primary.cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                Text("Open Your Eyes")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .tracking(2)
                
            }
            
        }
        .padding(.top, 20)
        
    }
    
    // MARK: - Main Navigation
    
    private var mainNavigationSection: some View {
        
        VStack(spacing: 16) {
            
            HStack {
                Text("EXPLORE")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)
                Spacer()
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: 16) {
                
                NavigationCard(
                    icon: "clock.arrow.circlepath",
                    title: "Timeline",
                    subtitle: "Hidden History",
                    color: Palette.primary.violet
                ) {
                    selectedTab = 1
                }
                
                NavigationCard(
                    icon: "globe.americas.fill",
                    title: "Cosmos",
                    subtitle: "Gnostic Realms",
                    color: Palette.primary.cyan
                ) {
                    selectedTab = 2
                }
                
                NavigationCard(
                    icon: "books.vertical.fill",
                    title: "Alexandria",
                    subtitle: "Sacred Library",
                    color: Palette.accent.gold
                ) {
                    selectedTab = 3
                }
                
                NavigationCard(
                    icon: "sun.max.fill",
                    title: "Awakening",
                    subtitle: "Courses",
                    color: Palette.primary.red
                ) {
                    selectedTab = 4  // More tab (contains Awakening)
                }
                
            }
            
        }
        
    }
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        
        VStack(spacing: 16) {
            
            HStack {
                Text("QUICK START")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)
                Spacer()
            }
            
            VStack(spacing: 12) {
                
                QuickActionRow(
                    icon: "play.circle.fill",
                    title: "Continue Learning",
                    subtitle: "Resume your last course",
                    color: Palette.primary.cyan
                ) {
                    selectedTab = 4  // Awakening
                }
                
                QuickActionRow(
                    icon: "questionmark.circle.fill",
                    title: "Daily Question",
                    subtitle: "Challenge your programming",
                    color: Palette.primary.violet
                ) {
                    selectedTab = 4  // Awakening
                }
                
                QuickActionRow(
                    icon: "flame.fill",
                    title: "Biblical Lies Exposed",
                    subtitle: "15 lies they taught you",
                    color: Palette.primary.red
                ) {
                    selectedTab = 2  // Cosmos (Biblical Lies section)
                }
                
            }
            
        }
        
    }
    
    // MARK: - Dragon Section
    
    private var dragonSection: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                Text("🐉 DRAGON'S WISDOM")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(2)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(dragonQuotes.randomElement() ?? "The truth was never hidden. You just weren't looking.")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .italic()
                    .lineSpacing(4)
                
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )
            
        }
        
    }
    
    // MARK: - Background
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()
            
            // Stars
            GeometryReader { geo in
                ForEach(0..<80, id: \.self) { i in
                    Circle()
                        .fill(Color.white)
                        .frame(width: CGFloat(i % 3 + 1))
                        .position(
                            x: CGFloat(i * 17 % max(1, Int(geo.size.width))),
                            y: CGFloat(i * 23 % max(1, Int(geo.size.height)))
                        )
                        .opacity(Double(i % 5) * 0.1 + 0.2)
                }
            }
            
        }
        
    }
    
    // MARK: - Dragon Quotes
    
    private var dragonQuotes: [String] {
        [
            "The truth was never hidden. You just weren't looking.",
            "Every institution that tells you not to question is hiding something.",
            "They didn't burn the Library of Alexandria because the books were worthless.",
            "The matrix isn't a simulation. It's a perspective you chose to forget.",
            "When they say 'trust the experts,' ask who trained the experts.",
            "Your ancestors knew things that would terrify your professors.",
            "The greatest prison is the one you don't know you're in."
        ]
    }
    
}

// MARK: - Navigation Card

struct NavigationCard: View {
    
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            VStack(spacing: 12) {
                
                Image(systemName: icon)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(color)
                
                VStack(spacing: 4) {
                    
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    
                    Text(subtitle)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(color.opacity(0.3), lineWidth: 1)
                    )
            )
            
        }
        .buttonStyle(ScaleButtonStyle())
        
    }
    
}

// MARK: - Quick Action Row

struct QuickActionRow: View {
    
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: 16) {
                
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(color)
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(color.opacity(0.15))
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                    
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
                
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
            
        }
        .buttonStyle(ScaleButtonStyle())
        
    }
    
}

// MARK: - Scale Button Style

struct ScaleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
}
