//
//  LastSessionsViewController.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class LastSessionsViewController: UITableViewController, LastSessionsViewProtocol{
    
    var presenter: LastSessionPresenterProtocol?
    
    enum CellIdentifier: String{
        case LastSessionsCellIdentifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(LastSessionsTableCell.self, forCellReuseIdentifier: CellIdentifier.LastSessionsCellIdentifier.rawValue)
    }
    
    
    
}
