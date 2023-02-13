//
//  LoginViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 06/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let vm = CredentialsViewModel()
    
    // MARK: - Closures
    var onLoginSuccess: (() -> Void)?
    var onRegisterTap: (() -> Void)?
    
    // MARK: - Properties
    private lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onLoginTap = { [weak self] user in
            self?.login(user: user)
        }
        
        view.onRegisterTap = { [weak self] in
            self?.onRegisterTap?()
        }
        
        return view
    }()
    
    // MARK: - LifeCycle
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
        vm.login(user: user) { [weak self] result in
            switch result {
            case .success(_):
                self?.onLoginSuccess?()
                self?.loginView.cleanTextFields(true)
            case .failure(let error):
                self?.presentAlert(withTitle: "Error", message: error.localizedDescription)
                self?.loginView.cleanTextFields()
            }
        }
    }
}
