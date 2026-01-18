//
//  TutorialPageView.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/18/26.
//

// TutorialPageView.swift

import SwiftUI

struct TutorialPageView: View {

    let page: TutorialPageModel

    var body: some View {

        VStack(spacing: 18) {

            Spacer(minLength: 30)

            ZStack {

                StarTetrahedron()
                    .stroke(Palette.primary.cyan.opacity(0.10), lineWidth: 1)
                    .frame(width: 260, height: 260)
                    .blendMode(.screen)
                    .blur(radius: 0.6)

                FlowerOfLife()
                    .stroke(Palette.primary.violet.opacity(0.10), lineWidth: 1)
                    .frame(width: 220, height: 220)
                    .blendMode(.screen)
                    .blur(radius: 0.6)

                Image(systemName: page.systemImage)
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Palette.primary.cyan.opacity(0.95),
                                Palette.primary.violet.opacity(0.85),
                                Palette.primary.gold.opacity(0.70)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }

            Text(page.title)
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .multilineTextAlignment(.center)
                .cosmicFormWidth(maxWidth: 520)

            Text(page.subtitle)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .cosmicFormWidth(maxWidth: 520)

            Spacer(minLength: 30)

        }
        .padding(.horizontal, 24)
    }

}
