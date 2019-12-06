//
//  NewsViewController.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController{
    
    weak var presenter: GamePresenterProtocol?
    
    lazy var emptyView: EmptyView = {
        let view = EmptyView()
        return view
    }()
    
    enum CellIdentifier: String{
        case NewsIdentifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = Constants.Colors.background.color
        tableView.register(NewsGameTableViewCell.self, forCellReuseIdentifier: CellIdentifier.NewsIdentifier.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    func updateNews(){
        tableView.reloadData()
    }
    func show(error: String){
        emptyView.setData(title: error)
        tableView.backgroundView = emptyView
    }
    
}
extension NewsViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNews().count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NewsIdentifier.rawValue, for: indexPath) as? NewsGameTableViewCell{
            if let news = presenter?.getNews()[indexPath.row]{
                cell.setData(news: news)
                cell.contentView.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}
