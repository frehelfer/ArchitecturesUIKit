//
//  HomeViewController.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit
import SwiftUI


class HomeViewController: UIViewController {
    
    // MARK: - Closures
    var logOut: (() -> Void)?
    
    // MARK: - Properties
    private let vm = PersonViewModel()
    private var allPersons: [Person] = []
    
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
                self.allPersons = try await vm.fetchPersons()
                homeView.reloadTableView()
            } catch {
                presentAlert(withTitle: "Error", message: error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func layout() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        self.title = "HomeView"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logOutTapped))
        
    }
    
    // MARK: - Actions
    @objc
    func logOutTapped() {
        self.logOut?()
    }
}

// MARK: - TableView Delegate
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
