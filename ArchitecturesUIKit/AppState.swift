//
//  AppState.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation

class AppState: ObservableObject {
    
    static let shared = AppState()
    private init() {}
    
    @Published private(set) var isAuthorized = false
    
    public func updateAuthorization(with: Bool) {
        isAuthorized = with
    }
}
