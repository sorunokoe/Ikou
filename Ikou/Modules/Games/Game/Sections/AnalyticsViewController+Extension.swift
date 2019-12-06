//
//  AnalyticsViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

extension AnalyticsViewController{
    
    enum CellIdentifier: String{
        case ItemIdentifier
        case LabelIdentifier
    }
    
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    
    private func setViews(){
        analyticView = {
            let view = UIView()
            view.isHidden = true
            view.layer.cornerRadius = 20
            gradientLayer = CAGradientLayer()
            gradientLayer.cornerRadius = 20
            let background = Constants.Colors.background.color.cgColor
            let status = Constants.Colors.progress.color.cgColor
            gradientLayer.colors = [background, status, background]
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
            view.clipsToBounds = true
            gradientLayer.frame = view.bounds
            view.layer.addSublayer(gradientLayer)
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
            collectionView.register(ChartItemCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.ItemIdentifier.rawValue)
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        chartLabelsCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.register(ChartLabelCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.LabelIdentifier.rawValue)
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
            $0.bottom.equalTo(chartLabelsCollectionView.snp.bottom).offset(20)
        }
        timeRangeView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        chartCollectionView.snp.makeConstraints {
            $0.top.equalTo(timeRangeView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(230)
        }
        chartLabelsCollectionView.snp.makeConstraints {
            $0.top.equalTo(chartCollectionView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
        }
    }
    
}
