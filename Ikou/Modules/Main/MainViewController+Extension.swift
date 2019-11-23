//
//  MainViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension MainViewController{
    // MARK: - UI
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    func setViews(){
        self.view.backgroundColor = Constants.Colors.background(view: self.view).color
        profileView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            view.backgroundColor = Constants.Colors.block(view: view).color
            return view
        }()
        avatarImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 20
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        }()
        usernameLabel = {
            let label = UILabel()
            label.textColor = Constants.Colors.title(view: label).color
            label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            return label
        }()
        statusLabel = {
            let label = UILabel()
            label.textColor = Constants.Colors.status.color
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            return label
        }()
        lastOnlineLabel = {
            let label = UILabel()
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()
        profileTypeLabel = {
            let label = UILabel()
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()
        lineView = {
            let view = UIView()
            view.layer.cornerRadius = 2
            view.clipsToBounds = true
            view.backgroundColor = .darkGray
            return view
        }()
        ownedGamesView = {
            let view = UIView()
            return view
        }()
        ownedGamesTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label.textColor = Constants.Colors.title(view: label).color
            label.text = "Games"
            return label
        }()
        ownedGamesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 280, height: 100)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 20
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.register(OwnedGameCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.OwnedGamesCellIdentifier.rawValue)
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
    }
    func addViews(){
        self.view.addSubview(profileView)
        [avatarImageView, usernameLabel, statusLabel,
         lastOnlineLabel, profileTypeLabel, lineView].forEach{
            self.profileView.addSubview($0)
        }
        self.view.addSubview(ownedGamesView)
        [ownedGamesTitleLabel, ownedGamesCollectionView].forEach{
            self.ownedGamesView.addSubview($0)
        }
    }
    func setConstrains(){
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(lineView.snp.bottom).offset(20)
        }
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.top)
            $0.left.equalTo(avatarImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom)
            $0.left.equalTo(avatarImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        lastOnlineLabel.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(10)
            $0.left.equalTo(avatarImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        profileTypeLabel.snp.makeConstraints {
            $0.top.equalTo(lastOnlineLabel.snp.bottom)
            $0.left.equalTo(avatarImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(profileTypeLabel.snp.bottom).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(2)
            $0.centerX.equalToSuperview()
        }
        
        ownedGamesView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(50)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(180)
        }
        ownedGamesTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        ownedGamesCollectionView.snp.makeConstraints {
            $0.top.equalTo(ownedGamesTitleLabel.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
