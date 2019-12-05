//
//  AnalyticsViewController+CollectionViewProtocol.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension AnalyticsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == chartCollectionView{
            return presenter?.getCharts().count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.chartItem.rawValue, for: indexPath) as? ChartItemCollectionViewCell{
            if let item = presenter?.getCharts()[indexPath.row], let height = presenter?.getHeight(index: indexPath.row){
                cell.setData(value: "\(item.value)", day: "Mon", date: "05.11", height: height)
                if cell == choosedChartItem{
                    cell.show()
                }else{
                    cell.hide()
                }
            }
            return cell
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.chartLabel.rawValue, for: indexPath) as? ChartLabelCollectionViewCell{
            return cell
        }
        return UICollectionViewCell()
    }
}
extension AnalyticsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ChartItemCollectionViewCell else { return }
        if let choosedChartItem = choosedChartItem{
            choosedChartItem.hide()
        }
        choosedChartItem = cell
        choosedChartItem?.show()
    }
}
