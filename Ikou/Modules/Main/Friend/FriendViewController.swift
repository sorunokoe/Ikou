//
//  FriendViewController.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController{
    
    var presenter: FriendPresenterProtocol?
    
    // MARK: - UI Properties
    var scrollView: UIScrollView!
    var mainStackView: UIStackView!
    var avatarImageView: UIImageView!
    var titleLabel: UILabel!
    var statusLabel: UILabel!
    var lastOnlineLabel: UILabel!
    var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension FriendViewController: FriendViewProtocol{
    
    func didLoadFriend() {
        
    }
    
}
