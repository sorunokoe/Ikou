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
    
    lazy var emptyGamesView: EmptyView = {
        let view = EmptyView()
        view.setData(title: "You have no owned games.")
        return view
    }()
    lazy var emptyFriendsView: EmptyView = {
        let view = EmptyView()
        view.setData(title: "You have no friends. I'm sorry..")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        configUI()
        presenter?.loadProfile()
        presenter?.loadOwnedGames()
        presenter?.loadFriends()
    }
    
    // MARK: - Update data
    @objc func refresh(){
        presenter?.loadProfile()
        presenter?.loadOwnedGames()
        presenter?.loadFriends()
        self.scrollView.refreshControl?.endRefreshing()
    }
    
    // MARK: - Set NavBar
    func setNavBar(){
        let button = UIBarButtonItem(image: UIImage(named: "settings"), style: .done, target: self, action: #selector(openSettings))
        self.navigationItem.rightBarButtonItem = button
    }
    @objc private func openSettings(){
        let ac = UIAlertController(title: "Settings", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Sign out", style: .default, handler: {[weak self] (_) in
            self?.presenter?.exit()
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(ac, animated: true, completion: nil)
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
        if self.presenter?.getGames().isEmpty ?? true{
            self.ownedGamesCollectionView.backgroundView = emptyGamesView
        }else{
            self.ownedGamesCollectionView.backgroundView = nil
            self.ownedGamesCollectionView.reloadData()
        }
        
    }
    func didLoadFriends() {
        if self.presenter?.getFriends().isEmpty ?? true{
            self.friendsTableView.backgroundView = emptyFriendsView
        }else{
            self.friendsTableView.backgroundView = nil
            self.friendsTableView.reloadData()
        }
    }
    
    func showError(_ error: String) {
        self.presentError(error)
    }
}
