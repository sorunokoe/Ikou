//
//  MainViewController.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, MainView{
    
    var titleLabel: UILabel!
    var cacheHelper: CacheHelper?
    // MARK: - Protocol
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        cacheHelper = CacheHelper()
        titleLabel.text = cacheHelper?.get(.steamID) ?? "No Steam ID"
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
