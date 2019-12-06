//
//  GameViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension GameViewController{
    enum CellIdentifier: String{
        case SegmentIdentifier
    }
    
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    private func setViews(){
        self.view.backgroundColor = Constants.Colors.background.color
        iconImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 20
            imageView.makeShadow()
            return imageView
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        playTimeLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = .darkGray
            return label
        }()
        segmentCollectionView = {
            let layout = UICollectionViewFlowLayout()
            let width = UIScreen.main.bounds.width/CGFloat(presenter?.segments.count ?? 1)
            layout.itemSize = CGSize(width: width, height: 40)
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.backgroundColor = Constants.Colors.block.color
            collectionView.register(GameSegmentCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.SegmentIdentifier.rawValue)
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        contentView = {
            let view = UIView()
            return view
        }()
    }
    func addViews(){
        [iconImageView, titleLabel, playTimeLabel,
         segmentCollectionView, contentView].forEach{
            self.view.addSubview($0)
        }
    }
    func setConstrains(){
        iconImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(80)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        playTimeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(titleLabel.snp.left)
            $0.right.equalTo(titleLabel.snp.right)
        }
        segmentCollectionView.snp.makeConstraints {
            $0.top.equalTo(playTimeLabel.snp.bottom).offset(40)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(40)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(segmentCollectionView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
