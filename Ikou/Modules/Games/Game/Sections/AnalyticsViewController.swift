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
    var statsFacade: StatisticsFacadeProtocol?
    
    var choosedLabel: String?{
        didSet{
            self.chooseLastItem()
        }
    }
    
    // MARK: UI Properties
    var analyticView: UIView!
    var timeRangeView: AnalyticsGameTimeRangeView!
    var chartCollectionView: UICollectionView!
    var chartLabelsCollectionView: UICollectionView!
    
    var gradientLayer: CAGradientLayer!
    
    var choosedItemIndex = 0
    var choosedLabelIndex = 0
    var choosedItemCell: ChartItemCollectionViewCell?
    var choosedLabelCell: ChartLabelCollectionViewCell?
    
    lazy var emptyView: EmptyView = {
        let view = EmptyView()
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        self.view.addSubview(emptyView)
        emptyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = analyticView.bounds
    }
    
    func updateStats(statsFacade: StatisticsFacadeProtocol){
        self.statsFacade = statsFacade
        analyticView.isHidden = false
        emptyView.isHidden = true
        choosedLabel = statsFacade.getLabels().first
        self.chartCollectionView.reloadData()
        self.chartLabelsCollectionView.reloadData()
    }
    private func chooseLastItem(){
        guard let statsFacade = statsFacade, let choosedLabel = choosedLabel, !statsFacade.getStatBy(label: choosedLabel).isEmpty else { return }
        let last = statsFacade.getStatBy(label: choosedLabel).count-1
        choosedItemIndex = last
        self.chartCollectionView.reloadData()
        chartCollectionView.scrollToItem(at: IndexPath(item: choosedItemIndex, section: 0), at: .right, animated: true)
    }
    
    func show(error: String){
        analyticView.isHidden = true
        emptyView.setData(title: error)
        emptyView.isHidden = false
    }
    
}
