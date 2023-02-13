//
//  HomePresenter.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 13/02/23.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {
    func presentPersons(allPersons: [Person])
    func showMessage(title: String, message: String)
    func presentPersonDetail(person: IndexPath)
}

class HomePresenter {
    
    private var personService = PersonService()
    weak var delegate: HomePresenterDelegate?
    
    func fetchPersons() async {
        Task {
            do {
                let data = try await personService.fetchPersons()
                delegate?.presentPersons(allPersons: data)
            } catch {
                delegate?.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func didTap(person: IndexPath) {
        delegate?.presentPersonDetail(person: person)
    }
    
}
