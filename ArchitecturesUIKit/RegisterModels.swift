//
//  RegisterModels.swift
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

enum Register
{
    // MARK: Use cases
    
    enum Something
    {
        struct Request
        {
            var user: Credentials
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
        struct ViewError
        {
            var error: Error
        }
    }
}
