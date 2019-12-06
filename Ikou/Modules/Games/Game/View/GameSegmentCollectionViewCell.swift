//
//  GameSegmentCollectionViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class GameSegmentCollectionViewCell: UICollectionViewCell{
    
    private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        addViews()
        setConstain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String){
        self.titleLabel.text = title
    }
    
    func setViews(){
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    func addViews(){
        self.addSubview(titleLabel)
    }
    func setConstain(){
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
}
