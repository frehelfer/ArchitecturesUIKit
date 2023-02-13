//
//  CredentialsViewModel.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation

enum ValidationError: Error {
    case textFieldEmpty
    case emailInvalid
    case passwordNotEqual
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .textFieldEmpty:
            return NSLocalizedString("TextField is empty", comment: "")
        case .emailInvalid:
            return NSLocalizedString("Email invalid. Try again!", comment: "")
        case .passwordNotEqual:
            return NSLocalizedString("Passwords are not equal. Try again!", comment: "")
        }
    }
}

class CredentialsViewModel {
    
    
    public func login(user: Credentials, completionHandler: @escaping(Result<Credentials, Error>) -> ()) {
        if user.password == "" || user.email == "" {
            completionHandler(.failure(ValidationError.textFieldEmpty))
        } else if !user.email.contains("@") {
            completionHandler(.failure(ValidationError.emailInvalid))
        }
        
        CredentialService.shared.signIn(user: user) { result in
            switch result {
            case .success(_):
                completionHandler(.success(user))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func register(user: Credentials, completionHandler: @escaping(Result<Credentials, Error>) -> Void) {
        if user.password == "" || user.confirmPassword == "" || user.email == "" {
            completionHandler(.failure(ValidationError.textFieldEmpty))
            
        } else if !user.email.contains("@") {
            completionHandler(.failure(ValidationError.emailInvalid))
            
        } else if user.password != user.confirmPassword {
            completionHandler(.failure(ValidationError.passwordNotEqual))
        }
        
        CredentialService.shared.createUser(user: user) { result in
            
            switch result {
            case .success(_):
                completionHandler(.success(user))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
