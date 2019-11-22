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
    var profileView: UIView!
    var avatarImageView: UIImageView!
    var usernameLabel: UILabel!
    var statusLabel: UILabel!
    var lastOnlineLabel: UILabel!
    var profileTypeLabel: UILabel!
    var lineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadProfile()
    }
    
}
extension MainViewController: MainViewProtocol{
    func showError(_ error: String) {
        print(error)
    }
    
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
}
extension MainViewController{
    // MARK: - UI
    func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    func setViews(){
        self.view.backgroundColor = UIColor(hex: "#1d1d1d")
        profileView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            view.backgroundColor = UIColor(hex: "#242424")
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
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            return label
        }()
        statusLabel = {
            let label = UILabel()
            label.textColor = Constants.Colors.blueOcean
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
    }
    func addViews(){
        self.view.addSubview(profileView)
        [avatarImageView, usernameLabel, statusLabel,
         lastOnlineLabel, profileTypeLabel, lineView].forEach{
            self.profileView.addSubview($0)
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
    }
    
}
