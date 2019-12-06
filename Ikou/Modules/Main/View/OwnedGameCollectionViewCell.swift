//
//  OwnedGameCollectionViewCell.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class OwnedGameCollectionViewCell: UICollectionViewCell{
    
    var logoImageView: UIImageView!
    var titleView: UIView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(game: Game){
        ImageHelper.shared.getImageBy(url: .game(appid: game.appid, hash: game.img_logo_url)) {[weak self] image in
            self?.logoImageView.image = image
        }
        titleLabel.text = game.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearContent()
    }
    
    private func clearContent() {
        logoImageView.image = nil
        titleLabel.text = nil
    }
}
extension OwnedGameCollectionViewCell{
    private func configUI() {
        setViews()
        addViews()
        setConstraints()
    }
    private func setViews() {
        self.layer.cornerRadius = 20
        self.makeShadow()
        logoImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 20
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        titleView = {
            let view = UIView()
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            view.isHidden = true
            view.backgroundColor = Constants.Colors.block.color
            return view
        }()
        titleLabel = {
            let label = UILabel()
            label.textColor = Constants.Colors.title.color
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.adjustsFontSizeToFitWidth = true
            return label
        }()
    }
    private func addViews() {
        self.addSubview(logoImageView)
        self.addSubview(titleView)
        self.titleView.addSubview(titleLabel)
    }
    private func setConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(titleView.snp.top).offset(10)
        }
        titleView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.top).offset(-10)
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
}
