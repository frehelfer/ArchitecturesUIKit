//
//  RegisterViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let presenter = RegisterPresenter()

    // MARK: - Closures
    
    var registerTap: (() -> Void)?
    
    // MARK: - Properties
        
    private lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onRegisterTap = { [weak self] user in
            self?.presenter.register(user: user)
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
        
        presenter.delegate = self
    }
}

extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        presentAlert(withTitle: title, message: message)
    }
    
    func cleanTextFields(_ success: Bool) {
        registerView.cleanTextFields(success)
    }
    
    func goHome() {
        registerTap?()
    }
}
