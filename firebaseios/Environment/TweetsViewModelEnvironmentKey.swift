//
//  TweetsViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 13/2/24.
//

import SwiftUI

struct TweetsViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: TweetsViewModelProtocol = DummyTweetsViewModel()
}

extension EnvironmentValues {
    var tweetsViewModel: TweetsViewModelProtocol {
        get { self[TweetsViewModelEnvironmentKey.self] }
        set { self[TweetsViewModelEnvironmentKey.self] = newValue }
    }
}
