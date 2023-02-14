//
//  LoginRouter.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 14/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToHome()
    func routeToRegister()
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: - Routing
    
    func routeToHome() {
        let destinationVC = HomeViewController()
        navigateToPush(source: viewController!, destination: destinationVC)
    }
    
    func routeToRegister() {
        let destinationVC = RegisterViewController()
        navigateToPush(source: viewController!, destination: destinationVC)
    }
    
    // MARK: - Navigation
    
    func navigateToPush(source: LoginViewController, destination: UIViewController)
    {
        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func navigateToModal(source: LoginViewController, destination: UIViewController)
    {
        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.present(destination, animated: true)
    }
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
