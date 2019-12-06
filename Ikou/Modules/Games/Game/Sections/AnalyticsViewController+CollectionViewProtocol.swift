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
        guard let statsFacade = self.statsFacade else { return 0 }
        if collectionView == chartCollectionView{
            guard let choosedLabel = choosedLabel else { return 0 }
            let stats = statsFacade.getStatBy(label: choosedLabel).count
            return stats
        }
        if collectionView == chartLabelsCollectionView{
            let labels = statsFacade.getLabels().count
            return labels
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let statsFacade = self.statsFacade, let choosedLabel = choosedLabel else {
            return UICollectionViewCell()
        }
        if collectionView == chartCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.ItemIdentifier.rawValue, for: indexPath) as? ChartItemCollectionViewCell{
                let item = statsFacade.getStatBy(label: choosedLabel)[indexPath.row]
                let height = statsFacade.getHeight(index: indexPath.row)
                let day = statsFacade.getDay(index: indexPath.row)
                let date = statsFacade.getDate(index: indexPath.row)
                cell.setData(value: "\(item.value)", day: day, date: date, height: height)
                if cell == choosedItemCell{
                    cell.show()
                }else{
                    cell.hide()
                }
                if choosedItemIndex == indexPath.row{
                    choosedItemCell = cell
                    cell.show()
                }else{
                    cell.hide()
                }
                return cell
            }
        }
        if collectionView == chartLabelsCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.LabelIdentifier.rawValue, for: indexPath) as? ChartLabelCollectionViewCell{
                let label = statsFacade.getLabels()[indexPath.row]
                let name = statsFacade.getName(name: label)
                cell.setData(title: name)
                
                if let choosedLabelCell = choosedLabelCell, cell == choosedLabelCell{
                    cell.show()
                }else{
                    cell.hide()
                }
                if choosedLabelIndex == indexPath.row{
                    choosedLabelCell = cell
                    cell.show()
                }else{
                    cell.hide()
                }
                
                return cell
            }
        }
        return UICollectionViewCell()
    }
}
extension AnalyticsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ChartItemCollectionViewCell{
            if let choosedItemCell = choosedItemCell{
                choosedItemCell.hide()
            }
            choosedItemIndex = indexPath.row
            choosedItemCell = cell
            choosedItemCell?.show()
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? ChartLabelCollectionViewCell{
            choosedLabelIndex = indexPath.row
            choosedLabel = statsFacade?.getLabels()[indexPath.row]
            if let choosedLabelCell = choosedLabelCell{
                choosedLabelCell.hide()
            }
            choosedLabelCell = cell
            choosedLabelCell?.show()
        }
    }
}
