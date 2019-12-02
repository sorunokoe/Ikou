//
//  MainViewController.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController{
    
    var cacheHelper: CacheHelper?
    
    // MARK: - Protocol
    var presenter: MainPresenterProtocol?
    
    // MARK: - UI Properties
    var scrollView: UIScrollView!
    var mainStackView: UIStackView!
    var profileView: UIView!
    var avatarImageView: UIImageView!
    var usernameLabel: UILabel!
    var statusLabel: UILabel!
    var lastOnlineLabel: UILabel!
    var profileTypeLabel: UILabel!
    var lineView: UIView!
    var ownedGamesView: UIView!
    var ownedGamesTitleLabel: UILabel!
    var ownedGamesCollectionView: UICollectionView!
    var friendsView: UIView!
    var friendsTitleLabel: UILabel!
    var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadProfile()
        presenter?.loadOwnedGames()
        presenter?.loadFriends()
    }
    
}
extension MainViewController: MainViewProtocol{
    func didLoadProfile() {
        presenter?.getAvatar(completion: {[weak self] image in
            guard let `self` = self else { return }
            self.avatarImageView.image = image
        })
        usernameLabel.text = presenter?.getUsername()
        statusLabel.text = presenter?.getUserStatus()
        lastOnlineLabel.text = presenter?.getLastTimeOnline()
        profileTypeLabel.text = presenter?.getPrivateOrPublicProfile()
    }
    func didLoadOwnedGames() {
        self.ownedGamesCollectionView.reloadData()
    }
    func didLoadFriends() {
        self.friendsTableView.reloadData()
    }
    
    func showError(_ error: String) {
        // TODO: Show Error
    }
}
