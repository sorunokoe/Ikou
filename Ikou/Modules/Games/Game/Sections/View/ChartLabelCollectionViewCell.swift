//
//  ChartLabelCollectionViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class ChartLabelCollectionViewCell: UICollectionViewCell{
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String){
        titleLabel.text = title
    }
    
    func show(){
        self.contentView.backgroundColor = Constants.Colors.status.color
    }
    func hide(){
        self.contentView.backgroundColor = Constants.Colors.background.color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
    }
    
}
extension ChartLabelCollectionViewCell{
    
    func configUI(){
        self.contentView.layer.cornerRadius = 10
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
