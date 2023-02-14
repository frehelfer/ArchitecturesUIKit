//
//  RegisterWorker.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 14/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class RegisterWorker
{
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