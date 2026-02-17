// BothSidesDeprogrammingView.swift
// The compassionate deprogramming flow that works for BOTH sides

import SwiftUI

struct BothSidesDeprogrammingView: View {
  @Environment(\.dismiss) private var dismiss

  @State private var selectedSide: PoliticalSide?
  @State private var currentPhase: DeprogrammingPhase = .selectSide
  @State private var revealedReceipts: Set<String> = []
  @State private var showNextButton = false
  @State private var animateCompletion = false

  var body: some View {
    ZStack {
      // Background
      Color.black.ignoresSafeArea()

      // Stars
      StarsBackgroundView()

      VStack(spacing: 0) {
        // Header
        header

        // Progress indicator
        progressIndicator

        // Content based on phase
        ScrollView {
          VStack(spacing: 24) {
            switch currentPhase {
            case .selectSide:
              selectSideContent
            case .validation:
              validationContent
            case .expansion:
              expansionContent
            case .machine:
              machineContent
            case .whoBenefits:
              whoBenefitsContent
            case .commonGround:
              commonGroundContent
            case .invitation:
              invitationContent
            }
          }
          .padding()
          .padding(.bottom, 100)
        }

        // Navigation
        if showNextButton && currentPhase != .selectSide {
          nextButton
        }
      }
    }
    .navigationBarHidden(true)
  }

  // MARK: - Header

  private var header: some View {
    HStack {
      Button {
        if currentPhase == .selectSide {
          dismiss()
        } else if let prevPhase = DeprogrammingPhase(rawValue: currentPhase.rawValue - 1) {
          withAnimation { currentPhase = prevPhase }
        }
      } label: {
        Image(systemName: currentPhase == .selectSide ? "xmark" : "chevron.left")
          .font(.system(size: 18, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()

      Text(currentPhase.title)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Spacer()

      // Balance
      Color.clear.frame(width: 44)
    }
    .padding()
  }

  // MARK: - Progress

  private var progressIndicator: some View {
    HStack(spacing: 4) {
      ForEach(DeprogrammingPhase.allCases, id: \.rawValue) { phase in
        Capsule()
          .fill(phase.rawValue <= currentPhase.rawValue ? Color.purple : Color.white.opacity(0.2))
          .frame(height: 4)
      }
    }
    .padding(.horizontal)
  }

  // MARK: - Phase 0: Select Side

  private var selectSideContent: some View {
    VStack(spacing: 32) {
      Text("Before we begin...")
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text("Which side of the political divide\ndo you typically identify with?")
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)

      Text("(This helps us show you what you might not have seen)")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center)

      HStack(spacing: 20) {
        sideButton(.democrat)
        sideButton(.republican)
      }

      Button {
        // Neither - show both perspectives
        selectedSide = .democrat  // Default, will show both
        advancePhase()
      } label: {
        Text("Neither / Independent")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.purple)
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
          .background(
            Capsule()
              .stroke(Color.purple, lineWidth: 1)
          )
      }

      Text("🔒 This is private and helps personalize your experience")
        .font(.system(size: 11))
        .foregroundColor(.white.opacity(0.4))
    }
    .padding(.top, 40)
  }

  private func sideButton(_ side: PoliticalSide) -> some View {
    Button {
      selectedSide = side
      HapticManager.shared.medium()
      advancePhase()
    } label: {
      VStack(spacing: 12) {
        Text(side.emoji)
          .font(.system(size: 48))

        Text(side.rawValue)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)
      }
      .frame(width: 140, height: 140)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(side.color.opacity(0.2))
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(side.color.opacity(0.5), lineWidth: 2)
          )
      )
    }
  }

  // MARK: - Phase 1: Validation

  private var validationContent: some View {
    VStack(spacing: 24) {
      let otherSide = selectedSide?.otherSide ?? .republican

      Text("You're right about the \(otherSide.rawValue)s...")
        .font(.system(size: 22, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)

      Text("Here are the receipts:")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      let receipts =
        otherSide == .democrat ? BothSidesData.democratReceipts : BothSidesData.republicanReceipts

      ForEach(receipts) { receipt in
        receiptCard(receipt, color: otherSide.color)
          .opacity(revealedReceipts.contains(receipt.id.uuidString) ? 1 : 0)
          .offset(y: revealedReceipts.contains(receipt.id.uuidString) ? 0 : 20)
      }
    }
    .onAppear {
      animateReceipts(
        selectedSide?.otherSide == .democrat
          ? BothSidesData.democratReceipts : BothSidesData.republicanReceipts)
    }
  }

  // MARK: - Phase 2: Expansion

  private var expansionContent: some View {
    VStack(spacing: 24) {
      let yourSide = selectedSide ?? .democrat

      Text("But here's what\nyour side did too...")
        .font(.system(size: 22, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)

      Text("These are also receipts:")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      let receipts =
        yourSide == .democrat ? BothSidesData.democratReceipts : BothSidesData.republicanReceipts

      ForEach(receipts) { receipt in
        receiptCard(receipt, color: yourSide.color)
          .opacity(revealedReceipts.contains(receipt.id.uuidString) ? 1 : 0)
          .offset(y: revealedReceipts.contains(receipt.id.uuidString) ? 0 : 20)
      }
    }
    .onAppear {
      revealedReceipts.removeAll()
      let yourSide = selectedSide ?? .democrat
      animateReceipts(
        yourSide == .democrat ? BothSidesData.democratReceipts : BothSidesData.republicanReceipts)
    }
  }

  private func receiptCard(_ receipt: PoliticalReceipt, color: Color) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Image(systemName: receipt.icon)
          .font(.system(size: 16))
          .foregroundColor(color)

        Text(receipt.claim)
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)
      }

      Text(receipt.receipt)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white.opacity(0.8))

      Text("Source: \(receipt.source)")
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.4))
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(color.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(color.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Phase 3: The Machine

  private var machineContent: some View {
    VStack(spacing: 24) {
      Text("THE MACHINE")
        .font(.system(size: 24, weight: .black, design: .rounded))
        .foregroundColor(.purple)

      Text("Same issues. Same actions.\nDifferent packaging.")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)

      ForEach(BothSidesData.machineReceipts) { receipt in
        machineCard(receipt)
          .opacity(revealedReceipts.contains(receipt.id.uuidString) ? 1 : 0)
          .offset(y: revealedReceipts.contains(receipt.id.uuidString) ? 0 : 20)
      }
    }
    .onAppear {
      revealedReceipts.removeAll()
      animateMachineReceipts()
    }
  }

  private func machineCard(_ receipt: BothSidesData.MachineReceipt) -> some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: receipt.icon)
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(.purple)

        Text(receipt.issue)
          .font(.system(size: 16, weight: .black))
          .foregroundColor(.white)

        Spacer()
      }

      HStack(spacing: 12) {
        VStack(alignment: .leading, spacing: 4) {
          Text("🔵 Democrats")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.blue)

          Text(receipt.democratAction)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        VStack(alignment: .leading, spacing: 4) {
          Text("🔴 Republicans")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.red)

          Text(receipt.republicanAction)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }

      HStack {
        Text("WHO WINS:")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.white.opacity(0.5))

        Text(receipt.whoWins)
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.yellow)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.purple.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Phase 4: Who Benefits

  private var whoBenefitsContent: some View {
    VStack(spacing: 24) {
      Text("WHO ACTUALLY BENEFITS?")
        .font(.system(size: 22, weight: .black, design: .rounded))
        .foregroundColor(.yellow)

      Text("Follow the money...")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      ForEach(BothSidesData.beneficiaries) { beneficiary in
        beneficiaryCard(beneficiary)
          .opacity(revealedReceipts.contains(beneficiary.id.uuidString) ? 1 : 0)
          .offset(y: revealedReceipts.contains(beneficiary.id.uuidString) ? 0 : 20)
      }
    }
    .onAppear {
      revealedReceipts.removeAll()
      animateBeneficiaries()
    }
  }

  private func beneficiaryCard(_ beneficiary: BothSidesData.Beneficiary) -> some View {
    HStack(spacing: 12) {
      Image(systemName: beneficiary.icon)
        .font(.system(size: 24))
        .foregroundColor(beneficiary.bipartisan ? .yellow : .gray)
        .frame(width: 40)

      VStack(alignment: .leading, spacing: 4) {
        Text(beneficiary.who)
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(beneficiary.bipartisan ? .white : .gray)

        Text(beneficiary.howTheyWin)
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()

      if beneficiary.bipartisan {
        Text("🔴🔵")
          .font(.system(size: 14))
      }
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .fill(beneficiary.bipartisan ? Color.yellow.opacity(0.1) : Color.gray.opacity(0.1))
    )
  }

  // MARK: - Phase 5: Common Ground

  private var commonGroundContent: some View {
    VStack(spacing: 24) {
      Text("WHAT YOU BOTH SEE")
        .font(.system(size: 22, weight: .black, design: .rounded))
        .foregroundColor(.purple)

      Text("You have more in common\nthan you've been told.")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)

      ForEach(BothSidesData.commonGround) { ground in
        commonGroundCard(ground)
          .opacity(revealedReceipts.contains(ground.id.uuidString) ? 1 : 0)
          .offset(y: revealedReceipts.contains(ground.id.uuidString) ? 0 : 20)
      }
    }
    .onAppear {
      revealedReceipts.removeAll()
      animateCommonGround()
    }
  }

  private func commonGroundCard(_ ground: BothSidesData.CommonGround) -> some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: ground.icon)
          .font(.system(size: 18))
          .foregroundColor(.purple)

        Text(ground.issue)
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)

        Spacer()
      }

      HStack(spacing: 8) {
        Text("🔵")
        Text(ground.democratConcern)
          .font(.system(size: 10))
          .foregroundColor(.blue)
      }
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 8) {
        Text("🔴")
        Text(ground.republicanConcern)
          .font(.system(size: 10))
          .foregroundColor(.red)
      }
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 8) {
        Text("💜")
        Text(ground.actualTruth)
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.purple)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.purple.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Phase 6: Invitation

  private var invitationContent: some View {
    VStack(spacing: 32) {
      Text("THE INVITATION")
        .font(.system(size: 28, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)

      VStack(spacing: 16) {
        Text("🔴 + 🔵 = 💜")
          .font(.system(size: 48))

        Text("Not enemies.\nNeighbors who were tricked into fighting.")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white.opacity(0.9))
          .multilineTextAlignment(.center)
      }

      VStack(spacing: 12) {
        invitationLine("LEFT deported more. RIGHT deports louder.", "SAME families separated.")
        invitationLine(
          "LEFT bailed out banks. RIGHT bailed out corporations.", "SAME taxpayers paid.")
        invitationLine(
          "LEFT expanded surveillance. RIGHT expanded surveillance.", "SAME citizens watched.")
      }

      VStack(spacing: 8) {
        Text("The fight isn't LEFT vs RIGHT.")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white.opacity(0.8))

        Text("It never was.")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)

        Text("The fight is UP vs DOWN.")
          .font(.system(size: 18, weight: .black))
          .foregroundColor(.purple)

        Text("The PEOPLE vs The MACHINE.")
          .font(.system(size: 18, weight: .black))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(.top, 16)

      VStack(spacing: 8) {
        Text("Pattern recognition isn't left or right.")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.7))

        Text("It's UP. ⬆️")
          .font(.system(size: 24, weight: .black))
          .foregroundColor(Palette.accent.gold)

        Text("Welcome to the elevation. 🔺")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.purple)
      }
      .padding(.top, 16)

      if animateCompletion {
        Button {
          HapticManager.shared.success()
          dismiss()
        } label: {
          Text("I'm Ready to See More")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .background(
              Capsule()
                .fill(Palette.accent.gold)
            )
        }
        .padding(.top, 24)
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        withAnimation {
          animateCompletion = true
        }
      }
    }
  }

  private func invitationLine(_ contrast: String, _ result: String) -> some View {
    VStack(spacing: 4) {
      Text(contrast)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      Text(result)
        .font(.system(size: 13, weight: .bold))
        .foregroundColor(.white)
    }
  }

  // MARK: - Next Button

  private var nextButton: some View {
    Button {
      advancePhase()
    } label: {
      Text(currentPhase == .invitation ? "Complete" : "Continue")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.purple)
        )
    }
    .padding()
    .background(Color.black)
  }

  // MARK: - Helpers

  private func advancePhase() {
    HapticManager.shared.medium()
    showNextButton = false
    revealedReceipts.removeAll()

    if let nextPhase = DeprogrammingPhase(rawValue: currentPhase.rawValue + 1) {
      withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
        currentPhase = nextPhase
      }
    }
  }

  private func animateReceipts(_ receipts: [PoliticalReceipt]) {
    for (index, receipt) in receipts.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
          _ = revealedReceipts.insert(receipt.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + Double(receipts.count) * 0.3 + 0.5) {
      withAnimation { showNextButton = true }
    }
  }

  private func animateMachineReceipts() {
    for (index, receipt) in BothSidesData.machineReceipts.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
          _ = revealedReceipts.insert(receipt.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(
      deadline: .now() + Double(BothSidesData.machineReceipts.count) * 0.3 + 0.5
    ) {
      withAnimation { showNextButton = true }
    }
  }

  private func animateBeneficiaries() {
    for (index, beneficiary) in BothSidesData.beneficiaries.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.25) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
          _ = revealedReceipts.insert(beneficiary.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(
      deadline: .now() + Double(BothSidesData.beneficiaries.count) * 0.25 + 0.5
    ) {
      withAnimation { showNextButton = true }
    }
  }

  private func animateCommonGround() {
    for (index, ground) in BothSidesData.commonGround.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.35) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
          _ = revealedReceipts.insert(ground.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(
      deadline: .now() + Double(BothSidesData.commonGround.count) * 0.35 + 0.5
    ) {
      withAnimation { showNextButton = true }
    }
  }
}

// MARK: - Stars Background (simplified)

private struct StarsBackgroundView: View {
  var body: some View {
    GeometryReader { geo in
      ForEach(0..<50, id: \.self) { _ in
        Circle()
          .fill(Color.white.opacity(Double.random(in: 0.1...0.5)))
          .frame(width: CGFloat.random(in: 1...3))
          .position(
            x: CGFloat.random(in: 0...geo.size.width),
            y: CGFloat.random(in: 0...geo.size.height)
          )
      }
    }
  }
}

// MARK: - Preview

#Preview {
  BothSidesDeprogrammingView()
}
