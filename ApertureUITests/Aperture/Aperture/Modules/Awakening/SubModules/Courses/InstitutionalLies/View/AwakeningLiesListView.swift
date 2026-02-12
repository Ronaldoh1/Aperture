// AwakeningLiesListView.swift

import SwiftUI

struct AwakeningLiesListView: View {

    @State private var selectedCategory: LieCategory? = nil

    var body: some View {

        ZStack {

            CosmicBackground(starCount: 40)

            ScrollView(showsIndicators: false) {

                VStack(spacing: 20) {

                    headerSection

                    categoryFilter

                    liesSection

                    Spacer(minLength: 100)

                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

            }

        }
        .navigationTitle("25 Lies")
        .navigationBarTitleDisplayMode(.inline)

    }

    private var headerSection: some View {

        VStack(spacing: 8) {

            Text("THE PROGRAMMING")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.primary.violet)
                .tracking(2)

            Text("Beliefs installed during childhood that people report recognizing after awakening. Pick one per week. Examine what it cost you.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)

        }
        .padding(.bottom, 8)

    }

    private var categoryFilter: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 10) {

                categoryChip(nil, label: "All")

                ForEach(LieCategory.allCases, id: \.self) { category in
                    categoryChip(category, label: category.rawValue)
                }

            }
            .padding(.horizontal, 4)

        }

    }

    private func categoryChip(_ category: LieCategory?, label: String) -> some View {

        let isSelected = selectedCategory == category

        return Button(action: { selectedCategory = category }) {
            HStack(spacing: 6) {
                if let cat = category {
                    Image(systemName: cat.icon)
                        .font(.system(size: 12))
                }
                Text(label)
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(isSelected ? Palette.primary.violet : Color.white.opacity(0.1))
            )
            .foregroundColor(isSelected ? .white : Palette.text.secondary)
        }

    }

    private var liesSection: some View {

        let lies = filteredLies

        return VStack(spacing: 12) {

            ForEach(lies) { lie in
                lieCard(lie)
            }

        }

    }

    private var filteredLies: [AwakeningLie] {
        if let category = selectedCategory {
            return AwakeningLie.byCategory(category)
        }
        return AwakeningLie.all
    }

    private func lieCard(_ lie: AwakeningLie) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack(alignment: .top, spacing: 12) {

                ZStack {
                    Circle()
                        .fill(lie.category.color.opacity(0.2))
                        .frame(width: 36, height: 36)

                    Text("\(lie.number)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(lie.category.color)
                }

                VStack(alignment: .leading, spacing: 4) {

                    Text("THE LIE")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(Palette.primary.red)
                        .tracking(1)

                    Text("\"\(lie.lie)\"")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .italic()

                }

            }

            VStack(alignment: .leading, spacing: 4) {

                Text("THE TRUTH")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(1)

                Text(lie.truth)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.secondary)
                    .lineSpacing(4)

            }
            .padding(.leading, 48)

            HStack {
                Spacer()
                Text(lie.category.rawValue)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(lie.category.color)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(lie.category.color.opacity(0.2))
                    )
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lie.category.color.opacity(0.2), lineWidth: 1)
                )
        )

    }

}
