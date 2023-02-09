//
//  Person.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import Foundation

struct Person: Codable, Identifiable {
    
    var id: Int
    var photo: URL
    var thumbnail: URL
    var firstName: String
    var lastName: String
    var email: String
    var experience: Int
    var rate: Int
    var bio: String
    var details: String
    var tags: [String]
    
    var displayName: String {
        let components = PersonNameComponents(givenName: firstName, familyName: lastName)
        return components.formatted()
    }
    
    static let example = Person(id: 1, photo: URL(string: "https://hws.dev/img/user-1-full.jpg")!, thumbnail: URL(string: "https://hws.dev/img/user-1-thumb.jpg")!, firstName: "Jaime", lastName: "Rove", email: "jrovel@huffingtonpost.com", experience: 10, rate: 300, bio: "A few lines about this person go here.", details: "A couple more sentences about this person go here.", tags: ["ideator", "aligned", "manager", "excitable"])
}

