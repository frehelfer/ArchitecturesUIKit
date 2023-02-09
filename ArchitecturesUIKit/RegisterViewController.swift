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
            self?.registerTap?()
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
}
