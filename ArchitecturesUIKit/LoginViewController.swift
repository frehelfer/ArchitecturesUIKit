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
    
    let presenter = LoginPresenter()
    
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
            self?.presenter.login(user: user)
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
        
        presenter.delegate = self
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func showMessage(title: String, message: String) {
        presentAlert(withTitle: title, message: message)
    }
    
    func cleanTextFields(_ success: Bool) {
        loginView.cleanTextFields(success)
    }
    
    func goHome() {
        delegate?.isAuth()
    }
}
