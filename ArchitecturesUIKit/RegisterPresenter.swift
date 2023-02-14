//
//  RegisterPresenter.swift
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

protocol RegisterPresentationLogic
{
    func presentHomeView(response: Register.Something.Response)
    func presentError(response: Register.Something.ViewError)
}

class RegisterPresenter: RegisterPresentationLogic
{
    weak var viewController: RegisterDisplayLogic?
    
    // MARK: Do something
    
    func presentHomeView(response: Register.Something.Response)
    {
        viewController?.displaySomething(viewModel: Register.Something.ViewModel())
    }
    
    func presentError(response: Register.Something.ViewError) {
        viewController?.displayError(error: response)
    }
}