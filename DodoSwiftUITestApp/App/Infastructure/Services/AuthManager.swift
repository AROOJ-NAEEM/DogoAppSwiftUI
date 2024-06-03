//
//  AuthManager.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 03/06/2024.
//

import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    func SignUp(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}
