import Foundation
import Combine

// MARK: - Protocol
protocol StorageServiceType {
    
    func save<T: Codable>(_ value: T, forKey key: String) -> AnyPublisher<Void, Error>
    func load<T: Codable>(_ type: T.Type, forKey key: String) -> AnyPublisher<T, Error>
    func remove(forKey key: String) -> AnyPublisher<Void, Error>
    func clear() -> AnyPublisher<Void, Error>
    func exists(forKey key: String) -> Bool
}


// MARK: - Implementation
class StorageService: StorageServiceType {
    
    
    // MARK: - Properties
    private let userDefaults: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    
    // MARK: - Initialization
    init(userDefaults: UserDefaults = .standard) {
        
        self.userDefaults = userDefaults
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        
        // Configure date encoding/decoding
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
    }
    
    
    // MARK: - StorageService Methods
    func save<T: Codable>(_ value: T, forKey key: String) -> AnyPublisher<Void, Error> {
        
        Future { [weak self] promise in
            
            guard let self = self else {
                
                promise(.failure(AppError.unknown))
                return
            }
            
            do {
                
                let data = try self.encoder.encode(value)
                self.userDefaults.set(data, forKey: key)
                promise(.success(()))
            } catch {
                
                promise(.failure(AppError.encodingError))
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func load<T: Codable>(_ type: T.Type, forKey key: String) -> AnyPublisher<T, Error> {
        
        Future { [weak self] promise in
            
            guard let self = self else {
                
                promise(.failure(AppError.unknown))
                return
            }
            
            guard let data = self.userDefaults.data(forKey: key) else {
                
                promise(.failure(AppError.userNotFound))
                return
            }
            
            do {
                
                let value = try self.decoder.decode(type, from: data)
                promise(.success(value))
            } catch {
                
                promise(.failure(AppError.decodingError))
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func remove(forKey key: String) -> AnyPublisher<Void, Error> {
        
        Future { [weak self] promise in
            
            guard let self = self else {
                
                promise(.failure(AppError.unknown))
                return
            }
            
            self.userDefaults.removeObject(forKey: key)
            promise(.success(()))
        }
        .eraseToAnyPublisher()
    }
    
    
    func clear() -> AnyPublisher<Void, Error> {
        
        Future { [weak self] promise in
            
            guard let self = self else {
                
                promise(.failure(AppError.unknown))
                return
            }
            
            if let bundleID = Bundle.main.bundleIdentifier {
                
                self.userDefaults.removePersistentDomain(forName: bundleID)
            }
            
            promise(.success(()))
        }
        .eraseToAnyPublisher()
    }
    
    
    func exists(forKey key: String) -> Bool {
        
        return userDefaults.object(forKey: key) != nil
    }
    
}
