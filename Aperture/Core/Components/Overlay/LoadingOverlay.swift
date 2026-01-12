import SwiftUI

struct LoadingOverlay: View {
    
    
    let message: String
    @State private var rotationAngle: Double = 0
    @State private var pulseScale: CGFloat = 1.0
    
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                sacredGeometryLoader
                
                Text(message)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.1, green: 0.05, blue: 0.2))
            )
        }
    }
    
    
    private var sacredGeometryLoader: some View {
        
        ZStack {
            
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [Color.orange, Color.purple, Color.orange],
                        center: .center
                    ),
                    lineWidth: 3
                )
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(rotationAngle))
                .animation(.linear(duration: 2.0).repeatForever(autoreverses: false), value: rotationAngle)
                .onAppear { rotationAngle = 360 }
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.orange, Color.orange.opacity(0.3)],
                        center: .center,
                        startRadius: 0,
                        endRadius: 20
                    )
                )
                .frame(width: 30, height: 30)
                .scaleEffect(pulseScale)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: pulseScale)
                .onAppear { pulseScale = 1.3 }
        }
    }
}
