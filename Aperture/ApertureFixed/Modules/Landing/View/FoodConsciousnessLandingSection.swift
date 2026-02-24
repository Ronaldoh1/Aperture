import SwiftUI

// MARK: - Food Consciousness Landing Section

struct FoodConsciousnessLandingSection: View {
    @State private var foodPulse = false
    @State private var drinkPulse = false
    @State private var showFoodView = false
    @State private var showDrinksView = false
    
    var body: some View {
        VStack(spacing: 16) {
            // Section Header
            HStack {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                Text("Body Consciousness")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            
            // Animated Buttons
            HStack(spacing: 12) {
                // Food Scanner Button
                Button(action: {
                    HapticManager.shared.medium()
                    showFoodView = true
                }) {
                    ZStack {
                        // Animated background glow
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.green.opacity(foodPulse ? 0.4 : 0.2),
                                        Color.green.opacity(0.1)
                                    ],
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: foodPulse ? 100 : 80
                                )
                            )
                        
                        // Content
                        VStack(spacing: 12) {
                            ZStack {
                                // Rotating ring
                                Circle()
                                    .strokeBorder(
                                        AngularGradient(
                                            colors: [.green, .green.opacity(0.3), .green],
                                            center: .center
                                        ),
                                        lineWidth: 2
                                    )
                                    .frame(width: 50, height: 50)
                                    .rotationEffect(.degrees(foodPulse ? 360 : 0))
                                
                                Image(systemName: "fork.knife")
                                    .font(.title2)
                                    .foregroundColor(.green)
                                    .scaleEffect(foodPulse ? 1.1 : 1.0)
                            }
                            
                            VStack(spacing: 4) {
                                Text("Food Scanner")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                                
                                Text("Expose toxic ingredients")
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                            }
                            
                            // Danger indicator
                            HStack(spacing: 4) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.caption2)
                                Text("Fast Food Exposed")
                                    .font(.caption2.bold())
                            }
                            .foregroundColor(.red)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red.opacity(0.2))
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                    .frame(height: 160)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(
                                        LinearGradient(
                                            colors: [.green.opacity(0.5), .green.opacity(0.2)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                            )
                    )
                }
                .buttonStyle(ScaleButtonStyle())
                
                // Drinks Scanner Button
                Button(action: {
                    HapticManager.shared.medium()
                    showDrinksView = true
                }) {
                    ZStack {
                        // Animated background glow
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.orange.opacity(drinkPulse ? 0.4 : 0.2),
                                        Color.orange.opacity(0.1)
                                    ],
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: drinkPulse ? 100 : 80
                                )
                            )
                        
                        // Content
                        VStack(spacing: 12) {
                            ZStack {
                                // Bubbling effect
                                ForEach(0..<3, id: \.self) { i in
                                    Circle()
                                        .fill(Color.orange.opacity(0.3))
                                        .frame(width: drinkPulse ? 8 : 4, height: drinkPulse ? 8 : 4)
                                        .offset(
                                            x: CGFloat.random(in: -15...15),
                                            y: drinkPulse ? -20 : 0
                                        )
                                        .opacity(drinkPulse ? 0 : 0.8)
                                }
                                
                                Image(systemName: "cup.and.saucer.fill")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .scaleEffect(drinkPulse ? 1.1 : 1.0)
                            }
                            .frame(width: 50, height: 50)
                            
                            VStack(spacing: 4) {
                                Text("Drinks Exposed")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                                
                                Text("Sugar & chemical dangers")
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                            }
                            
                            // Sugar warning
                            HStack(spacing: 4) {
                                Image(systemName: "cube.fill")
                                    .font(.caption2)
                                Text("Hidden Sugars")
                                    .font(.caption2.bold())
                            }
                            .foregroundColor(.pink)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.pink.opacity(0.2))
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                    .frame(height: 160)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(
                                        LinearGradient(
                                            colors: [.orange.opacity(0.5), .orange.opacity(0.2)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                            )
                    )
                }
                .buttonStyle(ScaleButtonStyle())
            }
            
            // Hydration Reminder Banner
            NavigationLink(destination: FoodConsciousnessView()) {
                HStack(spacing: 12) {
                    Image(systemName: "drop.fill")
                        .font(.title3)
                        .foregroundColor(.cyan)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Stay Hydrated")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                        Text("Your body is 60% water")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.cyan.opacity(0.5))
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [.cyan.opacity(0.2), .blue.opacity(0.1)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
            }
        }
        .onAppear {
            startAnimations()
        }
        .sheet(isPresented: $showFoodView) {
            NavigationView {
                FoodConsciousnessView()
            }
        }
        .sheet(isPresented: $showDrinksView) {
            NavigationView {
                ToxicDrinksView()
            }
        }
    }
    
    private func startAnimations() {
        // Food pulse
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            foodPulse = true
        }
        
        // Drink pulse with offset
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                drinkPulse = true
            }
        }
    }
}

// MARK: - Compact Version for More Tab

struct FoodConsciousnessCompactCard: View {
    var body: some View {
        NavigationLink(destination: FoodConsciousnessView()) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.green.opacity(0.3), .green.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "leaf.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Food Consciousness")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Scan ingredients, expose fast food & drinks")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
        }
    }
}

// MARK: - Preview

struct FoodConsciousnessLandingSection_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            FoodConsciousnessLandingSection()
                .padding()
        }
    }
}
