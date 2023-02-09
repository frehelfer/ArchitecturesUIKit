//
//  SceneDelegate.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 06/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var homeViewController = HomeViewController()
    var loginViewController = LoginViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        homeViewController.delegate = self
        loginViewController.delegate = self
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        if AppState.shared.isAuthorized {
            setRootViewController(homeViewController)
        } else {
            setRootViewController(loginViewController)
        }
    }
}

extension SceneDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard
            animated,
            let window = self.window
        else { return }
        
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func isAuth() {
        AppState.shared.updateAuthorization(with: true)
        setRootViewController(homeViewController)
    }
}

extension SceneDelegate: HomeViewControllerDelegate {
    func logOut() {
        AppState.shared.updateAuthorization(with: false)
        setRootViewController(loginViewController)
    }
}



