// AwakeTogetherView.swift
// The Empathy Engine for Humanity's Great Awakening
// Bridge ideological divides, synthesize chaos into clarity, augment potential

import SwiftUI

struct AwakeTogetherView: View {
    @ObservedObject private var flagManager = FeatureFlagManager.shared
    @State private var showingBetaPanel = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Beta Testing Banner
                betaTestingBanner
                
                // Featured Modules (NEW)
                featuredModulesSection
                
                // Core Modules Grid
                coreModulesGrid
                
                // Quick Actions
                quickActionsSection
                
                // Coming Soon
                comingSoonSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("AwakeTogether")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingBetaPanel = true }) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.orange)
                }
            }
        }
        .sheet(isPresented: $showingBetaPanel) {
            NavigationView {
                BetaControlPanelView()
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                // Animated rings
                ForEach(0..<3) { i in
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.purple.opacity(0.5), .cyan.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                        .frame(width: CGFloat(80 + i * 20), height: CGFloat(80 + i * 20))
                        .opacity(0.3)
                }
                
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "person.3.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("AWAKETOGETHER")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("The Empathy Engine for Humanity's Great Awakening")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 16) {
                tagPill("Bridge Divides", color: .purple)
                tagPill("Find Clarity", color: .blue)
                tagPill("Grow Together", color: .cyan)
            }
        }
    }
    
    private func tagPill(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.system(size: 9, weight: .semibold))
            .foregroundColor(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .cornerRadius(10)
    }
    
    // MARK: - Beta Testing Banner
    
    private var betaTestingBanner: some View {
        HStack(spacing: 12) {
            Image(systemName: "testtube.2")
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Beta Testing Mode")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                Text("All MVP features enabled. V2 features disabled.")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: { showingBetaPanel = true }) {
                Text("Config")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Featured Modules
    
    private var featuredModulesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("FEATURED MODULES")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    // HAKAI: Matrix Lies - THE CROWN JEWEL
                    featuredModuleCard(
                        title: "HAKAI: Matrix Lies",
                        subtitle: "破壊 Unprogram the Deceptions",
                        icon: "theatermasks.fill",
                        color: .red,
                        badge: "破壊",
                        destination: AnyView(HakaiMatrixLiesView())
                    )
                    
                    // Consciousness Awakening Course
                    featuredModuleCard(
                        title: "Consciousness Course",
                        subtitle: "4-Level Awakening Journey",
                        icon: "brain.head.profile",
                        color: .purple,
                        badge: "NEW",
                        destination: AnyView(ConsciousnessAwakeningCourseView())
                    )
                    
                    // Science of Consciousness Hub
                    featuredModuleCard(
                        title: "Consciousness Hub",
                        subtitle: "TED Talks, Research & More",
                        icon: "sparkles",
                        color: .blue,
                        badge: "CURATED",
                        destination: AnyView(ScienceOfConsciousnessHubView())
                    )
                    
                    // Truth Verification Toolkit
                    featuredModuleCard(
                        title: "Truth Toolkit",
                        subtitle: "Discern Illusion from Reality",
                        icon: "eye.trianglebadge.exclamationmark",
                        color: .orange,
                        badge: "GNOSTIC",
                        destination: AnyView(TruthVerificationToolkitView())
                    )
                }
            }
        }
    }
    
    private func featuredModuleCard(title: String, subtitle: String, icon: String, color: Color, badge: String, destination: AnyView) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(color.opacity(0.3))
                            .frame(width: 50, height: 50)
                        Image(systemName: icon)
                            .font(.system(size: 22))
                            .foregroundColor(color)
                    }
                    
                    Spacer()
                    
                    Text(badge)
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(color)
                        .cornerRadius(4)
                }
                
                Text(title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .frame(width: 160)
            .padding()
            .background(
                LinearGradient(
                    colors: [color.opacity(0.2), color.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(16)
        }
    }
    
    // MARK: - Core Modules Grid
    
    private var coreModulesGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "cpu")
                    .foregroundColor(.cyan)
                Text("CONSCIOUSNESS TOOLS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                // Hakai Hate
                if flagManager.isEnabled(.hakaiHate) {
                    moduleCard(
                        title: "Hakai Hate",
                        subtitle: "Check before you post",
                        icon: "shield.checkered",
                        color: .red,
                        destination: AnyView(HakaiHateView())
                    )
                }
                
                // Awakening Tracker
                if flagManager.isEnabled(.awakeningTracker) {
                    moduleCard(
                        title: "Awakening Tracker",
                        subtitle: "Track your journey",
                        icon: "sparkles",
                        color: .purple,
                        destination: AnyView(AwakeningTrackerView())
                    )
                }
                
                // MindShield
                if flagManager.isEnabled(.mindShield) {
                    moduleCard(
                        title: "MindShield",
                        subtitle: "Protect your mind",
                        icon: "shield.fill",
                        color: .blue,
                        destination: AnyView(MindShieldView())
                    )
                }
                
                // Reality Anchor
                if flagManager.isEnabled(.realityAnchor) {
                    moduleCard(
                        title: "Reality Anchor",
                        subtitle: "Ground yourself",
                        icon: "anchor.circle.fill",
                        color: .green,
                        destination: AnyView(RealityAnchorView())
                    )
                }
                
                // EquityWeave
                if flagManager.isEnabled(.equityWeave) {
                    moduleCard(
                        title: "EquityWeave",
                        subtitle: "Know your worth",
                        icon: "scale.3d",
                        color: .yellow,
                        destination: AnyView(EquityWeaveView())
                    )
                }
                
                // Truth Toolkit
                moduleCard(
                    title: "Truth Toolkit",
                    subtitle: "Discern reality",
                    icon: "eye.trianglebadge.exclamationmark",
                    color: .orange,
                    destination: AnyView(TruthVerificationToolkitView())
                )
                
                // HAKAI: Matrix Lies
                moduleCard(
                    title: "Matrix Lies",
                    subtitle: "破壊 Unprogram",
                    icon: "theatermasks.fill",
                    color: .red,
                    destination: AnyView(HakaiMatrixLiesView())
                )
            }
        }
    }
    
    private func moduleCard(title: String, subtitle: String, icon: String, color: Color, destination: AnyView) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading, spacing: 10) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.3))
                        .frame(width: 44, height: 44)
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(color)
                }
                
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(color.opacity(0.1))
            .cornerRadius(16)
        }
    }
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.yellow)
                Text("QUICK TOOLS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            
            HStack(spacing: 12) {
                quickActionButton("Breathe", icon: "wind", color: .cyan) {
                    // Quick breathing exercise
                }
                
                quickActionButton("Ground", icon: "hand.raised.fill", color: .green) {
                    // 5-4-3-2-1 grounding
                }
                
                quickActionButton("Check", icon: "questionmark.circle", color: .orange) {
                    // Reality check prompt
                }
            }
        }
    }
    
    private func quickActionButton(_ title: String, icon: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(color.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Coming Soon
    
    private var comingSoonSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(.gray)
                Text("COMING IN V2")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                comingSoonRow("Cloud Sync", "Sync journal across devices")
                comingSoonRow("AI Integration", "ChatGPT/Claude/Grok support")
                comingSoonRow("Web Access", "View journal from browser")
                comingSoonRow("Collective Insights", "Anonymous aggregated wisdom")
            }
            .padding()
            .background(Color.white.opacity(0.03))
            .cornerRadius(12)
        }
    }
    
    private func comingSoonRow(_ title: String, _ desc: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "lock.fill")
                .foregroundColor(.gray)
                .font(.system(size: 10))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                Text(desc)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Placeholder Views

struct SerenePlaceholderView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "leaf.fill")
                .font(.system(size: 60))
                .foregroundColor(.mint)
            
            Text("Serene")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("Calm-like experience with behavioral nudges")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Text("Coming Soon")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.mint)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.mint.opacity(0.2))
                .cornerRadius(20)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Serene")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        AwakeTogetherView()
    }
}
