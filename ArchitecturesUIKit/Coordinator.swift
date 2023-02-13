//
//  Coordinator.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
    
    init(navigationController: UINavigationController)
}
