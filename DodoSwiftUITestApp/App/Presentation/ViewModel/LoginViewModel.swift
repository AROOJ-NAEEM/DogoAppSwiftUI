//
//  LoginViewModel.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 03/06/2024.
//

import Foundation
import AuthenticationServices

class LoginViewModel {
    
    func SignIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        AuthManager.shared.SignUp(email: email, password: password) { showHomeView, error in
            if showHomeView {
                completion(showHomeView, error)
            } else if let error = error {
                print("Authentication failed:", error.localizedDescription)
                completion(false, error)
            }
        }
    }
    
    func appleLogin(authorization: ASAuthorization, completion: @escaping(Bool) -> Void ) {
        AuthManager.shared.appleLogin(authorization: authorization) { showHomeView in
            completion(showHomeView)
        }
    }
    
}
