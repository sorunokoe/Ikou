//
//  LastSessionsTableCell.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class LastSessionsTableCell: UITableViewCell{
    
    private var logoImageView: UIImageView!
    private var titleLabel: UILabel!
    private var lastPlayedLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(session: LastSession){
        guard let appId = session.appid, let hash = session.img_icon_url else { return }
        ImageHelper.shared.getImageBy(url: .game(appid: appId, hash: hash)) {[weak self] (image) in
            self?.logoImageView.image = image
        }
        titleLabel.text = session.name
        if let playTime = session.playtime_2weeks{
            let time = Double(playTime)/60.0
            lastPlayedLabel.text = String(format: "Played in last 2 weeks %0.1f hrs", time)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearContent()
    }
    
    private func clearContent(){
        logoImageView.image = nil
        titleLabel.text = nil
        lastPlayedLabel.text = nil
    }
    
}
extension LastSessionsTableCell{
    private func configUI(){
        setViews()
        addViews()
        setConstraints()
    }
    
    private func setViews(){
        self.backgroundColor = Constants.Colors.block.color
        self.layer.cornerRadius = 20
        logoImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            logoImageView.layer.cornerRadius = 20
            logoImageView.makeShadow()
            return imageView
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            label.textColor = Constants.Colors.title.color
            return label
        }()
        lastPlayedLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = Constants.Colors.title.color
            return label
        }()
    }
    private func addViews(){
        [logoImageView, titleLabel, lastPlayedLabel].forEach {
            self.addSubview($0)
        }
    }
    private func setConstraints(){
        logoImageView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(logoImageView.snp.right).offset(20)
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        lastPlayedLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalTo(logoImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
