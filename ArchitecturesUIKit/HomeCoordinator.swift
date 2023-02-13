//
//  HomeCoordinator.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let vc = HomeViewController()
        
        vc.logOut = {
            self.navigationController.popViewController(animated: true)
        }
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
