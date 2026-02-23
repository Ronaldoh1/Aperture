// GoogleSignInService.swift
// SunFlow: Reignited — Aperture
//
// SETUP REQUIRED before this compiles:
// 1. In Xcode → File → Add Package Dependencies
//    URL: https://github.com/google/GoogleSignIn-iOS
//    Version: 7.0.0+
// 2. In Info.plist → URL Types → Add item:
//    URL Scheme: com.googleusercontent.apps.1099054839164-[your-client-id-suffix]
//    (Find reversed client ID in GoogleService-Info.plist under REVERSED_CLIENT_ID)
// 3. In GoogleService-Info.plist: verify CLIENT_ID is present
//
// Firebase project: aperture-8669d
// Bundle ID: com.sunflow-reignited.aperture

import Foundation
import Combine
import UIKit
import FirebaseAuth
import FirebaseCore

// MARK: - GoogleSignIn SDK Wrapper
// This file wraps GoogleSignIn SDK calls. If the package isn't added yet,
// the compiler will show import errors — that's expected until Step 1 above.

// MARK: - Google Sign-In Service Protocol
// Defined outside the #if block so AuthInteractor can always find it

protocol GoogleSignInServiceType {
    func signIn(presenting viewController: UIViewController) -> AnyPublisher<User, Error>
    func signOut()
    func restorePreviousSignIn() -> AnyPublisher<User?, Never>
}

#if canImport(GoogleSignIn)
import GoogleSignIn

// MARK: - Implementation

final class GoogleSignInService: GoogleSignInServiceType {

    // MARK: - Restore Previous Sign-In (on app launch)

    func restorePreviousSignIn() -> AnyPublisher<User?, Never> {
        Future<User?, Never> { promise in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                guard let googleUser = user, error == nil else {
                    promise(.success(nil))
                    return
                }
                // If we have a restored Google session, we still need Firebase token
                // Handled automatically if Firebase session also persists
                promise(.success(nil)) // Firebase session handled separately
            }
        }
        .eraseToAnyPublisher()
    }

    // MARK: - Sign In

    func signIn(presenting viewController: UIViewController) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                promise(.failure(GoogleAuthError.missingClientID))
                return
            }

            // Configure GIDSignIn
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config

            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
                if let error {
                    promise(.failure(error))
                    return
                }

                guard
                    let googleUser = result?.user,
                    let idToken = googleUser.idToken?.tokenString
                else {
                    promise(.failure(GoogleAuthError.missingToken))
                    return
                }

                let accessToken = googleUser.accessToken.tokenString
                let credential = GoogleAuthProvider.credential(
                    withIDToken: idToken,
                    accessToken: accessToken
                )

                // Sign in to Firebase with Google credential
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error {
                        promise(.failure(error))
                        return
                    }

                    guard let firebaseUser = authResult?.user else {
                        promise(.failure(GoogleAuthError.firebaseSignInFailed))
                        return
                    }

                    let user = User(
                        id: firebaseUser.uid,
                        email: firebaseUser.email ?? googleUser.profile?.email ?? "",
                        displayName: firebaseUser.displayName ?? googleUser.profile?.name ?? "",
                        profileImageURL: firebaseUser.photoURL?.absoluteString
                            ?? googleUser.profile?.imageURL(withDimension: 200)?.absoluteString,
                        createdAt: Date(),
                        lastLoginAt: Date()
                    )

                    print("✅ GoogleSignIn: Firebase auth success — uid: \(firebaseUser.uid)")
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    // MARK: - Sign Out

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}


// MARK: - URL Handling (add to SceneDelegate or App file)
// In your @main App struct or SceneDelegate, add:
//
//   func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//       for urlContext in URLContexts {
//           GIDSignIn.sharedInstance.handle(urlContext.url)
//       }
//   }
//
// OR if using SwiftUI App lifecycle, add to your App struct:
//
//   .onOpenURL { url in
//       GIDSignIn.sharedInstance.handle(url)
//   }

#else

// MARK: - Stub (GoogleSignIn SDK not yet added)
// Satisfies the compiler until you add the SPM package.
// Once GoogleSignIn-iOS is added via File → Add Package Dependencies, the real impl above is used.

final class GoogleSignInService: GoogleSignInServiceType {
    func signIn(presenting viewController: UIViewController) -> AnyPublisher<User, Error> {
        Fail(error: NSError(domain: "GoogleSignIn", code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "GoogleSignIn SDK not installed. Add it via SPM."]))
            .eraseToAnyPublisher()
    }
    func signOut() {}
    func restorePreviousSignIn() -> AnyPublisher<User?, Never> {
        Just(nil).eraseToAnyPublisher()
    }
}

#endif
