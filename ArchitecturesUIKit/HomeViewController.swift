//
//  HomeViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit
import SwiftUI

protocol HomeViewControllerDelegate: AnyObject {
    func logOut()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Closures
    
    
    // MARK: - Properties
    
    private var allPersons: [Person] = []
    
    private var personService = PersonService()
    private var homeView = HomeView()

    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        self.hideKeyboardWhenTappedAround()
        self.homeView.configTableViewDelegate(delegate: self, dataSource: self)
        
        Task {
            do {
                allPersons = try await personService.fetchPersons()
                homeView.reloadTableView()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func layout() {
        title = "HomeView"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logOutTapped))
        
    }
    
    // MARK: - Actions

    @objc
    private func logOutTapped() {
        delegate?.logOut()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.setupCell(person: allPersons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PersonViewController(person: allPersons[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
