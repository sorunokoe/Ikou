//
//  AnalyticsViewController.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class AnalyticsViewController: UIViewController{
    
    weak var presenter: GamePresenterProtocol?
    
    // MARK: UI Properties
    var analyticView: UIView!
    var timeRangeView: AnalyticsGameTimeRangeView!
    var chartCollectionView: UICollectionView!
    var chartLabelsCollectionView: UICollectionView!
    
    var choosedChartItem: ChartItemCollectionViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
}
extension AnalyticsViewController{
    
    enum CellIdentifier: String{
        case chartItem
        case chartLabel
    }
    
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    
    private func setViews(){
        analyticView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.backgroundColor = Constants.Colors.block.color
            return view
        }()
        timeRangeView = {
            let view = AnalyticsGameTimeRangeView()
            return view
        }()
        chartCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 40, height: 200)
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 20
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.register(ChartItemCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.chartItem.rawValue)
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        chartLabelsCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 30, height: 200)
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
    }
    
    private func addViews(){
        self.view.addSubview(analyticView)
        [timeRangeView, chartCollectionView, chartLabelsCollectionView].forEach{
            analyticView.addSubview($0)
        }
    }
    
    private func setConstrains(){
        analyticView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
        }
        timeRangeView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        chartCollectionView.snp.makeConstraints {
            $0.top.equalTo(timeRangeView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(300)
        }
        chartLabelsCollectionView.snp.makeConstraints {
            $0.top.equalTo(chartCollectionView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
    }
    
}
