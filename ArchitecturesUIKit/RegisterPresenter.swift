//
//  RegisterPresenter.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation

protocol RegisterPresenterDelegate: AnyObject {
    func showMessage(title: String, message: String)
    func cleanTextFields(_ success: Bool)
    func goHome()
}

class RegisterPresenter  {
    
    weak var delegate: RegisterPresenterDelegate?
    
    func register(user: Credentials) {
        if user.password == "" || user.confirmPassword == "" || user.email == "" {
            delegate?.showMessage(title: "Alert", message: "TextField is empty")
            
        } else if !user.email.contains("@") {
            delegate?.showMessage(title: "Alert", message: "Email invalid. Try again!")
            
        } else if user.password != user.confirmPassword {
            delegate?.showMessage(title: "Alert", message: "Password are different. Try again!")
        }
        
        CredentialService.shared.createUser(user: user) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.delegate?.goHome()
                    self?.delegate?.cleanTextFields(true)
                case .failure(let error):
                    self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
                    self?.delegate?.cleanTextFields(false)
                }
            }
        }
    }
}
