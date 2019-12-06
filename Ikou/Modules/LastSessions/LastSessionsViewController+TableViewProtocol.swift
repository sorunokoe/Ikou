//
//  LastSessionsViewController+TableViewProtocol.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension LastSessionsViewController{
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.LastSessionsCellIdentifier.rawValue, for: indexPath) as? LastSessionsTableCell{
            if let lastSession = presenter?.getLastSessions()[indexPath.row]{
                cell.setData(session: lastSession)
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getLastSessions().count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = GamesHeaderView()
        header.titleLabel.text = "Last Sessions"
        return header
    }
    
}
