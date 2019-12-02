//
//  GamesViewController.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class GamesViewController: UITableViewController{
    
    // MARK: - Protocol
    var presenter: GamesPresenterProtocol?
    
    // MARK: - UI Properties
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search games"
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.delegate = self
        definesPresentationContext = true
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadGames()
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            
        }
    }
    
}
extension GamesViewController: GamesViewProtocol{
    
    func didLoadGames() {
        self.tableView.reloadData()
    }
    func showError(_ error: String) {
        // TODO: Show Error
    }
    
}
extension GamesViewController: UISearchBarDelegate{
    
}
