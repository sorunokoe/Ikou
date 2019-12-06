//
//  FriendsTableViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/2/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class FriendsTableViewCell: UITableViewCell{

    var avatarImageView: UIImageView!
    var usernameLabel: UILabel!
    var statusLabel: UILabel!
    var lastOnlineLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(profile: Profile){
        ImageHelper.shared.getImageBy(url: .avatar(url: profile.avatar)) {[weak self] (image) in
            self?.avatarImageView.image = image
        }
        usernameLabel.text = profile.personaname
        statusLabel.text = Constants.Steam.status[profile.personastate]
        lastOnlineLabel.text = "Last online: \(TimeAndDateHelper.shared.getTimeFrom(unix: profile.lastlogoff))"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.image = nil
        usernameLabel.text = nil
        statusLabel.text = nil
        lastOnlineLabel.text = nil
    }
    
}
extension FriendsTableViewCell{
    private func configUI(){
        setViews()
        addViews()
        setConstrains()
    }
    private func setViews(){
        self.backgroundColor = .clear
        avatarImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = Constants.Layout.avatarCornerRadius.rawValue
            return imageView
        }()
        usernameLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        statusLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = Constants.Colors.status.color
            return label
        }()
        lastOnlineLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    private func addViews(){
        [avatarImageView, usernameLabel, statusLabel, lastOnlineLabel].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrains(){
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        usernameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalTo(avatarImageView.snp.right).offset(25)
            $0.right.equalToSuperview().offset(-20)
        }
        statusLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).offset(25)
            $0.top.equalTo(usernameLabel.snp.bottom)
            $0.right.equalToSuperview().offset(-20)
        }
        lastOnlineLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).offset(25)
            $0.top.equalTo(statusLabel.snp.bottom).offset(10)
            $0.right.equalToSuperview().offset(-20)
        }
    }
    
}
