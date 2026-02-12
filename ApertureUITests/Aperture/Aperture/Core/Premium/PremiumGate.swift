// PremiumGate.swift
// Gating component for premium features

import SwiftUI

// MARK: - Premium Status

class PremiumStatus: ObservableObject {

    static let shared = PremiumStatus()

    @Published var isPremium: Bool = false
    @Published var trialDaysRemaining: Int = 7

    private init() {
        // Load from UserDefaults or backend
        loadPremiumStatus()
    }

    func loadPremiumStatus() {
        // TODO: Integrate with StoreKit / RevenueCat / Backend
        isPremium = UserDefaults.standard.bool(forKey: "isPremium")
    }

    func upgradeToPremium() {
        isPremium = true
        UserDefaults.standard.set(true, forKey: "isPremium")
    }

}

// MARK: - Premium Gate View

struct PremiumGateView<Content: View>: View {

    @ObservedObject private var premiumStatus = PremiumStatus.shared
    @State private var showUpgradeSheet = false

    let featureName: String
    let content: () -> Content

    init(featureName: String, @ViewBuilder content: @escaping () -> Content) {
        self.featureName = featureName
        self.content = content
    }

    var body: some View {

        if premiumStatus.isPremium {
            content()
        } else {
            lockedView
                .sheet(isPresented: $showUpgradeSheet) {
                    UpgradeSheet()
                }
        }

    }

    private var lockedView: some View {

        ZStack {

            Color.black.ignoresSafeArea()

            VStack(spacing: 24) {

                Spacer()

                ZStack {

                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Palette.accent.gold.opacity(0.3), Color.clear],
                                center: .center,
                                startRadius: 30,
                                endRadius: 100
                            )
                        )
                        .frame(width: 180, height: 180)

                    Image(systemName: "lock.fill")
                        .font(.system(size: 60))
                        .foregroundColor(Palette.accent.gold)

                }

                VStack(spacing: 12) {

                    Text("PREMIUM FEATURE")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                        .tracking(2)

                    Text(featureName)
                        .font(.system(size: 24, weight: .black, design: .rounded))
                        .foregroundColor(.white)

                    Text("Unlock this feature to master your flow state and optimize your circadian rhythm.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                }

                VStack(spacing: 16) {

                    featureRow(icon: "sun.max.fill", text: "Enter flow on command")
                    featureRow(icon: "clock.fill", text: "Calibrate your circadian rhythm")
                    featureRow(icon: "list.bullet.rectangle", text: "Step-by-step protocols")
                    featureRow(icon: "brain.head.profile", text: "Science-backed triggers")

                }
                .padding(.top, 20)

                Spacer()

                VStack(spacing: 12) {

                    Button(action: { showUpgradeSheet = true }) {
                        HStack(spacing: 10) {
                            Image(systemName: "crown.fill")
                            Text("Unlock Premium")
                        }
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Palette.accent.gold, Palette.primary.orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(14)
                    }

                    Text("7-day free trial • Cancel anytime")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.muted)

                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)

            }

        }

    }

    private func featureRow(icon: String, text: String) -> some View {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(Palette.accent.gold)
                .frame(width: 24)

            Text(text)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.primary)

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 16))
                .foregroundColor(Palette.accent.gold.opacity(0.6))

        }
        .padding(.horizontal, 40)

    }

}

// MARK: - Upgrade Sheet

struct UpgradeSheet: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var premiumStatus = PremiumStatus.shared
    @State private var selectedPlan: PricingPlan = .yearly

    var body: some View {

        ZStack {

            Color.black.ignoresSafeArea()

            ScrollView {

                VStack(spacing: 24) {

                    headerSection

                    plansSection

                    featuresSection

                    purchaseButton

                    legalText

                    Spacer(minLength: 40)

                }
                .padding(24)

            }

        }

    }

    private var headerSection: some View {

        VStack(spacing: 16) {

            HStack {
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(Palette.text.secondary)
                }
            }

            Image(systemName: "crown.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Text("SunFlow Premium")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text("Master your flow state. Optimize your rhythm.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

        }

    }

    private var plansSection: some View {

        VStack(spacing: 12) {

            ForEach(PricingPlan.allCases, id: \.self) { plan in
                planCard(plan)
            }

        }

    }

    private func planCard(_ plan: PricingPlan) -> some View {

        let isSelected = selectedPlan == plan

        return Button(action: { selectedPlan = plan }) {

            HStack {

                VStack(alignment: .leading, spacing: 4) {

                    HStack(spacing: 8) {
                        Text(plan.name)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)

                        if plan == .yearly {
                            Text("BEST VALUE")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Palette.accent.gold)
                                .cornerRadius(4)
                        }
                    }

                    Text(plan.description)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.muted)

                }

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text(plan.price)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Palette.accent.gold)

                    Text(plan.perMonth)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }

            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? Palette.accent.gold.opacity(0.15) : Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isSelected ? Palette.accent.gold : Color.white.opacity(0.1), lineWidth: isSelected ? 2 : 1)
                    )
            )

        }

    }

    private var featuresSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("WHAT YOU GET")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(Palette.accent.gold)
                .tracking(1)

            VStack(spacing: 10) {
                premiumFeature("SunFlow State - complete flow mastery")
                premiumFeature("Circadian calibration tools")
                premiumFeature("5 flow protocols with step-by-step guidance")
                premiumFeature("14 science-backed flow triggers")
                premiumFeature("Sleep architecture optimization")
                premiumFeature("Chronotype assessment")
                premiumFeature("Flow tracking & metrics")
                premiumFeature("New content added monthly")
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )

    }

    private func premiumFeature(_ text: String) -> some View {

        HStack(spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 14))
                .foregroundColor(Palette.accent.gold)
            Text(text)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Palette.text.primary)
            Spacer()
        }

    }

    private var purchaseButton: some View {

        Button(action: {
            // TODO: Integrate StoreKit purchase
            premiumStatus.upgradeToPremium()
            dismiss()
        }) {
            HStack(spacing: 10) {
                Text("Start 7-Day Free Trial")
                Image(systemName: "arrow.right")
            }
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                LinearGradient(
                    colors: [Palette.accent.gold, Palette.primary.orange],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(14)
        }

    }

    private var legalText: some View {

        Text("After your free trial, \(selectedPlan.price) will be charged to your Apple ID. Subscription automatically renews unless cancelled at least 24 hours before the end of the current period.")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(Palette.text.muted)
            .multilineTextAlignment(.center)

    }

}

// MARK: - Pricing Plan

enum PricingPlan: CaseIterable {

    case monthly
    case yearly

    var name: String {
        switch self {
        case .monthly: return "Monthly"
        case .yearly: return "Yearly"
        }
    }

    var price: String {
        switch self {
        case .monthly: return "$9.99"
        case .yearly: return "$59.99"
        }
    }

    var perMonth: String {
        switch self {
        case .monthly: return "/month"
        case .yearly: return "$5/month"
        }
    }

    var description: String {
        switch self {
        case .monthly: return "Billed monthly"
        case .yearly: return "Billed annually • Save 50%"
        }
    }

}
