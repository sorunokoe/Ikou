//
//  NewsGameCollectionViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class NewsGameCollectionViewCell: UICollectionViewCell{
    
    var titleLabel: UILabel!
    var dateLabel: UILabel!
    var feedView: UIView!
    var feedLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        self.frame = self.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    func setData(news: News){
        titleLabel.text = news.title
        if let date = news.date{
            dateLabel.text = TimeAndDateHelper.getTimeFrom(unix: date)
        }
        feedLabel.text = news.feedlabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        dateLabel.text = nil
        feedLabel.text = nil
    }
    
}
extension NewsGameCollectionViewCell{
    
    private func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    
    private func setViews(){
        self.contentView.backgroundColor = Constants.Colors.block.color
        self.contentView.layer.cornerRadius = Constants.Layout.avatarCornerRadius.rawValue
        titleLabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        dateLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        feedView = {
            let view = UIView()
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            view.backgroundColor = Constants.Colors.background.color
            return view
        }()
        feedLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    private func addViews(){
        [titleLabel, dateLabel, feedView].forEach{
            self.contentView.addSubview($0)
        }
        feedView.addSubview(feedLabel)
    }
    private func setConstrains(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(titleLabel.snp.left)
            $0.right.equalTo(titleLabel.snp.right)
        }
        feedView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(15)
            $0.right.equalTo(titleLabel.snp.right)
            $0.left.equalTo(feedLabel.snp.left).offset(-10)
            $0.bottom.equalTo(feedLabel.snp.bottom).offset(10)
        }
        feedLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
