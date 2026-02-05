//
//  SessionStatusPill.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/17/26.
//


import SwiftUI

struct SessionStatusPill: View {

    let message: String

    var body: some View {

        HStack(spacing: 10) {

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(0.95)

            Text(message)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.95))

        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.black.opacity(0.35))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.12), lineWidth: 1)
                )
        )
        .shadow(color: Color.black.opacity(0.35), radius: 18, x: 0, y: 10)
        .allowsHitTesting(false)

    }

}
