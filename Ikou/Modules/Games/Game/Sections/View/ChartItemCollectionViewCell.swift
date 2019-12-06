//
//  ChartItemCollectionViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class ChartItemCollectionViewCell: UICollectionViewCell{
    
    var wrapperView: UIView!
    var valueLabel: UILabel!
    var dayLabel: UILabel!
    var dateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(value: String, day: String, date: String, height: CGFloat){
        self.valueLabel.text = value
        self.dayLabel.text = day
        self.dateLabel.text = date
        
        self.wrapperView.snp.makeConstraints {
            $0.height.equalTo(height)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    func show(){
        self.wrapperView.alpha = 1.0
        self.wrapperView.backgroundColor = Constants.Colors.status.color
        self.valueLabel.isHidden = false
    }
    func hide(){
        self.wrapperView.alpha = 0.6
        self.wrapperView.backgroundColor = Constants.Colors.background.color
        self.valueLabel.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        dayLabel.text = nil
        dateLabel.text = nil
        valueLabel.isHidden = false
        wrapperView.backgroundColor = Constants.Colors.background.color
        self.wrapperView.removeConstraints(self.wrapperView.constraints)
    }
    
}
extension ChartItemCollectionViewCell{
    
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    
    private func setViews(){
        //        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        wrapperView = {
            let view = UIView()
            view.layer.cornerRadius = 15
            return view
        }()
        valueLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
            label.textAlignment = .right
            label.adjustsFontSizeToFitWidth = true
            return label
        }()
        dayLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
            label.textAlignment = .center
            return label
        }()
        dateLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
            label.textAlignment = .center
            return label
        }()
    }
    private func addViews(){
        //        self.addSubview(wrapperView)
        [wrapperView, valueLabel, dayLabel, dateLabel].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrains(){
        valueLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.right.equalToSuperview().offset(5)
        }
        dayLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalToSuperview()
        }
    }
    
}
