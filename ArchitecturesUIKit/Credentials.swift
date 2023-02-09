//
//  Credentials.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation

struct Credentials: Codable {
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
}
