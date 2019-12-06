//
//  GameViewController+UICollectionViewProtocol.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension GameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.segments.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.SegmentIdentifier.rawValue, for: indexPath) as? GameSegmentCollectionViewCell{
            guard let presenter = presenter else { return UICollectionViewCell() }
            cell.setData(title: presenter.segments[indexPath.row].rawValue)
            cell.backgroundColor = .clear
            if presenter.segments[indexPath.row] == presenter.currentSegment{
                cell.backgroundColor = Constants.Colors.status.color
                choosedCell = cell
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
extension GameViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = choosedCell{
            UIView.animate(withDuration: 0.15) {
                cell.backgroundColor = .clear
            }
        }
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.15) {
            cell?.backgroundColor = Constants.Colors.status.color
        }
        choosedCell = cell
        presenter?.changeSegment(index: indexPath.row)
    }
}
extension GameViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
