// MatrixEducationView.swift
// THE MATRIX DECODED - 10 LAYER EDUCATION

import SwiftUI

struct MatrixEducationView: View {
  @State private var progress: MatrixEducationProgress = .default
  @State private var selectedLayer: MatrixLayer?
  @Environment(\.dismiss) var dismiss

  private let layers = MatrixLayerDatabase.shared.layers

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        // Custom header
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text("The Matrix Decoded").font(.system(size: 20, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text("Understanding the system is the first step").font(
              .system(size: 13, weight: .medium, design: .rounded)
            ).foregroundColor(Palette.primary.red)
          }
          Spacer()
          Button(action: { dismiss() }) {
            Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)

        ScrollView {
          VStack(spacing: 24) {
            headerSection
            progressSection
            layerList
            if !progress.hasCompletedAllLayers { unlockMessage }
            importantInsight
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .sheet(item: $selectedLayer) { layer in
      LayerDetailView(layer: layer, progress: $progress)
    }
    .onAppear { loadProgress() }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.primary.red.opacity(0.4), Color.clear], center: .center,
              startRadius: 0, endRadius: 50)
          )
          .frame(width: 100, height: 100)
        Text("🔴").font(.system(size: 50))
      }

      Text("10 Layers of Control")
        .font(.system(size: 22, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text(
        "Most people think awakening means discovering a hidden layer.\nIt usually means seeing that the layers exist at all."
      )
      .font(.system(size: 14, weight: .medium, design: .rounded))
      .foregroundColor(Palette.text.secondary)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(.vertical, 8)
  }

  // MARK: - Progress Section

  private var progressSection: some View {
    VStack(spacing: 12) {
      HStack {
        Text("Understanding Progress")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
        Spacer()
        Text("\(progress.layersCompleted.count)/10")
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(progress.hasCompletedAllLayers ? Color.green : Palette.primary.cyan)
      }

      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 5)
            .fill(Color.white.opacity(0.1))
            .frame(height: 10)

          RoundedRectangle(cornerRadius: 5)
            .fill(
              LinearGradient(
                colors: [
                  Palette.primary.red, Palette.primary.orange, Palette.accent.gold, Color.green,
                  Palette.primary.cyan,
                ],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: geo.size.width * progress.completionPercentage, height: 10)
        }
      }
      .frame(height: 10)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            Palette.primary.cyan.opacity(0.2), lineWidth: 1))
    )
  }

  // MARK: - Layer List

  private var layerList: some View {
    VStack(spacing: 12) {
      ForEach(layers) { layer in
        LayerCard(layer: layer, isCompleted: progress.layersCompleted.contains(layer.id))
          .onTapGesture { selectedLayer = layer }
      }
    }
  }

  // MARK: - Unlock Message

  private var unlockMessage: some View {
    VStack(spacing: 12) {
      HStack(spacing: 8) {
        Image(systemName: "lock.fill").font(.system(size: 18)).foregroundColor(Palette.accent.gold)
        Text("Complete all 10 layers to unlock full tools")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }

      Text("Daily Check-In • Cognitive Dissonance Log\nReality Audit • Question Bank")
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.muted)
        .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            Palette.accent.gold.opacity(0.3), lineWidth: 1))
    )
  }

  // MARK: - Important Insight

  private var importantInsight: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Text("🔍").font(.system(size: 18))
        Text("KEY INSIGHT").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1)
          .foregroundColor(Palette.primary.cyan)
      }

      Text(
        "You do not smash the Matrix. You debug it.\n\nThe exit is not rage or rejection. It is pattern recognition, boundary setting, and reclaiming agency one layer at a time."
      )
      .font(.system(size: 14, weight: .medium, design: .rounded))
      .foregroundColor(Palette.text.primary)
      .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Palette.primary.cyan.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            Palette.primary.cyan.opacity(0.3), lineWidth: 1))
    )
  }

  // MARK: - Methods

  private func loadProgress() {
    let storage = AwakeningStorage()
    _ = storage.loadProfile()
    // Map from profile to education progress if stored
    // For now, use separate storage
    if let data = UserDefaults.standard.data(forKey: "matrix_education_progress"),
      let saved = try? JSONDecoder().decode(MatrixEducationProgress.self, from: data)
    {
      progress = saved
    }
  }

  private func saveProgress() {
    if let data = try? JSONEncoder().encode(progress) {
      UserDefaults.standard.set(data, forKey: "matrix_education_progress")
    }
  }
}

// MARK: - Layer Card

struct LayerCard: View {
  let layer: MatrixLayer
  let isCompleted: Bool

  var body: some View {
    HStack(spacing: 14) {
      // Layer number circle
      ZStack {
        Circle()
          .fill(layer.color.opacity(isCompleted ? 1.0 : 0.25))
          .frame(width: 48, height: 48)

        if isCompleted {
          Image(systemName: "checkmark")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
        } else {
          Text("\(layer.id)")
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
      }

      // Info
      VStack(alignment: .leading, spacing: 4) {
        Text(layer.name)
          .font(.system(size: 15, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(layer.subtitle)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
          .lineLimit(1)
      }

      Spacer()

      // Difficulty indicator
      VStack(alignment: .trailing, spacing: 4) {
        Circle()
          .fill(layer.breakingDifficulty.color)
          .frame(width: 8, height: 8)

        Image(systemName: "chevron.right")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(isCompleted ? layer.color.opacity(0.5) : Color.white.opacity(0.1), lineWidth: 1)
        )
    )
  }
}
