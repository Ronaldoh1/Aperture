//
//  AuthEntity.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/12/26.
//

import Foundation

enum AuthMode: Equatable {
  case signIn
  case signUp
  case forgotPassword
}

struct AuthState: Equatable {
  var mode: AuthMode = .signIn

  var email: String = ""
  var password: String = ""
  var displayName: String = ""

  var isLoading: Bool = false
  var errorMessage: String? = nil
}
