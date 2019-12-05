//
//  LastSessionsViewController.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class LastSessionsViewController: UITableViewController{
    
    var presenter: LastSessionPresenterProtocol?
    
    lazy var emptyView: EmptyView = {
        let view = EmptyView()
        view.setData(title: "No sessions in the last 2 weeks.")
        return view
    }()
    
    enum CellIdentifier: String{
        case LastSessionsCellIdentifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.Colors.background.color
        self.tableView.backgroundColor = Constants.Colors.background.color
        self.tableView.backgroundView = emptyView
        self.tableView.separatorStyle = .none
        self.tableView.register(LastSessionsTableCell.self, forCellReuseIdentifier: CellIdentifier.LastSessionsCellIdentifier.rawValue)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
extension LastSessionsViewController: LastSessionsViewProtocol{
    func showError(error: String) {
        self.presentError(error)
    }
    
    func didLoadLastSessions(){
        if presenter?.getLastSessions().isEmpty ?? true{
            self.tableView.backgroundView = emptyView
        }else{
            self.tableView.backgroundView = nil
            tableView.reloadData()
        }
            
    }
}
