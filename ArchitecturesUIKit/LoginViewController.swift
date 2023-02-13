//
//  LoginViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 06/02/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func isAuth()
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - Closures

    
    // MARK: - Properties
    private lazy var registerViewController: RegisterViewController = {
        let vc = RegisterViewController()
        
        vc.registerTap = { [weak self] in
            self?.delegate?.isAuth()
        }
        
        return vc
    }()
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onLoginTap = { [weak self] user in
            self?.login(user: user)
        }
        
        view.onRegisterTap = { [weak self] in
            guard let vc = self?.registerViewController else { return }
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        return view
    }()
    
    // MARK: - Inits
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    
    private func login(user: Credentials) {
        if user.password == "" || user.email == "" {
            presentAlert(withTitle: "Alert", message: "TextField is empty")
        } else if !user.email.contains("@") {
            presentAlert(withTitle: "Alert", message: "Email invalid. Try again!")
        }
        
        
        CredentialService.shared.signIn(user: user) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.delegate?.isAuth()
                    self?.loginView.cleanTextFields(true)
                case .failure(let error):
                    self?.presentAlert(withTitle: "Error", message: error.localizedDescription)
                    self?.loginView.cleanTextFields()
                }
            }
        }
    }
}
