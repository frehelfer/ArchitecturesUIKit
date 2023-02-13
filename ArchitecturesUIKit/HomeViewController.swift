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
    
    let presenter = HomePresenter()
    
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Properties
    
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
        self.presenter.delegate = self
        
        Task {
            await presenter.fetchPersons()
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
    
    @objc
    func logOutTapped() {
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
        presenter.didTap(person: indexPath)
    }
}

extension HomeViewController: HomePresenterDelegate {
    func presentPersons(allPersons: [Person]) {
        self.allPersons = allPersons
        
        DispatchQueue.main.async { [weak self] in
            self?.homeView.reloadTableView()
        }
    }
    
    func showMessage(title: String, message: String) {
        presentAlert(withTitle: title, message: message)
    }
    
    func presentPersonDetail(person: IndexPath) {
        let vc = PersonViewController(person: allPersons[person.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
