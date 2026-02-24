// GodModeStorage.swift
// Persistence layer for GodMode data
// Stores reality shifts, SATS sessions, 3-6-9 encodings, etc.

import Foundation
import Combine

@MainActor
class GodModeStorage: ObservableObject {
    
    static let shared = GodModeStorage()
    
    // MARK: - Published Data
    
    @Published private(set) var realityShifts: [RealityShift] = []
    @Published private(set) var satsSessions: [SATSSession] = []
    @Published private(set) var threeSixNineSessions: [ThreeSixNineSession] = []
    @Published private(set) var revisionEntries: [RevisionEntry] = []
    @Published private(set) var mentalDietEntries: [MentalDietEntry] = []
    @Published private(set) var solarSyncSessions: [SolarSyncSession] = []
    @Published private(set) var bardoPractices: [BardoPractice] = []
    @Published private(set) var synchronicities: [Synchronicity] = []
    @Published private(set) var monadCheckIns: [MonadCheckIn] = []
    @Published private(set) var vibrationShields: [VibrationShield] = []
    
    // MARK: - Keys
    
    private let keys = (
        shifts: "godmode.reality.shifts.v1",
        sats: "godmode.sats.sessions.v1",
        threeSixNine: "godmode.369.sessions.v1",
        revision: "godmode.revision.entries.v1",
        mentalDiet: "godmode.mental.diet.v1",
        solarSync: "godmode.solar.sync.v1",
        bardo: "godmode.bardo.practices.v1",
        synchronicities: "godmode.synchronicities.v1",
        checkIns: "godmode.checkins.v1",
        shields: "godmode.shields.v1"
    )
    
    // MARK: - Initialization
    
    private init() {
        loadAllData()
    }
    
    // MARK: - Reality Shifts
    
    func addRealityShift(_ shift: RealityShift) {
        realityShifts.append(shift)
        saveRealityShifts()
        GodModeManager.shared.completeRealityShift()
    }
    
    func updateRealityShift(_ shift: RealityShift) {
        if let index = realityShifts.firstIndex(where: { $0.id == shift.id }) {
            realityShifts[index] = shift
            saveRealityShifts()
        }
    }
    
    func deleteRealityShift(_ shift: RealityShift) {
        realityShifts.removeAll { $0.id == shift.id }
        saveRealityShifts()
    }
    
    func recordSATSForShift(shiftId: UUID) {
        if var shift = realityShifts.first(where: { $0.id == shiftId }) {
            shift.completedNights += 1
            
            // Update status based on progress
            if shift.completedNights >= 21 {
                shift.status = .manifesting
            } else if shift.completedNights >= 7 {
                shift.status = .embodying
            }
            
            updateRealityShift(shift)
        }
    }
    
    // MARK: - SATS Sessions
    
    func addSATSSession(_ session: SATSSession) {
        satsSessions.append(session)
        saveSATSSessions()
        
        // Update related shift if any
        if let shiftId = session.relatedShiftId {
            recordSATSForShift(shiftId: shiftId)
        }
        
        GodModeManager.shared.recordDailyPractice()
    }
    
    // MARK: - 3-6-9 Sessions
    
    func addThreeSixNineSession(_ session: ThreeSixNineSession) {
        threeSixNineSessions.append(session)
        saveThreeSixNineSessions()
        
        if session.isComplete {
            GodModeManager.shared.completeRealityShift()
        }
        
        GodModeManager.shared.recordDailyPractice()
    }
    
    // MARK: - Revision Entries
    
    func addRevisionEntry(_ entry: RevisionEntry) {
        revisionEntries.append(entry)
        saveRevisionEntries()
        GodModeManager.shared.recordDailyPractice()
    }
    
    // MARK: - Mental Diet
    
    func addMentalDietEntry(_ entry: MentalDietEntry) {
        mentalDietEntries.append(entry)
        saveMentalDietEntries()
    }
    
    // MARK: - Solar Sync
    
    func addSolarSyncSession(_ session: SolarSyncSession) {
        solarSyncSessions.append(session)
        saveSolarSyncSessions()
        GodModeManager.shared.recordDailyPractice()
    }
    
    // MARK: - Bardo Practices
    
    func addBardoPractice(_ practice: BardoPractice) {
        bardoPractices.append(practice)
        saveBardoPractices()
        GodModeManager.shared.recordDailyPractice()
    }
    
    // MARK: - Synchronicities
    
    func addSynchronicity(_ sync: Synchronicity) {
        synchronicities.append(sync)
        saveSynchronicities()
        
        // Attach to related shift if specified
        if let shiftId = sync.relatedShiftId,
           var shift = realityShifts.first(where: { $0.id == shiftId }) {
            shift.synchronicities.append(sync)
            updateRealityShift(shift)
        }
    }
    
    // MARK: - Monad Check-Ins
    
    func addMonadCheckIn(_ checkIn: MonadCheckIn) {
        monadCheckIns.append(checkIn)
        saveMonadCheckIns()
        GodModeManager.shared.recordDailyPractice()
    }
    
    func todaysCheckIn() -> MonadCheckIn? {
        let calendar = Calendar.current
        return monadCheckIns.first { calendar.isDateInToday($0.date) }
    }
    
    // MARK: - Vibration Shields
    
    func updateShields(_ shields: [VibrationShield]) {
        vibrationShields = shields
        saveVibrationShields()
    }
    
    func toggleShield(_ shield: VibrationShield) {
        if let index = vibrationShields.firstIndex(where: { $0.id == shield.id }) {
            vibrationShields[index].isActive.toggle()
            saveVibrationShields()
        }
    }
    
    // MARK: - Statistics
    
    var totalSATSSessions: Int { satsSessions.count }
    
    var totalPracticeMinutes: Int {
        satsSessions.reduce(0) { $0 + Int($1.duration / 60) }
    }
    
    var averageVibrationLevel: Double {
        guard !monadCheckIns.isEmpty else { return 5.0 }
        let total = monadCheckIns.reduce(0) { $0 + $1.vibrationLevel }
        return Double(total) / Double(monadCheckIns.count)
    }
    
    var activeShiftsCount: Int {
        realityShifts.filter { $0.status != .realized && $0.status != .revised }.count
    }
    
    var realizedShiftsCount: Int {
        realityShifts.filter { $0.status == .realized }.count
    }
    
    // MARK: - Persistence
    
    private func loadAllData() {
        realityShifts = load(key: keys.shifts) ?? []
        satsSessions = load(key: keys.sats) ?? []
        threeSixNineSessions = load(key: keys.threeSixNine) ?? []
        revisionEntries = load(key: keys.revision) ?? []
        mentalDietEntries = load(key: keys.mentalDiet) ?? []
        solarSyncSessions = load(key: keys.solarSync) ?? []
        bardoPractices = load(key: keys.bardo) ?? []
        synchronicities = load(key: keys.synchronicities) ?? []
        monadCheckIns = load(key: keys.checkIns) ?? []
        vibrationShields = load(key: keys.shields) ?? VibrationShield.presets
    }
    
    private func load<T: Codable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private func save<T: Codable>(_ value: T, key: String) {
        if let data = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func saveRealityShifts() { save(realityShifts, key: keys.shifts) }
    private func saveSATSSessions() { save(satsSessions, key: keys.sats) }
    private func saveThreeSixNineSessions() { save(threeSixNineSessions, key: keys.threeSixNine) }
    private func saveRevisionEntries() { save(revisionEntries, key: keys.revision) }
    private func saveMentalDietEntries() { save(mentalDietEntries, key: keys.mentalDiet) }
    private func saveSolarSyncSessions() { save(solarSyncSessions, key: keys.solarSync) }
    private func saveBardoPractices() { save(bardoPractices, key: keys.bardo) }
    private func saveSynchronicities() { save(synchronicities, key: keys.synchronicities) }
    private func saveMonadCheckIns() { save(monadCheckIns, key: keys.checkIns) }
    private func saveVibrationShields() { save(vibrationShields, key: keys.shields) }
    
    // MARK: - Reset
    
    func resetAllData() {
        realityShifts = []
        satsSessions = []
        threeSixNineSessions = []
        revisionEntries = []
        mentalDietEntries = []
        solarSyncSessions = []
        bardoPractices = []
        synchronicities = []
        monadCheckIns = []
        vibrationShields = VibrationShield.presets
        
        // Save all empty states
        saveRealityShifts()
        saveSATSSessions()
        saveThreeSixNineSessions()
        saveRevisionEntries()
        saveMentalDietEntries()
        saveSolarSyncSessions()
        saveBardoPractices()
        saveSynchronicities()
        saveMonadCheckIns()
        saveVibrationShields()
    }
}
