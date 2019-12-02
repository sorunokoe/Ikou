//
//  GamesHeaderView.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class GamesHeaderView: UIView{
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        addViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setView(){
        self.backgroundColor = Constants.Colors.background.color
        titleLabel = {
            let label = UILabel()
            label.text = "Games Analytics"
            label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    private func addViews(){
        [titleLabel].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrains(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
