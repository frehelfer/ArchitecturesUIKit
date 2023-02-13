//
//  RegisterViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let vm = CredentialsViewModel()

    // MARK: - Closures
    var onRegisterSuccess: (() -> Void)?
    
    // MARK: - Properties
    private lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onRegisterTap = { [weak self] user in
            self?.register(user: user)
        }
        
        return view
    }()
    
    // MARK: - LifeCycle
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
        vm.register(user: user) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
                self?.registerView.cleanTextFields(true)
            case .failure(let error):
                self?.presentAlert(withTitle: "Error", message: error.localizedDescription)
                self?.registerView.cleanTextFields(false)
            }
        }
    }
}
