// QuantumHealthKitBridge.swift
// HEALTHKIT BRIDGE — Consciousness Meets Biometrics
// Correlate food frequency with sleep, HRV, activity, mindfulness
// ☀️ SunFlow: Reignited

import Foundation
import HealthKit
import SwiftUI

class QuantumHealthKitBridge: ObservableObject {
    static let shared = QuantumHealthKitBridge()
    
    private let healthStore = HKHealthStore()
    @Published var isAuthorized = false
    @Published var latestSleepHours: Double = 0
    @Published var latestHRV: Double = 0
    @Published var latestRestingHR: Double = 0
    @Published var latestMindfulMinutes: Double = 0
    @Published var latestSteps: Int = 0
    @Published var correlationInsight: String = ""
    
    // MARK: - Authorization
    
    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else { return }
        
        let readTypes: Set<HKObjectType> = [
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.categoryType(forIdentifier: .mindfulSession)!,
            HKObjectType.quantityType(forIdentifier: .dietaryWater)!,
        ]
        
        // We can also write custom Quantum Nourish data
        let writeTypes: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .dietaryWater)!,
        ]
        
        healthStore.requestAuthorization(toShare: writeTypes, read: readTypes) { [weak self] success, error in
            DispatchQueue.main.async {
                self?.isAuthorized = success
                if success {
                    self?.fetchAllMetrics()
                }
            }
        }
    }
    
    // MARK: - Fetch Metrics
    
    func fetchAllMetrics() {
        fetchSleep()
        fetchHRV()
        fetchRestingHR()
        fetchSteps()
        fetchMindfulMinutes()
    }
    
    private func fetchSleep() {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else { return }
        
        let now = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        let predicate = HKQuery.predicateForSamples(withStart: yesterday, end: now, options: .strictEndDate)
        
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] _, results, _ in
            let totalSleep = results?.compactMap { $0 as? HKCategorySample }
                .filter { $0.value == HKCategoryValueSleepAnalysis.asleepUnspecified.rawValue }
                .reduce(0.0) { $0 + $1.endDate.timeIntervalSince($1.startDate) } ?? 0
            
            DispatchQueue.main.async {
                self?.latestSleepHours = totalSleep / 3600
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchHRV() {
        guard let hrvType = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN) else { return }
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: hrvType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { [weak self] _, results, _ in
            if let sample = results?.first as? HKQuantitySample {
                DispatchQueue.main.async {
                    self?.latestHRV = sample.quantity.doubleValue(for: HKUnit.secondUnit(with: .milli))
                }
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchRestingHR() {
        guard let hrType = HKObjectType.quantityType(forIdentifier: .restingHeartRate) else { return }
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: hrType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { [weak self] _, results, _ in
            if let sample = results?.first as? HKQuantitySample {
                DispatchQueue.main.async {
                    self?.latestRestingHR = sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))
                }
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchSteps() {
        guard let stepType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { [weak self] _, statistics, _ in
            let steps = statistics?.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
            DispatchQueue.main.async {
                self?.latestSteps = Int(steps)
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchMindfulMinutes() {
        guard let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) else { return }
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: mindfulType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] _, results, _ in
            let totalMinutes = results?.reduce(0.0) { $0 + $1.endDate.timeIntervalSince($1.startDate) / 60 } ?? 0
            DispatchQueue.main.async {
                self?.latestMindfulMinutes = totalMinutes
            }
        }
        healthStore.execute(query)
    }
    
    // MARK: - Correlation Engine
    
    func generateInsight(dailyMhz: Int) -> String {
        var insights: [String] = []
        
        // Sleep correlation
        if latestSleepHours < 6 {
            insights.append("Sleep deficit detected (\(String(format: "%.1f", latestSleepHours))h). Low sleep disrupts gut microbiome — your food frequency absorption drops ~30%. Prioritize 7-9 hours tonight.")
        } else if latestSleepHours >= 8 {
            insights.append("Excellent sleep (\(String(format: "%.1f", latestSleepHours))h). Deep sleep enhances nutrient absorption and pineal melatonin production. Your body is primed to receive high-frequency foods today.")
        }
        
        // HRV correlation
        if latestHRV > 0 {
            if latestHRV < 30 {
                insights.append("Low HRV (\(Int(latestHRV))ms) suggests stress. Focus on gut-brain axis foods today: fermented vegetables, bone broth, magnesium-rich foods. Your vagus nerve needs support.")
            } else if latestHRV > 60 {
                insights.append("Strong HRV (\(Int(latestHRV))ms) — your nervous system is coherent. Perfect day for high-frequency superfoods and a raw meal.")
            }
        }
        
        // Activity correlation
        if latestSteps > 8000 {
            insights.append("Active day (\(latestSteps) steps). Your mitochondria are fired up — feed them CoQ10-rich foods and stay hydrated with mineralized water.")
        }
        
        // Mindfulness correlation
        if latestMindfulMinutes > 10 {
            insights.append("Meditation logged (\(Int(latestMindfulMinutes)) min). Meditative states enhance digestive enzyme production. Eat consciously today — your body is in receive mode.")
        }
        
        // MHz correlation
        if dailyMhz >= 72 {
            insights.append("Your food frequency is at \(dailyMhz) MHz — above the consciousness threshold. You're in the zone. Maintain with living sprouts and spring water.")
        } else if dailyMhz > 0 && dailyMhz < 50 {
            insights.append("Current frequency is \(dailyMhz) MHz — below optimal. Consider adding spirulina, turmeric, or raw green juice to elevate before tonight's rest cycle.")
        }
        
        return insights.joined(separator: "\n\n")
    }
}

// MARK: - HealthKit Dashboard View

struct QuantumBiometricsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var health = QuantumHealthKitBridge.shared
    @State private var dailyMhz: Int = 55 // Would come from tracker
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            Image(systemName: "heart.text.square.fill").font(.system(size: 48)).foregroundColor(Color(hex: "#FF6B6B"))
                            Text("QUANTUM BIOMETRICS").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(Color(hex: "#FF6B6B"))
                            Text("Your Body's Frequency Report").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        }
                        .padding(.top, 12)
                        
                        if !health.isAuthorized {
                            // Request auth
                            VStack(spacing: 12) {
                                Image(systemName: "heart.circle").font(.system(size: 40)).foregroundColor(.pink)
                                Text("Connect Apple Health to correlate your biometrics with food frequency. See how sleep, HRV, and activity affect your vibrational state.")
                                    .font(.system(size: 14, weight: .medium)).foregroundColor(Palette.text.secondary).multilineTextAlignment(.center)
                                
                                Button {
                                    health.requestAuthorization()
                                } label: {
                                    Text("CONNECT HEALTH DATA")
                                        .font(.system(size: 14, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity).padding(14)
                                        .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#FF6B6B")))
                                }
                            }
                            .padding(20)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.04)))
                        } else {
                            // Metrics grid
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                metricCard(label: "Sleep", value: String(format: "%.1fh", health.latestSleepHours), icon: "moon.zzz.fill", color: Color(hex: "#9B59B6"), ideal: "7-9h")
                                metricCard(label: "HRV", value: "\(Int(health.latestHRV))ms", icon: "waveform.path.ecg", color: Color(hex: "#2ECC71"), ideal: "50+ms")
                                metricCard(label: "Resting HR", value: "\(Int(health.latestRestingHR)) bpm", icon: "heart.fill", color: Color(hex: "#E74C3C"), ideal: "<65 bpm")
                                metricCard(label: "Steps", value: "\(health.latestSteps)", icon: "figure.walk", color: Color(hex: "#3498DB"), ideal: "8,000+")
                                metricCard(label: "Mindful", value: "\(Int(health.latestMindfulMinutes)) min", icon: "brain.head.profile", color: Color(hex: "#F1C40F"), ideal: "20+ min")
                                metricCard(label: "Food MHz", value: "\(dailyMhz) MHz", icon: "leaf.fill", color: Color(hex: "#2ECC71"), ideal: "72+ MHz")
                            }
                            
                            // AI Insight
                            let insight = health.generateInsight(dailyMhz: dailyMhz)
                            if !insight.isEmpty {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack(spacing: 6) {
                                        Image(systemName: "brain").foregroundColor(Color(hex: "#9B59B6"))
                                        Text("QUANTUM INSIGHT ENGINE").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(Color(hex: "#9B59B6"))
                                    }
                                    
                                    Text(insight)
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundColor(Palette.text.secondary)
                                        .lineSpacing(4)
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(Color(hex: "#9B59B6").opacity(0.06))
                                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(hex: "#9B59B6").opacity(0.15), lineWidth: 1))
                                )
                            }
                        }
                        
                        // Explanation
                        VStack(spacing: 8) {
                            Text("🐉").font(.system(size: 24))
                            Text("\"Your body is a measuring instrument. Sleep quality, heart rate variability, and activity levels all affect how efficiently you absorb high-frequency nutrition. The data doesn't lie — and neither does your body.\"")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary).italic().multilineTextAlignment(.center).lineSpacing(4)
                        }
                        .padding(16)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Palette.accent.gold.opacity(0.06)))
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(hex: "#FF6B6B"))
                }
            }
        }
    }
    
    private func metricCard(label: String, value: String, icon: String, color: Color, ideal: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon).font(.system(size: 20)).foregroundColor(color)
            Text(value).font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
            Text(label).font(.system(size: 10, weight: .bold)).foregroundColor(Palette.text.muted)
            Text("Ideal: \(ideal)").font(.system(size: 9, weight: .medium)).foregroundColor(color.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.15), lineWidth: 1))
        )
    }
}
