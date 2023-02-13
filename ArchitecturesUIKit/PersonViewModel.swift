//
//  PersonViewModel.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation

class PersonViewModel {
    
    private let service = PersonService()
    
    func fetchPersons() async throws -> [Person] {
        do {
            let data = try await service.fetchPersons()
            return data
        } catch {
            throw error
        }
    }
}
