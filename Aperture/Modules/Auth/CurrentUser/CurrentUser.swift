import Foundation
import Combine

protocol CurrentUserType {

    func saveUser(_ user: User) -> AnyPublisher<Void, Error>
    func getCurrentUser() -> AnyPublisher<User?, Never>
    func clearUser() -> AnyPublisher<Void, Error>
    func updateUser(_ user: User) -> AnyPublisher<Void, Error>

}

final class CurrentUser: CurrentUserType {

    private let storageService: StorageServiceType
    private let userKey = "current_user"

    init(storageService: StorageServiceType) {

        self.storageService = storageService
    }

    func saveUser(_ user: User) -> AnyPublisher<Void, Error> {

        storageService.save(user, forKey: userKey)
    }

    func getCurrentUser() -> AnyPublisher<User?, Never> {

        storageService.load(User.self, forKey: userKey)
            .map { $0 as User? }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }

    func clearUser() -> AnyPublisher<Void, Error> {

        storageService.remove(forKey: userKey)
    }

    func updateUser(_ user: User) -> AnyPublisher<Void, Error> {

        storageService.save(user, forKey: userKey)
    }

}
