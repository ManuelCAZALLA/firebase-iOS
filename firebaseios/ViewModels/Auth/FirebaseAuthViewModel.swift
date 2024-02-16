//
//  FirebaseAuthViewModel.swift
//  firebaseios
//
//  Created by Manuel Cazalla Colmenero on 15/2/24.
//

import Foundation
import FirebaseAuth

class FirebaseAuthViewModel: AuthViewModelProtocol {
    
    
    func register(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if let error = error {
                onFailure(error)
            }else if let authResult = result {
                let id = authResult.user.uid
                let user = User(id: id, email: email, password: "")
                onSuccess(user)
                
            }
        }
    }
    
    func login(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                onFailure(error)
            }else if let authResult = result {
                let id = authResult.user.uid
                let user = User(id: id, email: email, password: "")
            }
        }
    }
    
    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (Error) -> Void) {
        
        if let _ = Auth.auth().currentUser {
            onSuccess(true)
        }else {
            onFailure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
    
    func recoverPassword(email: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) {error in
            if let error = error{
                onFailure(error)
            }else {
                onSuccess()
            }
        }
    }
    
    func getUser(onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        
        if let user = Auth.auth().currentUser {
            onSuccess(User(id: user.uid, email: user.email ?? "", password: ""))
        }else {
            onFailure(NSError(domain: "", code: -1, userInfo: nil))
        }
    }
    
    func logout(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        
        do {
            try Auth.auth().signOut()
            onSuccess()
            
        }catch let singOutError {
            onFailure(singOutError)
        }
    }
}


