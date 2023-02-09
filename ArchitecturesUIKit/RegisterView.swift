//
//  RegisterView.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: - Clousures
    var onRegisterTap: ((_ user: Credentials) -> Void)?
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create an Account"
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
        textField.returnKeyType = .next
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
        textField.isSecureTextEntry = true
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
        textField.returnKeyType = .next
        textField.delegate = self
        return textField
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    // MARK: - confirmPassword Properties
    private lazy var confirmPasswordStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        return view
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .label
        return label
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
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
        textField.returnKeyType = .go
        textField.delegate = self
        return textField
    }()
    
    private lazy var confirmPasswordSecureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    // MARK: - Buttons Properties
    private lazy var registerButton: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
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
        addSubViews()
        setConstraints()
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
        
        passwordTextField.addSubview(secureButton)
        
        // confirmPassword stack
        stackView.addArrangedSubview(confirmPasswordStackView)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordLabel)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordTextField)
        
        confirmPasswordTextField.addSubview(confirmPasswordSecureButton)
        
        // button
        addSubview(registerButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // title
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // main stack
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40),
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
            
            // confirmPassword stack
            confirmPasswordStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            confirmPasswordStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: confirmPasswordStackView.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: confirmPasswordStackView.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 42),
            
            confirmPasswordSecureButton.centerYAnchor.constraint(equalTo: confirmPasswordTextField.centerYAnchor),
            confirmPasswordSecureButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor, constant: -12),
            
            // registerButton
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 48),
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Actions
    @objc
    private func registerButtonTap() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty,
            password == confirmPasswordTextField.text else {
            // Show error message
            return
        }
        
        self.onRegisterTap?(Credentials(email: email, password: password))
    }
}

extension RegisterView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            textField.resignFirstResponder()
            registerButtonTap()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
