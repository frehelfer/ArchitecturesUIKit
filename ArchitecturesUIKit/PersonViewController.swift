//
//  PersonViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 09/02/23.
//

import UIKit

class PersonViewController: UIViewController {

    private var person: Person
    private var personView: PersonView
    
    // MARK: - Init
    init(person: Person) {
        self.person = person
        personView = PersonView(person: person)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = personView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.displayName

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Actions

}
