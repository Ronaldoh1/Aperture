// GoogleCalendarSync.swift
// Aperture
//
// Google Calendar OAuth Integration
// Import events, sync across devices, suggest Haikai opportunities
//
// Setup required:
// 1. Add GoogleSignIn package (SPM)
// 2. Configure OAuth in Google Cloud Console
// 3. Add URL scheme to Info.plist

import Foundation
import SwiftUI
import AuthenticationServices

// Note: For production, add these SPM dependencies:
// - https://github.com/google/GoogleSignIn-iOS
// - https://github.com/nicklockwood/SwiftFormat (optional)


// MARK: - Google Calendar Event

struct GoogleCalendarEvent: Identifiable, Codable {
    let id: String
    var title: String
    var startTime: Date
    var endTime: Date
    var isAllDay: Bool
    var location: String?
    var description: String?
    var recurringEventId: String?
    var attendees: [String]
    var calendarId: String
    var calendarName: String
    var colorHex: String?
    
    var duration: TimeInterval {
        endTime.timeIntervalSince(startTime)
    }
    
    var durationHours: Double {
        duration / 3600
    }
    
    var isMeeting: Bool {
        attendees.count > 1 || title.lowercased().contains("meeting")
    }
}


// MARK: - Google Calendar

struct GoogleCalendar: Identifiable, Codable {
    let id: String
    var name: String
    var colorHex: String
    var isPrimary: Bool
    var isSelected: Bool
}


// MARK: - Sync Status

enum CalendarSyncStatus: Equatable {
    case idle
    case syncing
    case success(lastSync: Date)
    case error(String)
}


// MARK: - Google Calendar Manager

@MainActor
final class GoogleCalendarManager: ObservableObject {
    
    static let shared = GoogleCalendarManager()
    
    // MARK: - Configuration
    
    // Replace with your OAuth credentials from Google Cloud Console
    private let clientId = "YOUR_CLIENT_ID.apps.googleusercontent.com"
    private let scopes = ["https://www.googleapis.com/auth/calendar.readonly"]
    
    // MARK: - Published State
    
    @Published var isSignedIn = false
    @Published var userEmail: String?
    @Published var userAvatar: URL?
    @Published var calendars: [GoogleCalendar] = []
    @Published var events: [GoogleCalendarEvent] = []
    @Published var syncStatus: CalendarSyncStatus = .idle
    
    // MARK: - Storage
    
    private let defaults = UserDefaults.standard
    private let accessTokenKey = "google_calendar_access_token"
    private let refreshTokenKey = "google_calendar_refresh_token"
    private let eventsKey = "google_calendar_events_cache"
    
    private var accessToken: String? {
        get { defaults.string(forKey: accessTokenKey) }
        set { defaults.set(newValue, forKey: accessTokenKey) }
    }
    
    private var refreshToken: String? {
        get { defaults.string(forKey: refreshTokenKey) }
        set { defaults.set(newValue, forKey: refreshTokenKey) }
    }
    
    
    // MARK: - Initialization
    
    init() {
        checkSignInStatus()
        loadCachedEvents()
    }
    
    
    // MARK: - Authentication
    
    /// Start OAuth sign-in flow
    func signIn() async throws {
        // For production, use GoogleSignIn SDK:
        // GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
        // This is a simplified ASWebAuthenticationSession approach
        guard let authURL = buildAuthURL() else {
            throw GoogleCalendarError.invalidConfiguration
        }
        
        // Present OAuth flow
        let callbackURL = try await performOAuth(url: authURL)
        
        // Extract authorization code
        guard let code = extractAuthCode(from: callbackURL) else {
            throw GoogleCalendarError.authorizationFailed
        }
        
        // Exchange for tokens
        try await exchangeCodeForTokens(code)
        
        isSignedIn = true
        
        // Fetch user info and calendars
        try await fetchUserInfo()
        try await fetchCalendars()
    }
    
    private func buildAuthURL() -> URL? {
        var components = URLComponents(string: "https://accounts.google.com/o/oauth2/v2/auth")
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: "com.sunflow.aperture:/oauth2callback"),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: scopes.joined(separator: " ")),
            URLQueryItem(name: "access_type", value: "offline"),
            URLQueryItem(name: "prompt", value: "consent")
        ]
        return components?.url
    }
    
    private func performOAuth(url: URL) async throws -> URL {
        try await withCheckedThrowingContinuation { continuation in
            let session = ASWebAuthenticationSession(
                url: url,
                callbackURLScheme: "com.sunflow.aperture"
            ) { callbackURL, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let callbackURL = callbackURL {
                    continuation.resume(returning: callbackURL)
                } else {
                    continuation.resume(throwing: GoogleCalendarError.authorizationFailed)
                }
            }
            
            session.prefersEphemeralWebBrowserSession = false
            session.presentationContextProvider = OAuthPresentationContext.shared
            
            if !session.start() {
                continuation.resume(throwing: GoogleCalendarError.sessionStartFailed)
            }
        }
    }
    
    private func extractAuthCode(from url: URL) -> String? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        return components?.queryItems?.first(where: { $0.name == "code" })?.value
    }
    
    private func exchangeCodeForTokens(_ code: String) async throws {
        var request = URLRequest(url: URL(string: "https://oauth2.googleapis.com/token")!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let body = [
            "code": code,
            "client_id": clientId,
            "redirect_uri": "com.sunflow.aperture:/oauth2callback",
            "grant_type": "authorization_code"
        ].map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        
        request.httpBody = body.data(using: .utf8)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw GoogleCalendarError.tokenExchangeFailed
        }
        
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
        
        accessToken = tokenResponse.accessToken
        if let refresh = tokenResponse.refreshToken {
            refreshToken = refresh
        }
    }
    
    private func refreshAccessToken() async throws {
        guard let refresh = refreshToken else {
            throw GoogleCalendarError.noRefreshToken
        }
        
        var request = URLRequest(url: URL(string: "https://oauth2.googleapis.com/token")!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let body = [
            "refresh_token": refresh,
            "client_id": clientId,
            "grant_type": "refresh_token"
        ].map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        
        request.httpBody = body.data(using: .utf8)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
        
        accessToken = tokenResponse.accessToken
    }
    
    /// Sign out and clear tokens
    func signOut() {
        accessToken = nil
        refreshToken = nil
        defaults.removeObject(forKey: eventsKey)
        isSignedIn = false
        userEmail = nil
        userAvatar = nil
        calendars = []
        events = []
        syncStatus = .idle
    }
    
    private func checkSignInStatus() {
        isSignedIn = accessToken != nil
    }
    
    
    // MARK: - Fetch Data
    
    private func fetchUserInfo() async throws {
        guard let token = accessToken else { return }
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/oauth2/v2/userinfo")!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let userInfo = try JSONDecoder().decode(GoogleUserInfo.self, from: data)
        
        userEmail = userInfo.email
        userAvatar = URL(string: userInfo.picture ?? "")
    }
    
    func fetchCalendars() async throws {
        guard let token = accessToken else { return }
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/calendar/v3/users/me/calendarList")!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
            try await refreshAccessToken()
            try await fetchCalendars()
            return
        }
        
        let calendarList = try JSONDecoder().decode(CalendarListResponse.self, from: data)
        
        calendars = calendarList.items.map { item in
            GoogleCalendar(
                id: item.id,
                name: item.summary,
                colorHex: item.backgroundColor ?? "#4285F4",
                isPrimary: item.primary ?? false,
                isSelected: item.primary ?? false
            )
        }
    }
    
    func syncEvents(for days: Int = 7) async {
        syncStatus = .syncing
        
        do {
            guard let token = accessToken else {
                syncStatus = .error("Not signed in")
                return
            }
            
            let selectedCalendarIds = calendars.filter { $0.isSelected }.map { $0.id }
            var allEvents: [GoogleCalendarEvent] = []
            
            let formatter = ISO8601DateFormatter()
            let now = Date()
            let future = Calendar.current.date(byAdding: .day, value: days, to: now)!
            
            for calendarId in selectedCalendarIds {
                let events = try await fetchEvents(
                    calendarId: calendarId,
                    token: token,
                    timeMin: formatter.string(from: now),
                    timeMax: formatter.string(from: future)
                )
                allEvents.append(contentsOf: events)
            }
            
            events = allEvents.sorted { $0.startTime < $1.startTime }
            cacheEvents()
            syncStatus = .success(lastSync: Date())
            
        } catch {
            syncStatus = .error(error.localizedDescription)
        }
    }
    
    private func fetchEvents(calendarId: String, token: String, timeMin: String, timeMax: String) async throws -> [GoogleCalendarEvent] {
        var components = URLComponents(string: "https://www.googleapis.com/calendar/v3/calendars/\(calendarId.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? calendarId)/events")!
        components.queryItems = [
            URLQueryItem(name: "timeMin", value: timeMin),
            URLQueryItem(name: "timeMax", value: timeMax),
            URLQueryItem(name: "singleEvents", value: "true"),
            URLQueryItem(name: "orderBy", value: "startTime")
        ]
        
        var request = URLRequest(url: components.url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
            try await refreshAccessToken()
            return try await fetchEvents(calendarId: calendarId, token: accessToken!, timeMin: timeMin, timeMax: timeMax)
        }
        
        let eventsResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
        let calendarName = calendars.first(where: { $0.id == calendarId })?.name ?? "Calendar"
        
        return eventsResponse.items.compactMap { item -> GoogleCalendarEvent? in
            guard let startDate = parseEventDate(item.start),
                  let endDate = parseEventDate(item.end) else {
                return nil
            }
            
            return GoogleCalendarEvent(
                id: item.id,
                title: item.summary ?? "(No title)",
                startTime: startDate,
                endTime: endDate,
                isAllDay: item.start.date != nil,
                location: item.location,
                description: item.description,
                recurringEventId: item.recurringEventId,
                attendees: item.attendees?.map { $0.email } ?? [],
                calendarId: calendarId,
                calendarName: calendarName,
                colorHex: item.colorId
            )
        }
    }
    
    private func parseEventDate(_ eventDate: EventDateTime) -> Date? {
        let formatter = ISO8601DateFormatter()
        
        if let dateTime = eventDate.dateTime {
            return formatter.date(from: dateTime)
        } else if let dateStr = eventDate.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: dateStr)
        }
        return nil
    }
    
    private func cacheEvents() {
        if let encoded = try? JSONEncoder().encode(events) {
            defaults.set(encoded, forKey: eventsKey)
        }
    }
    
    private func loadCachedEvents() {
        if let data = defaults.data(forKey: eventsKey),
           let cached = try? JSONDecoder().decode([GoogleCalendarEvent].self, from: data) {
            events = cached
        }
    }
    
    
    // MARK: - Haikai Analysis
    
    /// Analyze events for Haikai opportunities
    func analyzeForHaikai() -> [HaikaiSuggestion] {
        var suggestions: [HaikaiSuggestion] = []
        
        // Group events by day
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: events) { event in
            calendar.startOfDay(for: event.startTime)
        }
        
        for (_, dayEvents) in grouped {
            // Check for too many meetings
            let meetings = dayEvents.filter { $0.isMeeting }
            if meetings.count > 4 {
                suggestions.append(HaikaiSuggestion(
                    id: UUID(),
                    eventTitle: "\(meetings.count) meetings",
                    eventDate: dayEvents.first?.startTime ?? Date(),
                    suggestion: "Consider declining or combining some meetings",
                    timeSaved: Double(meetings.count - 4) * 0.5,
                    category: .meeting
                ))
            }
            
            // Check for short fragmented meetings
            let shortMeetings = meetings.filter { $0.durationHours < 0.5 }
            if shortMeetings.count >= 2 {
                suggestions.append(HaikaiSuggestion(
                    id: UUID(),
                    eventTitle: "Fragmented meetings",
                    eventDate: dayEvents.first?.startTime ?? Date(),
                    suggestion: "Batch \(shortMeetings.count) short meetings together",
                    timeSaved: Double(shortMeetings.count) * 0.25,
                    category: .fragmentation
                ))
            }
            
            // Check for meetings that could be async
            for event in meetings {
                let title = event.title.lowercased()
                if title.contains("sync") || title.contains("standup") || title.contains("update") || title.contains("status") {
                    suggestions.append(HaikaiSuggestion(
                        id: UUID(),
                        eventTitle: event.title,
                        eventDate: event.startTime,
                        suggestion: "Could this be an async update instead?",
                        timeSaved: event.durationHours * 0.5,
                        category: .meeting
                    ))
                }
            }
            
            // Check for meetings > 1 hour
            let longMeetings = meetings.filter { $0.durationHours > 1.0 }
            for event in longMeetings {
                suggestions.append(HaikaiSuggestion(
                    id: UUID(),
                    eventTitle: event.title,
                    eventDate: event.startTime,
                    suggestion: "Could this be shorter with an agenda?",
                    timeSaved: event.durationHours * 0.25,
                    category: .tooLong
                ))
            }
        }
        
        return suggestions
    }
    
    /// Get total meeting hours for a date range
    func meetingHours(from startDate: Date, to endDate: Date) -> Double {
        events.filter { event in
            event.isMeeting && event.startTime >= startDate && event.startTime <= endDate
        }.reduce(0) { $0 + $1.durationHours }
    }
    
    /// Find free time slots
    func findFreeSlots(on date: Date, minDuration: TimeInterval = 3600) -> [DateInterval] {
        let calendar = Calendar.current
        let dayStart = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: date)!
        let dayEnd = calendar.date(bySettingHour: 17, minute: 0, second: 0, of: date)!
        
        let dayEvents = events.filter { event in
            calendar.isDate(event.startTime, inSameDayAs: date)
        }.sorted { $0.startTime < $1.startTime }
        
        var freeSlots: [DateInterval] = []
        var currentTime = dayStart
        
        for event in dayEvents {
            if event.startTime > currentTime {
                let gap = DateInterval(start: currentTime, end: event.startTime)
                if gap.duration >= minDuration {
                    freeSlots.append(gap)
                }
            }
            currentTime = max(currentTime, event.endTime)
        }
        
        if currentTime < dayEnd {
            let gap = DateInterval(start: currentTime, end: dayEnd)
            if gap.duration >= minDuration {
                freeSlots.append(gap)
            }
        }
        
        return freeSlots
    }
}


// MARK: - API Response Models

private struct TokenResponse: Codable {
    let accessToken: String
    let refreshToken: String?
    let expiresIn: Int
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
    }
}

private struct GoogleUserInfo: Codable {
    let id: String
    let email: String
    let name: String?
    let picture: String?
}

private struct CalendarListResponse: Codable {
    let items: [CalendarItem]
}

private struct CalendarItem: Codable {
    let id: String
    let summary: String
    let backgroundColor: String?
    let primary: Bool?
}

private struct EventsResponse: Codable {
    let items: [EventItem]
}

private struct EventItem: Codable {
    let id: String
    let summary: String?
    let description: String?
    let location: String?
    let start: EventDateTime
    let end: EventDateTime
    let recurringEventId: String?
    let attendees: [Attendee]?
    let colorId: String?
}

private struct EventDateTime: Codable {
    let date: String?
    let dateTime: String?
    let timeZone: String?
}

private struct Attendee: Codable {
    let email: String
}


// MARK: - OAuth Presentation Context

private class OAuthPresentationContext: NSObject, ASWebAuthenticationPresentationContextProviding {
    static let shared = OAuthPresentationContext()
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return UIWindow()
        }
        return window
    }
}


// MARK: - Errors

enum GoogleCalendarError: Error, LocalizedError {
    case invalidConfiguration
    case authorizationFailed
    case sessionStartFailed
    case tokenExchangeFailed
    case noRefreshToken
    case networkError
    
    var errorDescription: String? {
        switch self {
        case .invalidConfiguration: return "Invalid OAuth configuration"
        case .authorizationFailed: return "Authorization failed"
        case .sessionStartFailed: return "Could not start OAuth session"
        case .tokenExchangeFailed: return "Failed to exchange authorization code"
        case .noRefreshToken: return "No refresh token available"
        case .networkError: return "Network error"
        }
    }
}
