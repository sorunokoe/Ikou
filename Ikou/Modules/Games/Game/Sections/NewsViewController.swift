//
//  NewsViewController.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class NewsViewController: UICollectionViewController{
    
    weak var presenter: GamePresenterProtocol?
    
    enum CellIdentifier: String{
        case news
    }
    static func initializeWithLayout() -> NewsViewController{
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 160)
        layout.scrollDirection = .vertical
        return NewsViewController(collectionViewLayout: layout)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = Constants.Colors.background.color
        collectionView.register(NewsGameCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.news.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func updateNews(){
        collectionView.reloadData()
    }
    
}
extension NewsViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getNews().count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.news.rawValue, for: indexPath) as? NewsGameCollectionViewCell{
            if let news = presenter?.getNews()[indexPath.row]{
                cell.setData(news: news)
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
