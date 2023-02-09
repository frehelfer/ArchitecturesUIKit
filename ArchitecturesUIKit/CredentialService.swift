//
//  CredentialService.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation
import FirebaseAuth

class CredentialService {
    
    private var auth = Auth.auth()
    
    static let shared = CredentialService()
    private init() { }
    
    // MARK: - Actions
    
    public func signIn(user: Credentials, completionHandler: @escaping(Result<Credentials, Error>) -> ()) {
        auth.signIn(withEmail: user.email, password: user.password) { _, error in
            if let error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(user))
            }
        }
    }
    
    public func createUser(user: Credentials, completionHandler: @escaping(Result<Credentials, Error>) -> ()) {
        auth.createUser(withEmail: user.email, password: user.password) { _, error in
            if let error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(user))
            }
        }
    }
}

