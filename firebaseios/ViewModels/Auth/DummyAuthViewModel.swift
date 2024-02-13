//
//  DummyAuthViewModel.swift
//  firebaseios
//
//  Created by Manuel Cazalla on 10/2/24.
//

import Foundation

class DummyAuthViewModel: AuthViewModelProtocol {
    
    func register(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(User(id: "123", email: email, password: ""))
    }

    func login(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(User(id: "123", email: email, password: ""))
    }

    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(false)
    }

    func recoverPassword(email: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess()
    }

    func getUser(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess(User(id: "123", email: "aaa@aaa.com", password: ""))
    }

    func logout(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess()
    }
    
}
