//
//  GamesViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension GamesViewController{
    
    enum CellIdentifier: String{
        case GamesTableCellIdentifier
    }
    
    func configUI(){
        self.view.backgroundColor = Constants.Colors.background.color
        tableView.backgroundColor = Constants.Colors.background.color
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: CellIdentifier.GamesTableCellIdentifier.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
    }
    
}
