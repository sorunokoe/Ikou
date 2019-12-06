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
    
    lazy var emptyView: EmptyView = {
        let view = EmptyView()
        view.setData(title: "No games you owned. But why?..")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadGames()
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        }
    }
    
}
extension GamesViewController: GamesViewProtocol{
    
    func didLoadGames() {
        if presenter?.isEmpty() ?? true{
            tableView.backgroundView = emptyView
        }else{
            tableView.backgroundView = nil
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: String) {
        self.presentError(error)
    }
    
}
extension GamesViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.search(word: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.cancelSearch()
    }
}
