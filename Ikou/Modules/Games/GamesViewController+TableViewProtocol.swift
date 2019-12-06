//
//  GamesViewController+TableViewProtocol.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension GamesViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.GamesTableCellIdentifier.rawValue, for: indexPath) as? GamesTableViewCell{
            if let game = presenter?.getGames()[indexPath.row]{
                cell.setData(game: game)
                cell.contentView.frame = cell.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getGames().count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = GamesHeaderView()
        header.titleLabel.text = "Games"
        return header
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.moveToGame(index: indexPath.row)
    }
}
