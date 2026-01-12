import Foundation

enum AppError: Error, LocalizedError {
    
    
    case networkError(String)
    case authenticationFailed(String)
    case invalidCredentials
    case userNotFound
    case emailAlreadyExists
    case weakPassword
    case invalidEmail
    case serverError(String)
    case decodingError
    case encodingError
    case unknown
    
    
    var errorDescription: String? {
        
        switch self {
            
        case .networkError(let message):
            return "Network Error: \(message)"
            
        case .authenticationFailed(let message):
            return "Authentication Failed: \(message)"
            
        case .invalidCredentials:
            return "Invalid email or password"
            
        case .userNotFound:
            return "User not found. Please sign up first."
            
        case .emailAlreadyExists:
            return "An account with this email already exists"
            
        case .weakPassword:
            return "Password must be at least 8 characters"
            
        case .invalidEmail:
            return "Please enter a valid email address"
            
        case .serverError(let message):
            return "Server Error: \(message)"
            
        case .decodingError:
            return "Failed to decode data from server"
            
        case .encodingError:
            return "Failed to encode data for server"
            
        case .unknown:
            return "An unknown error occurred. Please try again."
        }
    }
    
    
    var recoverySuggestion: String? {
        
        switch self {
            
        case .networkError:
            return "Check your internet connection and try again"
            
        case .authenticationFailed, .invalidCredentials:
            return "Please check your email and password"
            
        case .weakPassword:
            return "Use a stronger password with at least 8 characters"
            
        case .invalidEmail:
            return "Enter a valid email address like user@example.com"
            
        case .emailAlreadyExists:
            return "Try signing in instead, or use a different email"
            
        default:
            return "Please try again or contact support if the problem persists"
        }
    }
}
