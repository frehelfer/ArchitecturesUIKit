//
//  PersonService.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation

@MainActor
class PersonService {
    var onReceivedPersons: ((_ allPersons: [Person]) -> Void)?
    
    init() {
        
    }
    
    func fetchPersons() async throws {
        guard let url = URL(string: "https://hws.dev/designers.json") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Person].self, from: data)
            self.onReceivedPersons?(decoded)
        } catch {
            throw error
        }
    }
}
