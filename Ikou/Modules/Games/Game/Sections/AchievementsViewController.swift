//
//  AchievementsViewController.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class AchievementsViewController: UITableViewController{
    
    weak var presenter: GamePresenterProtocol?
    
    lazy var emptyView: EmptyView = {
        let view = EmptyView()
        return view
    }()
    
    enum CellIdentifier: String{
        case achievements
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = Constants.Colors.background.color
        tableView.register(AchievementsTableViewCell.self, forCellReuseIdentifier: CellIdentifier.achievements.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    func updateAchievements(){
        tableView.reloadData()
    }
    
    func show(error: String){
        emptyView.setData(title: error)
        tableView.backgroundView = emptyView
    }
    
}
extension AchievementsViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.achievements.rawValue, for: indexPath) as? AchievementsTableViewCell{
            if let achievement = presenter?.getAchievements()[indexPath.row]{
                cell.setData(achievement: achievement)
                cell.contentView.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAchievements().count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
