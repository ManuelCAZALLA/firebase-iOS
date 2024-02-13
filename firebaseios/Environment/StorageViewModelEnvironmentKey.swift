//
//  StorageViewModelEnvironmentKey.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 13/2/24.
//

import SwiftUI

struct StorageViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: StorageViewModelProtocol = DummyStorageViewModel()
}

extension EnvironmentValues {
    var storageViewModel: StorageViewModelProtocol {
        get { self[StorageViewModelEnvironmentKey.self] }
        set { self[StorageViewModelEnvironmentKey.self] = newValue }
    }
}
