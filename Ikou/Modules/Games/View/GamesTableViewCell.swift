//
//  GamesTableViewCell.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class GamesTableViewCell: UITableViewCell{
    
    var iconImageView: UIImageView!
    var titleLabel: UILabel!
    var playTimeLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(game: Game){
        let appId = "\(game.appid)"
        let url = game.img_logo_url
        ImageHelper.shared.getImageBy(url: .ownedGame(appid: appId, hash: url)) {[weak self] (image) in
            self?.iconImageView.image = image
        }
        titleLabel.text = game.name
        let hours = Double(game.playtime_forever)/60.0
        playTimeLabel.text = String(format: "%0.1f hours on record", hours)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        playTimeLabel.text = nil
    }
    
}
extension GamesTableViewCell{
    private func configUI(){
        setViews()
        addViews()
        setConstraints()
    }
    private func setViews(){
        self.backgroundColor = .clear
        self.contentView.backgroundColor = Constants.Colors.block.color
        self.contentView.layer.cornerRadius = Constants.Layout.avatarCornerRadius.rawValue
        iconImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = Constants.Layout.avatarCornerRadius.rawValue
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        playTimeLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    private func addViews(){
        [iconImageView, titleLabel, playTimeLabel].forEach{
            self.contentView.addSubview($0)
        }
    }
    private func setConstraints(){
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-10)
        }
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(80)
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(iconImageView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-20)
        }
        playTimeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalTo(iconImageView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
