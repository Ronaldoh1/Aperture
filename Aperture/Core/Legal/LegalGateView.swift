// LegalGateView.swift
// Full-screen legal gate with age verification and terms acceptance
// Must be completed before accessing any app content

import SwiftUI

// MARK: - Main Legal Gate View

struct LegalGateView: View {
    
    @ObservedObject var manager = LegalGateManager.shared
    @State private var currentStep: LegalStep = .welcome
    @State private var selectedDate = Calendar.current.date(byAdding: .year, value: -25, to: Date()) ?? Date()
    @State private var ageError: String?
    @State private var termsScrolledToBottom = false
    @State private var privacyScrolledToBottom = false
    @State private var agreedToTerms = false
    @State private var agreedToPrivacy = false
    @State private var agreedToDisclaimer = false
    
    enum LegalStep: Int, CaseIterable {
        case welcome = 0
        case ageVerification = 1
        case termsOfService = 2
        case privacyPolicy = 3
        case disclaimer = 4
        case complete = 5
    }
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(hex: "#0A0A0A"),
                    Color(hex: "#1A0A15"),
                    Color(hex: "#0A0A0A")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Progress indicator
                if currentStep != .welcome && currentStep != .complete {
                    progressIndicator
                }
                
                // Content
                TabView(selection: $currentStep) {
                    welcomeStep.tag(LegalStep.welcome)
                    ageVerificationStep.tag(LegalStep.ageVerification)
                    termsStep.tag(LegalStep.termsOfService)
                    privacyStep.tag(LegalStep.privacyPolicy)
                    disclaimerStep.tag(LegalStep.disclaimer)
                    completeStep.tag(LegalStep.complete)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut(duration: 0.3), value: currentStep)
            }
        }
    }
    
    // MARK: - Progress Indicator
    
    private var progressIndicator: some View {
        HStack(spacing: 8) {
            ForEach(1..<5, id: \.self) { step in
                RoundedRectangle(cornerRadius: 2)
                    .fill(currentStep.rawValue >= step ? Color(hex: "#FFD700") : Color.white.opacity(0.2))
                    .frame(height: 4)
            }
        }
        .padding(.horizontal, 40)
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
    
    // MARK: - Step 0: Welcome
    
    private var welcomeStep: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Logo
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(hex: "#FFD700").opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                
                Image(systemName: "eye.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#FFD700"), .white],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            Text("APERTURE")
                .font(.system(size: 32, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .tracking(6)
            
            Text("AWAKENING")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(hex: "#FFD700"))
                .tracking(4)
            
            VStack(spacing: 16) {
                Text("Before we begin, we need to verify a few things to ensure this content is appropriate for you.")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                Text("This only takes a moment.")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
            Button {
                withAnimation { currentStep = .ageVerification }
            } label: {
                Text("Continue")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "#FFD700"))
                    )
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
    }
    
    // MARK: - Step 1: Age Verification
    
    private var ageVerificationStep: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "person.badge.shield.checkmark.fill")
                .font(.system(size: 50))
                .foregroundColor(Color(hex: "#FFD700"))
            
            Text("Age Verification")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
            
            Text("Aperture contains mature philosophical and spiritual content intended for adults only.")
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            // Date picker
            VStack(spacing: 12) {
                Text("Please enter your date of birth:")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                
                DatePicker(
                    "Date of Birth",
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .colorScheme(.dark)
                .frame(height: 150)
                .clipped()
                
                if let error = ageError {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text(error)
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.red)
                }
            }
            .padding(.horizontal, 30)
            
            // Age requirement notice
            HStack(spacing: 8) {
                Image(systemName: "18.circle.fill")
                    .font(.system(size: 20))
                Text("You must be 18 or older to use this app")
                    .font(.system(size: 13))
            }
            .foregroundColor(.white.opacity(0.5))
            
            Spacer()
            
            Button {
                verifyAge()
            } label: {
                Text("Verify Age")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "#FFD700"))
                    )
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
    }
    
    private func verifyAge() {
        if manager.verifyAge(dateOfBirth: selectedDate) {
            ageError = nil
            withAnimation { currentStep = .termsOfService }
        } else {
            ageError = "You must be 18 or older to use Aperture."
            HapticManager.shared.error()
        }
    }
    
    // MARK: - Step 2: Terms of Service
    
    private var termsStep: some View {
        VStack(spacing: 16) {
            // Header
            VStack(spacing: 8) {
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 36))
                    .foregroundColor(Color(hex: "#FFD700"))
                
                Text("Terms of Service")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            
            // Scrollable terms
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(LegalDocuments.termsOfService)
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                            .padding(16)
                        
                        // Bottom marker
                        Color.clear
                            .frame(height: 1)
                            .id("termsBottom")
                            .onAppear {
                                termsScrolledToBottom = true
                            }
                    }
                }
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                .padding(.horizontal, 20)
            }
            
            // Agreement checkbox
            Button {
                agreedToTerms.toggle()
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: agreedToTerms ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundColor(agreedToTerms ? Color(hex: "#FFD700") : .white.opacity(0.4))
                    
                    Text("I have read and agree to the Terms of Service")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            
            // Continue button
            Button {
                manager.acceptTerms()
                withAnimation { currentStep = .privacyPolicy }
            } label: {
                Text("Continue")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(agreedToTerms ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(agreedToTerms ? Color(hex: "#FFD700") : Color.gray.opacity(0.3))
                    )
            }
            .disabled(!agreedToTerms)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
    
    // MARK: - Step 3: Privacy Policy
    
    private var privacyStep: some View {
        VStack(spacing: 16) {
            // Header
            VStack(spacing: 8) {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 36))
                    .foregroundColor(Color(hex: "#FFD700"))
                
                Text("Privacy Policy")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            
            // Scrollable privacy policy
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(LegalDocuments.privacyPolicy)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(16)
                    
                    Color.clear
                        .frame(height: 1)
                        .id("privacyBottom")
                        .onAppear {
                            privacyScrolledToBottom = true
                        }
                }
            }
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            // Agreement checkbox
            Button {
                agreedToPrivacy.toggle()
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: agreedToPrivacy ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundColor(agreedToPrivacy ? Color(hex: "#FFD700") : .white.opacity(0.4))
                    
                    Text("I have read and agree to the Privacy Policy")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            
            // Continue button
            Button {
                manager.acceptPrivacy()
                withAnimation { currentStep = .disclaimer }
            } label: {
                Text("Continue")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(agreedToPrivacy ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(agreedToPrivacy ? Color(hex: "#FFD700") : Color.gray.opacity(0.3))
                    )
            }
            .disabled(!agreedToPrivacy)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
    
    // MARK: - Step 4: Content Disclaimer
    
    private var disclaimerStep: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                
                Text("Content Disclaimer")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            
            // Scrollable disclaimer
            ScrollView {
                Text(LegalDocuments.contentDisclaimer)
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.85))
                    .padding(16)
            }
            .background(Color.orange.opacity(0.1))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.orange.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal, 20)
            
            // Agreement checkbox
            Button {
                agreedToDisclaimer.toggle()
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: agreedToDisclaimer ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundColor(agreedToDisclaimer ? .orange : .white.opacity(0.4))
                    
                    Text("I understand and accept these notices")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            
            // Complete button
            Button {
                manager.completeConsent()
                withAnimation { currentStep = .complete }
            } label: {
                Text("I Understand, Let Me In")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(agreedToDisclaimer ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(agreedToDisclaimer ? Color(hex: "#FFD700") : Color.gray.opacity(0.3))
                    )
            }
            .disabled(!agreedToDisclaimer)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
    
    // MARK: - Step 5: Complete
    
    private var completeStep: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Success animation
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color.green.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.green)
            }
            
            Text("Welcome, Seeker")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text("Your journey begins now.")
                .font(.system(size: 17))
                .foregroundColor(.white.opacity(0.7))
            
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Age verified")
                        .foregroundColor(.white.opacity(0.6))
                }
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Terms accepted")
                        .foregroundColor(.white.opacity(0.6))
                }
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Privacy acknowledged")
                        .foregroundColor(.white.opacity(0.6))
                }
            }
            .font(.system(size: 14))
            
            Spacer()
            
            Text("Opening your eyes...")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color(hex: "#FFD700"))
            
            Spacer()
        }
        .onAppear {
            // Auto-dismiss after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    manager.showLegalGate = false
                }
            }
        }
    }
}

// MARK: - Legal Info Button (for Settings)

struct LegalInfoButton: View {
    
    @State private var showTerms = false
    @State private var showPrivacy = false
    
    var body: some View {
        VStack(spacing: 12) {
            Button {
                showTerms = true
            } label: {
                HStack {
                    Image(systemName: "doc.text")
                    Text("Terms of Service")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.3))
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
            
            Button {
                showPrivacy = true
            } label: {
                HStack {
                    Image(systemName: "lock.shield")
                    Text("Privacy Policy")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.3))
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
        }
        .sheet(isPresented: $showTerms) {
            LegalDocumentView(title: "Terms of Service", content: LegalDocuments.termsOfService)
        }
        .sheet(isPresented: $showPrivacy) {
            LegalDocumentView(title: "Privacy Policy", content: LegalDocuments.privacyPolicy)
        }
    }
}

// MARK: - Legal Document Viewer

struct LegalDocumentView: View {
    
    let title: String
    let content: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0A0A0A").ignoresSafeArea()
                
                ScrollView {
                    Text(content)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.85))
                        .padding(20)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    LegalGateView()
}
