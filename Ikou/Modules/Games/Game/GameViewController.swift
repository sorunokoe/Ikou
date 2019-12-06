//
//  GameViewController.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class GameViewController: UIViewController{
    
    var presenter: GamePresenterProtocol?
    
    var iconImageView: UIImageView!
    var titleLabel: UILabel!
    var playTimeLabel: UILabel!
    var segmentCollectionView: UICollectionView!
    var segmentChooseView: UIView!
    var contentView: UIView!
    
    var choosedCell: UICollectionViewCell?
    
    lazy var newsController: NewsViewController = {
        let vc = NewsViewController()
        vc.viewDidLoad()
        vc.presenter = presenter
        return vc
    }()
    lazy var achievemenetsController: AchievementsViewController = {
        let vc = AchievementsViewController()
        vc.viewDidLoad()
        vc.presenter = presenter
        return vc
    }()
    lazy var analyticsController: AnalyticsViewController = {
        let vc = AnalyticsViewController()
        vc.viewDidLoad()
        vc.presenter = presenter
        return vc
    }()
    
    var choosedVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadGame()
        presenter?.loadNews()
        presenter?.loadAchievements()
        presenter?.loadStats()
        presenter?.changeSegment(index: 0)
    }
}
extension GameViewController: GameViewProtocol{
    func navigate(to: GameSegment){
        switch to {
        case .news:
            addOrRemoveChild(vc: newsController)
            choosedVC = newsController
        case .analytics:
            addOrRemoveChild(vc: analyticsController)
            choosedVC = analyticsController
        case .achievements:
            addOrRemoveChild(vc: achievemenetsController)
            choosedVC = achievemenetsController
        }
    }
    func gameDidLoad(){
        guard let game = presenter?.getGame() else { return }
        ImageHelper.shared.getImageBy(url: .game(appid: game.appid, hash: game.img_logo_url)) {[weak self] (image) in
            self?.iconImageView.image = image
        }
        titleLabel.text = game.name
        playTimeLabel.text = presenter?.getPlayTime()
    }
    func showError(error: String, segment: GameSegment) {
        switch segment {
        case .news:
            self.newsController.show(error: error)
        case .achievements:
            self.achievemenetsController.show(error: error)
        case .analytics:
            self.analyticsController.show(error: error)
        }
    }
    
    func newsDidLoad() {
        newsController.updateNews()
    }
    func achievementsDidLoad() {
        achievemenetsController.updateAchievements()
    }
    func statsDidLoad(){
        if let statsItem = presenter?.getStats(), !statsItem.isEmpty{
            let statsFacade = StatisticsFacade(statsItems: statsItem)
            analyticsController.updateStats(statsFacade: statsFacade)
        }
    }
    
    // MARK: - Add & Remove Child
    func addOrRemoveChild(vc: UIViewController){
        if let choosedVC = choosedVC{
            choosedVC.willMove(toParent: nil)
            choosedVC.removeFromParent()
            choosedVC.view.removeFromSuperview()
        }
        self.contentView.addSubview(vc.view)
        vc.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
}
