// LoadingOverlay.swift

import SwiftUI

struct LoadingOverlay: View {

    let message: String

    var body: some View {

        ZStack {

            Color.black.opacity(0.22)
                .ignoresSafeArea()

            VStack(spacing: 16) {

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.15)

                Text(message)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.92))

            }
            .padding(.horizontal, 22)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.black.opacity(0.40))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(Color.white.opacity(0.12), lineWidth: 1)
                    )
            )

        }

    }

}
