//
//  AnalyticsGameTimeRangeView.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class AnalyticsGameTimeRangeView: UIView{
    
    var dateRangeChoosed: UIView!
    var monthLabel: UILabel!
    var weekLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension AnalyticsGameTimeRangeView{
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    func setViews(){
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderColor = Constants.Colors.title.color.cgColor
        self.layer.borderWidth = 1.0
        dateRangeChoosed = {
            let view = UIView()
            view.backgroundColor = Constants.Colors.status.color
            view.layer.cornerRadius = 10
            return view
        }()
        monthLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.textAlignment = .center
            label.text = "Month"
            return label
        }()
        weekLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.textAlignment = .center
            label.text = "Week"
            return label
        }()
    }
    func addViews(){
        [dateRangeChoosed, monthLabel, weekLabel].forEach{
            self.addSubview($0)
        }
    }
    func setConstrains(){
        dateRangeChoosed.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        monthLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        weekLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
    }
}
