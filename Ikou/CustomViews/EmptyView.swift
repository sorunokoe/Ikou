//
//  EmptyView.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class EmptyView: UIView{
    
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        addViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String){
        self.titleLabel.text = title
    }
    
    private func setViews(){
        self.backgroundColor = .clear
        imageView = {
            let view = UIImageView()
            view.image = UIImage(named: "earth")
            view.contentMode = .scaleAspectFit
            return view
        }()
        titleLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = Constants.Colors.title.color
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.numberOfLines = 10
            return label
        }()
    }
    private func addViews(){
        [imageView, titleLabel].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrains(){
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-15)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-50)
        }
    }
    
}
