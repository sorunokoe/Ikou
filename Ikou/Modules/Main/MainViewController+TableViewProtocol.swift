//
//  MainViewController+TableViewProtocol.swift
//  Ikou
//
//  Created by Salgara on 12/2/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getFriends().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.FriendsCellIdentifier.rawValue, for: indexPath) as? FriendsTableViewCell{
            let friend = presenter.getFriends()[indexPath.row]
            cell.setData(profile: friend)
            return cell
        }
        return UITableViewCell()
    }
}
extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
