//
//  ApertureIntroductionView.swift
//  Aperture
//
//  Created by SunFlow on 2025
//  Open Your Eyes
//

import SwiftUI

// MARK: - Introduction Data Model

struct IntroPage: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let bodyText: String
    let accentColor: Color
}

// MARK: - Main Introduction View

struct ApertureIntroductionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPage = 0
    @State private var appeared = false
    @State private var geometryRotation: Double = 0
    
    let onComplete: () -> Void
    
    private let pages: [IntroPage] = [
        IntroPage(
            icon: "eye.fill",
            title: "Welcome to Aperture",
            subtitle: "A Space for Curious Minds",
            bodyText: "Aperture is built for those who ask deeper questions. We believe critical thinking is a skill worth cultivating, and that exploring diverse perspectives makes us wiser.",
            accentColor: Palette.accent.gold
        ),
        IntroPage(
            icon: "books.vertical.fill",
            title: "Explore Hidden Knowledge",
            subtitle: "Ancient Wisdom Meets Modern Discovery",
            bodyText: "Access historical texts, philosophical traditions, and perspectives that don't always make it into mainstream conversation. From Gnostic manuscripts to consciousness research—we curate what's worth exploring.",
            accentColor: Palette.primary.cyan
        ),
        IntroPage(
            icon: "brain.head.profile",
            title: "Think For Yourself",
            subtitle: "Your Mind, Your Conclusions",
            bodyText: "We don't tell you what to think. We present information, multiple viewpoints, and let you draw your own conclusions. Healthy skepticism—even of us—is encouraged.",
            accentColor: Palette.primary.violet
        ),
        IntroPage(
            icon: "sparkles",
            title: "Your Awakening Journey",
            subtitle: "Practical Tools for Growth",
            bodyText: "Beyond information, we offer meditation practices, consciousness exercises, and daily tools to help you develop clarity, presence, and inner peace. Growth happens one insight at a time.",
            accentColor: Color.green
        ),
        IntroPage(
            icon: "checkmark.shield.fill",
            title: "Our Commitment to You",
            subtitle: "Transparency & Respect",
            bodyText: "We present alternative perspectives alongside mainstream views. We cite our sources. We respect your intelligence. This is a judgment-free space for genuine seekers ready to question, explore, and grow.",
            accentColor: Palette.accent.gold
        )
    ]
    
    var body: some View {
        ZStack {
            // Background
            backgroundLayer
            
            // Sacred geometry
            geometryLayer
            
            // Content
            VStack(spacing: 0) {
                // Skip button
                skipButton
                
                // Page content
                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                        IntroPageView(page: page, isActive: currentPage == index)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Bottom controls
                bottomControls
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                appeared = true
            }
            startGeometryAnimation()
        }
    }
    
    // MARK: - Background
    
    private var backgroundLayer: some View {
        LinearGradient(
            colors: [
                Color(hex: "#0a0a1a"),
                Color(hex: "#0d1025"),
                Color(hex: "#0a0a1a")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    // MARK: - Sacred Geometry Background
    
    private var geometryLayer: some View {
        ZStack {
            // Outer rotating ring
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            pages[currentPage].accentColor.opacity(0.1),
                            pages[currentPage].accentColor.opacity(0.05),
                            .clear
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1
                )
                .frame(width: 500, height: 500)
                .rotationEffect(.degrees(geometryRotation))
            
            // Flower of Life pattern (simplified)
            FlowerOfLifeShape()
                .stroke(pages[currentPage].accentColor.opacity(0.08), lineWidth: 0.5)
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(-geometryRotation * 0.5))
            
            // Inner sacred circle
            Circle()
                .stroke(pages[currentPage].accentColor.opacity(0.15), lineWidth: 1)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(geometryRotation * 0.3))
            
            // Center glow
            RadialGradient(
                colors: [
                    pages[currentPage].accentColor.opacity(0.15),
                    pages[currentPage].accentColor.opacity(0.05),
                    .clear
                ],
                center: .center,
                startRadius: 50,
                endRadius: 250
            )
            .frame(width: 500, height: 500)
        }
        .opacity(appeared ? 1 : 0)
        .animation(.easeInOut(duration: 1.5).delay(0.3), value: appeared)
        .animation(.easeInOut(duration: 0.8), value: currentPage)
    }
    
    // MARK: - Skip Button
    
    private var skipButton: some View {
        HStack {
            Spacer()
            
            if currentPage < pages.count - 1 {
                Button(action: {
                    withAnimation(.spring(response: 0.4)) {
                        currentPage = pages.count - 1
                    }
                }) {
                    Text("Skip")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .frame(height: 50)
    }
    
    // MARK: - Bottom Controls
    
    private var bottomControls: some View {
        VStack(spacing: 24) {
            // Page indicators
            HStack(spacing: 8) {
                ForEach(0..<pages.count, id: \.self) { index in
                    Capsule()
                        .fill(index == currentPage ? pages[currentPage].accentColor : Color.white.opacity(0.3))
                        .frame(width: index == currentPage ? 24 : 8, height: 8)
                        .animation(.spring(response: 0.3), value: currentPage)
                }
            }
            
            // Action button
            Button(action: {
                if currentPage < pages.count - 1 {
                    withAnimation(.spring(response: 0.4)) {
                        currentPage += 1
                    }
                } else {
                    onComplete()
                    dismiss()
                }
            }) {
                HStack(spacing: 8) {
                    Text(currentPage < pages.count - 1 ? "Continue" : "Begin Your Journey")
                        .font(.system(size: 17, weight: .semibold))
                    
                    Image(systemName: currentPage < pages.count - 1 ? "arrow.right" : "sparkles")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    LinearGradient(
                        colors: [pages[currentPage].accentColor, pages[currentPage].accentColor.opacity(0.8)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: pages[currentPage].accentColor.opacity(0.3), radius: 12, y: 4)
            }
            .padding(.horizontal, 24)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 20)
            .animation(.easeOut(duration: 0.6).delay(0.5), value: appeared)
        }
        .padding(.bottom, 40)
    }
    
    // MARK: - Helpers
    
    private func startGeometryAnimation() {
        withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)) {
            geometryRotation = 360
        }
    }
}

// MARK: - Individual Page View

struct IntroPageView: View {
    let page: IntroPage
    let isActive: Bool
    
    @State private var iconScale: CGFloat = 0.5
    @State private var iconOpacity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var textOffset: CGFloat = 30
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 24) {
                Spacer()
                
                // Icon with glow
                iconSection
                
                // Text content
                textSection
                    .frame(maxWidth: geo.size.width - 48) // Ensure text fits within bounds
                
                Spacer()
                Spacer()
            }
            .frame(width: geo.size.width)
        }
        .onChange(of: isActive) { active in
            if active {
                animateIn()
            } else {
                resetAnimation()
            }
        }
        .onAppear {
            if isActive {
                animateIn()
            }
        }
    }
    
    private var iconSection: some View {
        ZStack {
            // Glow behind icon
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            page.accentColor.opacity(0.3),
                            page.accentColor.opacity(0.1),
                            .clear
                        ],
                        center: .center,
                        startRadius: 20,
                        endRadius: 60
                    )
                )
                .frame(width: 120, height: 120)
                .scaleEffect(iconScale * 1.2)
            
            // Icon circle
            Circle()
                .fill(page.accentColor.opacity(0.15))
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(page.accentColor.opacity(0.3), lineWidth: 1)
                )
                .scaleEffect(iconScale)
            
            // Icon
            Image(systemName: page.icon)
                .font(.system(size: 40, weight: .light))
                .foregroundColor(page.accentColor)
                .scaleEffect(iconScale)
        }
        .opacity(iconOpacity)
    }
    
    private var textSection: some View {
        VStack(spacing: 16) {
            // Title
            Text(page.title)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            // Subtitle
            Text(page.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(page.accentColor)
                .tracking(1)
                .multilineTextAlignment(.center)
            
            // Divider
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.clear, page.accentColor.opacity(0.5), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 60, height: 2)
                .padding(.vertical, 8)
            
            // Body text - with explicit padding to prevent clipping
            Text(page.bodyText)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.horizontal, 16)
                .fixedSize(horizontal: false, vertical: true)
        }
        .opacity(textOpacity)
        .offset(y: textOffset)
    }
    
    private func animateIn() {
        // Reset first
        iconScale = 0.5
        iconOpacity = 0
        textOpacity = 0
        textOffset = 30
        
        // Animate icon
        withAnimation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.1)) {
            iconScale = 1
            iconOpacity = 1
        }
        
        // Animate text
        withAnimation(.easeOut(duration: 0.5).delay(0.3)) {
            textOpacity = 1
            textOffset = 0
        }
    }
    
    private func resetAnimation() {
        iconScale = 0.5
        iconOpacity = 0
        textOpacity = 0
        textOffset = 30
    }
}

// MARK: - Flower of Life Shape

struct FlowerOfLifeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 4
        
        // Center circle
        path.addEllipse(in: CGRect(
            x: center.x - radius,
            y: center.y - radius,
            width: radius * 2,
            height: radius * 2
        ))
        
        // Six surrounding circles
        for i in 0..<6 {
            let angle = CGFloat(i) * .pi / 3
            let circleCenter = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            path.addEllipse(in: CGRect(
                x: circleCenter.x - radius,
                y: circleCenter.y - radius,
                width: radius * 2,
                height: radius * 2
            ))
        }
        
        // Outer ring of 12 circles
        for i in 0..<12 {
            let angle = CGFloat(i) * .pi / 6
            let circleCenter = CGPoint(
                x: center.x + radius * 2 * cos(angle),
                y: center.y + radius * 2 * sin(angle)
            )
            path.addEllipse(in: CGRect(
                x: circleCenter.x - radius,
                y: circleCenter.y - radius,
                width: radius * 2,
                height: radius * 2
            ))
        }
        
        return path
    }
}

// MARK: - Compact Info Button (for Auth Screens)

struct ApertureInfoButton: View {
    @State private var showIntroduction = false
    
    var body: some View {
        Button(action: {
            showIntroduction = true
        }) {
            HStack(spacing: 6) {
                Image(systemName: "info.circle")
                    .font(.system(size: 14))
                Text("About Aperture")
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.1))
            .clipShape(Capsule())
        }
        .fullScreenCover(isPresented: $showIntroduction) {
            ApertureIntroductionView(onComplete: {})
        }
    }
}

// MARK: - Quick Info Sheet (Lighter Version)

struct ApertureQuickInfoSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    headerSection
                    
                    // What is Aperture
                    infoSection(
                        icon: "eye.fill",
                        title: "What is Aperture?",
                        text: "Aperture is a consciousness education platform designed for curious minds who want to explore ideas beyond mainstream discourse. We curate alternative perspectives, ancient wisdom, and tools for personal growth.",
                        color: Palette.accent.gold
                    )
                    
                    // Our Approach
                    infoSection(
                        icon: "scale.3d",
                        title: "Our Approach",
                        text: "We present multiple viewpoints and encourage you to think critically. We cite sources, acknowledge uncertainty, and never claim to have all the answers. Your conclusions are your own.",
                        color: Palette.primary.cyan
                    )
                    
                    // What You'll Find
                    whatYoullFindSection
                    
                    // Trust statement
                    trustSection
                }
                .padding(24)
            }
            .background(Color(hex: "#0a0a1a").ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Palette.accent.gold)
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "eye.fill")
                .font(.system(size: 40))
                .foregroundColor(Palette.accent.gold)
            
            Text("About Aperture")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("Open Your Eyes")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.accent.gold.opacity(0.8))
                .tracking(2)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }
    
    private func infoSection(icon: String, title: String, text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(color)
                
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.8))
                .lineSpacing(4)
        }
        .padding(16)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private var whatYoullFindSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What You'll Discover")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
            
            featureRow(icon: "book.closed.fill", text: "Suppressed historical texts & Gnostic manuscripts", color: Palette.primary.violet)
            featureRow(icon: "brain.head.profile", text: "Consciousness practices & meditation tools", color: Color.green)
            featureRow(icon: "lightbulb.fill", text: "Critical thinking frameworks", color: Palette.accent.gold)
            featureRow(icon: "globe.americas.fill", text: "Alternative perspectives on history & society", color: Palette.primary.cyan)
            featureRow(icon: "heart.fill", text: "Personal growth & awakening resources", color: Color.pink)
        }
        .padding(16)
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func featureRow(icon: String, text: String, color: Color) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(color)
                .frame(width: 24)
            
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
            
            Spacer()
        }
    }
    
    private var trustSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "checkmark.shield.fill")
                .font(.system(size: 24))
                .foregroundColor(Color.green)
            
            Text("Question Everything")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Text("Including us. We encourage healthy skepticism and independent verification. Your journey of discovery is yours alone.")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .lineSpacing(3)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.green.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Preview

#Preview("Introduction") {
    ApertureIntroductionView(onComplete: {})
}

#Preview("Info Button") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        ApertureInfoButton()
    }
}

#Preview("Quick Info Sheet") {
    ApertureQuickInfoSheet()
}
