// QuantumNourishDisclaimers.swift
// DISCLAIMER SYSTEM — Legal & Ethical Guardrails
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Disclaimer Types

enum DisclaimerType: String, CaseIterable {
  case medical = "Medical"
  case nutritional = "Nutritional"
  case fitness = "Fitness"
  case supplement = "Supplement"
  case fasting = "Fasting"
  case frequency = "Frequency"

  var icon: String {
    switch self {
    case .medical: return "cross.case.fill"
    case .nutritional: return "leaf.fill"
    case .fitness: return "figure.run"
    case .supplement: return "pills.fill"
    case .fasting: return "clock.fill"
    case .frequency: return "waveform.path.ecg"
    }
  }

  var color: Color {
    switch self {
    case .medical: return Color(hex: "#E74C3C")
    case .nutritional: return Color(hex: "#2ECC71")
    case .fitness: return Color(hex: "#3498DB")
    case .supplement: return Color(hex: "#9B59B6")
    case .fasting: return Color(hex: "#F39C12")
    case .frequency: return Color(hex: "#1ABC9C")
    }
  }

  var shortText: String {
    switch self {
    case .medical:
      return
        "Not medical advice. Consult a licensed healthcare provider before making changes to your diet or health regimen."
    case .nutritional:
      return
        "Nutritional information is for educational purposes only. Individual needs vary. Consult a registered dietitian for personalized guidance."
    case .fitness:
      return
        "Not a substitute for professional athletic training. Consult your physician before starting any exercise or nutrition program."
    case .supplement:
      return
        "Supplement information is educational only. Not evaluated by the FDA. Consult your healthcare provider before taking any supplement."
    case .fasting:
      return
        "Fasting protocols are not appropriate for everyone. Do not fast if pregnant, nursing, diabetic, or under 18. Consult your doctor first."
    case .frequency:
      return
        "Frequency/MHz values are based on alternative wellness models and are not recognized by mainstream medical science. Use as an educational framework."
    }
  }

  var fullText: String {
    switch self {
    case .medical:
      return """
        MEDICAL DISCLAIMER

        The content provided in Quantum Nourish is for informational and educational purposes only. It is not intended to be a substitute for professional medical advice, diagnosis, or treatment.

        Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition. Never disregard professional medical advice or delay in seeking it because of something you have read in this application.

        If you think you may have a medical emergency, call your doctor, go to the emergency department, or call 911 immediately.

        Quantum Nourish does not recommend or endorse any specific tests, physicians, products, procedures, opinions, or other information that may be mentioned within the app.

        Reliance on any information provided by Quantum Nourish is solely at your own risk.

        References: American College of Gastroenterology guidelines, FDA consumer education standards.
        """
    case .nutritional:
      return """
        NUTRITIONAL DISCLAIMER

        Nutritional information, food frequency data, and dietary suggestions provided in Quantum Nourish are for educational purposes only.

        Individual nutritional needs vary based on age, sex, health status, activity level, medications, and other factors. The information presented is based on research available as of 2025 and may not reflect the most current findings.

        We encourage users to conduct their own additional research and consult with a registered dietitian or nutritionist for personalized dietary advice.

        Food frequency (MHz) values are drawn from alternative wellness research and bioresonance models. These measurements are not universally accepted by mainstream nutritional science and should be used as an educational framework, not as medical guidance.

        Quantum Nourish will continue to update its database as new research becomes available.
        """
    case .fitness:
      return """
        FITNESS & EXERCISE DISCLAIMER

        The exercise and fitness nutrition information in Quantum Nourish is designed for educational purposes and general guidance only.

        Before beginning any exercise program or making significant changes to your diet for athletic performance, consult with your physician, especially if you have any pre-existing health conditions, injuries, or are taking medications.

        Not all exercises or dietary protocols are suitable for everyone. Discontinue any exercise that causes pain, dizziness, or discomfort and consult your healthcare provider.

        The sport-specific meal plans provided are based on publicly available nutritional research as of 2025. Individual needs vary significantly based on body composition, training intensity, recovery needs, and health status.

        We are not certified personal trainers, sports nutritionists, or medical doctors. This content does not replace professional athletic coaching or sports medicine guidance.
        """
    case .supplement:
      return """
        SUPPLEMENT DISCLAIMER

        Information about dietary supplements, vitamins, minerals, and herbal products in Quantum Nourish is provided for educational purposes only.

        These statements have not been evaluated by the Food and Drug Administration (FDA). This product/information is not intended to diagnose, treat, cure, or prevent any disease.

        Quantum Nourish does not sell, endorse, or recommend any specific supplement brands or products. We provide ingredient awareness and educational information to help you make informed decisions.

        Always read supplement labels carefully. Consult your healthcare provider before taking any dietary supplement, especially if you are pregnant, nursing, taking medication, or have a medical condition.

        Supplement quality varies significantly between manufacturers. Look for third-party testing certifications (NSF, USP, ConsumerLab).
        """
    case .fasting:
      return """
        FASTING & DETOX DISCLAIMER

        Fasting and detoxification protocols described in Quantum Nourish are for educational purposes only.

        DO NOT fast or undertake any detox protocol if you:
        • Are pregnant or nursing
        • Are under 18 years of age
        • Have diabetes or blood sugar disorders
        • Have a history of eating disorders
        • Are taking prescription medications (especially blood thinners, insulin, or blood pressure medications)
        • Have kidney or liver disease
        • Are underweight or malnourished

        Always consult your physician before beginning any fasting or detoxification program. Extended fasting should be supervised by a healthcare professional.

        If you experience dizziness, fainting, severe headaches, heart palpitations, or any concerning symptoms during a fast, break the fast immediately and seek medical attention.
        """
    case .frequency:
      return """
        FREQUENCY & VIBRATIONAL DISCLAIMER

        The MHz frequency values and vibrational classifications used in Quantum Nourish are based on alternative wellness research, including work by Bruce Tainio and bioresonance models.

        These measurements are not universally accepted by mainstream science or recognized by the FDA, AMA, or other regulatory bodies. They are presented as an educational framework for exploring the relationship between food choices and wellbeing.

        Quantum Nourish uses frequency as a metaphorical and educational lens — not as a diagnostic tool or medical measurement.

        The absence of mainstream scientific validation does not necessarily invalidate these concepts, but users should be aware that this framework exists outside conventional nutritional science.

        We encourage critical thinking and personal research alongside the use of this tool.
        """
    }
  }
}

// MARK: - Disclaimer Banner View (Compact)

struct DisclaimerBanner: View {
  let type: DisclaimerType
  @State private var showFull = false

  var body: some View {
    VStack(spacing: 0) {
      Button {
        withAnimation(.easeInOut(duration: 0.25)) { showFull.toggle() }
      } label: {
        HStack(spacing: 8) {
          Image(systemName: type.icon)
            .font(.system(size: 11))
            .foregroundColor(type.color.opacity(0.7))

          Text(type.shortText)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(Palette.text.muted)
            .multilineTextAlignment(.leading)
            .lineLimit(showFull ? nil : 2)

          Spacer(minLength: 4)

          Image(systemName: showFull ? "chevron.up" : "info.circle")
            .font(.system(size: 10))
            .foregroundColor(type.color.opacity(0.5))
        }
        .padding(10)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .fill(type.color.opacity(0.04))
            .overlay(
              RoundedRectangle(cornerRadius: 8).stroke(type.color.opacity(0.1), lineWidth: 0.5))
        )
      }
      .buttonStyle(.plain)

      if showFull {
        Text(type.fullText)
          .font(.system(size: 10, weight: .regular))
          .foregroundColor(Palette.text.muted)
          .padding(12)
          .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
          .transition(.opacity.combined(with: .move(edge: .top)))
      }
    }
  }
}

// MARK: - Multi-Disclaimer Stack

struct DisclaimerStack: View {
  let types: [DisclaimerType]

  var body: some View {
    VStack(spacing: 6) {
      ForEach(types, id: \.rawValue) { type in
        DisclaimerBanner(type: type)
      }
    }
  }
}

// MARK: - First-Launch Consent View

struct QuantumNourishConsentView: View {
  @Binding var hasConsented: Bool

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      ScrollView(showsIndicators: false) {
        VStack(spacing: 20) {
          Image(systemName: "leaf.fill")
            .font(.system(size: 40))
            .foregroundColor(Color(hex: "#2ECC71"))
            .padding(.top, 40)

          Text("QUANTUM NOURISH")
            .font(.system(size: 10, weight: .bold)).tracking(4)
            .foregroundColor(Color(hex: "#2ECC71"))

          Text("Before We Begin")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)

          Text(
            "Quantum Nourish is an educational tool for exploring the relationship between food choices and consciousness. Please read and acknowledge the following:"
          )
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 20)

          ForEach([DisclaimerType.medical, .nutritional, .frequency], id: \.rawValue) { type in
            VStack(alignment: .leading, spacing: 8) {
              HStack(spacing: 6) {
                Image(systemName: type.icon).foregroundColor(type.color)
                Text(type.rawValue.uppercased()).font(.system(size: 10, weight: .bold)).tracking(1)
                  .foregroundColor(type.color)
              }
              Text(type.shortText)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(type.color.opacity(0.04))
                .overlay(
                  RoundedRectangle(cornerRadius: 12).stroke(type.color.opacity(0.15), lineWidth: 1))
            )
          }
          .padding(.horizontal, 20)

          Button {
            hasConsented = true
            UserDefaults.standard.set(true, forKey: "quantum_nourish_consent")
          } label: {
            Text("I UNDERSTAND — LET'S GO")
              .font(.system(size: 14, weight: .bold, design: .rounded))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(16)
              .background(RoundedRectangle(cornerRadius: 14).fill(Color(hex: "#2ECC71")))
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)

          Text("You can review these disclaimers anytime from the Quantum Nourish settings.")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(Palette.text.muted)
            .padding(.bottom, 40)
        }
      }
    }
  }
}
