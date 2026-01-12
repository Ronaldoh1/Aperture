import Foundation
import Combine
import FirebaseAuth

protocol AuthServiceType {

    func signIn(email: String, password: String) -> AnyPublisher<User, Error>
    func signUp(email: String, password: String) -> AnyPublisher<User, Error>
    func signOut() -> AnyPublisher<Void, Error>
    func resetPassword(email: String) -> AnyPublisher<Void, Error>
    func getCurrentUser() -> AnyPublisher<User?, Never>
    func refreshToken() -> AnyPublisher<String, Error>
}

final class AuthService: AuthServiceType {

    func signIn(email: String, password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error { return promise(.failure(error)) }
                guard let firebaseUser = result?.user else {
                    return promise(.failure(NSError(domain: "Auth", code: -1)))
                }

                let user = User(
                    id: firebaseUser.uid,
                    email: firebaseUser.email ?? email,
                    displayName: firebaseUser.displayName ?? "",
                    profileImageURL: firebaseUser.photoURL?.absoluteString,
                    createdAt: Date(), lastLoginAt: Date()
                )
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }

    func signUp(email: String, password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error { return promise(.failure(error)) }
                guard let firebaseUser = result?.user else {
                    return promise(.failure(NSError(domain: "Auth", code: -1)))
                }

                let user = User(
                    id: firebaseUser.uid,
                    email: firebaseUser.email ?? email,
                    displayName: firebaseUser.displayName ?? "",
                    profileImageURL: firebaseUser.photoURL?.absoluteString,
                    createdAt: Date(), lastLoginAt: Date()
                )
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }

    func resetPassword(email: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error { return promise(.failure(error)) }
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }

    func getCurrentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser)
            .compactMap { firebaseUser -> User? in
                guard let firebaseUser else { return nil }

                return User(
                    id: firebaseUser.uid,
                    email: firebaseUser.email ?? "",
                    displayName: firebaseUser.displayName ?? "",
                    profileImageURL: firebaseUser.photoURL?.absoluteString,
                    createdAt: Date(), lastLoginAt: Date()
                )
            }
            .map(Optional.some) // keeps the output type User?
            .eraseToAnyPublisher()
    }

    func refreshToken() -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            guard let user = Auth.auth().currentUser else {
                return promise(.failure(NSError(domain: "Auth", code: -2)))
            }

            user.getIDTokenForcingRefresh(true) { token, error in
                if let error { return promise(.failure(error)) }
                guard let token else {
                    return promise(.failure(NSError(domain: "Auth", code: -3)))
                }
                promise(.success(token))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
