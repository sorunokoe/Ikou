//
//  MainViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

extension MainViewController{
    enum CellIdentifier: String{
        case OwnedGamesCellIdentifier
        case FriendsCellIdentifier
    }
    // MARK: - UI
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    func setViews(){
        self.navigationItem.title = "Steam Profile"
        self.view.backgroundColor = Constants.Colors.background.color
        setProfileView()
        setOwnedGamesView()
        setFriends()
        scrollView = {
            let scrollView = UIScrollView()
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.refreshControl = UIRefreshControl()
            scrollView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
            return scrollView
        }()
        mainStackView = {
            let stackView = UIStackView(arrangedSubviews: [profileView, ownedGamesView, friendsView])
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 30
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
    }
    private func setProfileView(){
        profileView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.backgroundColor = Constants.Colors.block.color
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
            label.textColor = Constants.Colors.title.color
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
            view.isHidden = true
            view.layer.cornerRadius = 2
            view.clipsToBounds = true
            view.backgroundColor = .darkGray
            return view
        }()
    }
    private func setOwnedGamesView(){
        ownedGamesView = {
            let view = UIView()
            return view
        }()
        ownedGamesTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.text = "Games"
            return label
        }()
        ownedGamesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 200, height: 100)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 20
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            collectionView.register(OwnedGameCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.OwnedGamesCellIdentifier.rawValue)
            collectionView.backgroundView = emptyGamesView
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
    }
    private func setFriends(){
        friendsView = {
            let view = UIView()
            view.layer.cornerRadius = 20.0
            view.backgroundColor = Constants.Colors.block.color
            return view
        }()
        friendsTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            label.textColor = Constants.Colors.title.color
            label.text = "Friends"
            return label
        }()
        friendsTableView = {
            let tableView = UITableView()
            tableView.backgroundColor = .clear
            tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: CellIdentifier.FriendsCellIdentifier.rawValue)
            tableView.backgroundView = emptyFriendsView
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            return tableView
        }()
    }
    private func addViews(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(mainStackView)
        [avatarImageView, usernameLabel, statusLabel,
         lastOnlineLabel, profileTypeLabel, lineView].forEach{
            self.profileView.addSubview($0)
        }
        [ownedGamesTitleLabel, ownedGamesCollectionView].forEach{
            self.ownedGamesView.addSubview($0)
        }
        [friendsTitleLabel, friendsTableView].forEach{
            self.friendsView.addSubview($0)
        }
    }
    private func setConstrains(){
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            
            $0.width.equalToSuperview()
        }
        setProfileConstrain()
        setOwnedGamesConstrain()
        setFriendsConstrain()
    }
    
    private func setProfileConstrain(){
        profileView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(self.topDistance+20)
//            $0.left.equalToSuperview().offset(20)
//            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(140)
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
    }
    private func setOwnedGamesConstrain(){
        ownedGamesView.snp.makeConstraints {
//            $0.top.equalTo(profileView.snp.bottom).offset(50)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(140)
        }
        ownedGamesTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        ownedGamesCollectionView.snp.makeConstraints {
            $0.top.equalTo(ownedGamesTitleLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    private func setFriendsConstrain(){
        friendsView.snp.makeConstraints {
//            $0.top.equalTo(ownedGamesView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(500)
        }
        friendsTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(20)
        }
        friendsTableView.snp.makeConstraints {
            $0.top.equalTo(friendsTitleLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
