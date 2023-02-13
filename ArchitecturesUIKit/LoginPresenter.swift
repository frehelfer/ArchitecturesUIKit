//
//  LoginPresenter.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func showMessage(title: String, message: String)
    func cleanTextFields(_ success: Bool)
    func goHome()
}

class LoginPresenter {
    
    weak var delegate: LoginPresenterDelegate?
    
    public func login(user: Credentials) {
        if user.password == "" || user.email == "" {
            delegate?.showMessage(title: "Alert", message: "TextField is empty")
        } else if !user.email.contains("@") {
            delegate?.showMessage(title: "Alert", message: "Email invalid. Try again!")
        }
        
        
        CredentialService.shared.signIn(user: user) { [weak self] result in
            
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
