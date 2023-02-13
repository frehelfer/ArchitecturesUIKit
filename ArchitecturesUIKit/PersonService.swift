//
//  PersonService.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation

class PersonService {
    
    func fetchPersons() async throws -> [Person] {
        guard let url = URL(string: "https://hws.dev/designers.json") else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let allPersons = try JSONDecoder().decode([Person].self, from: data)
            return allPersons
        } catch {
            throw error
        }
    }
}
