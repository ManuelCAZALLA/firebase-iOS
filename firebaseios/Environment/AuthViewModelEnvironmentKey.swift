//
//  AuthViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 11/2/24.
//

import SwiftUI

struct AuthViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: AuthViewModelProtocol = DummyAuthViewModel()
}

extension EnvironmentValues {
    var authViewModel: AuthViewModelProtocol {
        get { self[AuthViewModelEnvironmentKey.self] }
        set { self[AuthViewModelEnvironmentKey.self] = newValue }
    }
}
