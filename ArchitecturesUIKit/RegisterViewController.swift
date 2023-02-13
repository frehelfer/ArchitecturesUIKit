//
//  RegisterViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Closures
    
    var registerTap: (() -> Void)?
    
    // MARK: - Properties
        
    private lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onRegisterTap = { [weak self] user in
            self?.register(user: user)
        }
        
        return view
    }()
    
    // MARK: - Init
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    
    private func register(user: Credentials) {
        if user.password == "" || user.confirmPassword == "" || user.email == "" {
            presentAlert(withTitle: "Alert", message: "TextField is empty")
            
        } else if !user.email.contains("@") {
            presentAlert(withTitle: "Alert", message: "Email invalid. Try again!")
            
        } else if user.password != user.confirmPassword {
            presentAlert(withTitle: "Alert", message: "Password are different. Try again!")
        }
        
        CredentialService.shared.createUser(user: user) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.registerTap?()
                    self?.registerView.cleanTextFields(true)
                case .failure(let error):
                    self?.presentAlert(withTitle: "Error", message: error.localizedDescription)
                    self?.registerView.cleanTextFields()
                }
            }
        }
    }
}
