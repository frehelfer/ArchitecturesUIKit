//
//  LoginView.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 06/02/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Clousures
    var onLoginTap: ((_ user: Credentials) -> Void)?
    var onRegisterTap: (() -> Void)?
    
    // MARK: - Properties
    
    var isSecure = true
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    // MARK: - Main Stack
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 30
        view.alignment = .center
        return view
    }()
    
    // MARK: - Email Properties
    private lazy var emailStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .label
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email"
        textField.text = "test@test.com"
        textField.returnKeyType = .next
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.shadowColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize(width: 5, height: 5)
        textField.layer.shadowOpacity = 0.5
        textField.setLeftPaddingPoints(11)
        textField.delegate = self
        return textField
    }()
    
    // MARK: - Password Properties
    private lazy var passwordStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .label
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.text = "a12345"
        textField.returnKeyType = .go
        textField.isSecureTextEntry = isSecure
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.shadowColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize(width: 5, height: 5)
        textField.layer.shadowOpacity = 0.5
        textField.setLeftPaddingPoints(11)
        textField.delegate = self
        return textField
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Buttons Properties
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 18
        view.alignment = .center
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray5
        self.addSubViews()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func addSubViews() {
        addSubview(titleLabel)
        
        addSubview(stackView)
        
        // email stack
        stackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        // password stack
        stackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        
        addSubview(secureButton)
        
        // buttons stack
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(registerButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // title
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // main stack
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -45),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // email stack
            emailStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            emailStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailStackView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 42),
            
            // password stack
            passwordStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            passwordStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 42),
            
            secureButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            secureButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -12),
            
            // button stack
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            loginButton.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            
            registerButton.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func loginButtonTap() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        self.onLoginTap?(Credentials(email: email, password: password))
    }
    
    @objc
    private func registerButtonTap() {
        cleanTextFields(true)
        self.onRegisterTap?()
    }
    
    @objc
    private func showPassword() {
        
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry.toggle()
            secureButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry.toggle()
            secureButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    // MARK: - Public Actions
    
    public func cleanTextFields(_ loginSuccess: Bool = false) {
        if loginSuccess {
            emailTextField.text = ""
            passwordTextField.text = ""
        } else {
            passwordTextField.text = ""
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            textField.resignFirstResponder()
            loginButtonTap()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
