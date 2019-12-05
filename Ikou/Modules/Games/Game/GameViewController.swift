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
    
    var titleLabel: UILabel!
    var playTimeLabel: UILabel!
    var segmentCollectionView: UICollectionView!
    var segmentChooseView: UIView!
    var contentView: UIView!
    
    var choosedCell: UICollectionViewCell?
    
    var newsController: NewsViewController?
    var achievemenetsController: AchievementsViewController?
    var analyticsController: AnalyticsViewController?
    
    var choosedVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter?.loadGame()
        presenter?.loadNews()
        presenter?.loadAchievements()
        presenter?.loadCharts()
        presenter?.changeSegment(index: 0)
    }
}
extension GameViewController: GameViewProtocol{
    func navigate(to: GameSegment){
        switch to {
        case .news:
            newsController = NewsViewController.initializeWithLayout()
            guard let newsController = newsController else { return }
            newsController.presenter = presenter
            addOrRemoveChild(vc: newsController)
            choosedVC = newsController
        case .analytics:
            analyticsController = AnalyticsViewController()
            guard let analyticsController = analyticsController else { return }
            analyticsController.presenter = presenter
            addOrRemoveChild(vc: analyticsController)
            choosedVC = analyticsController
        case .achievements:
            achievemenetsController = AchievementsViewController()
            guard let achievemenetsController = achievemenetsController else { return }
            achievemenetsController.presenter = presenter
            addOrRemoveChild(vc: achievemenetsController)
            choosedVC = achievemenetsController
        }
    }
    func gameDidLoad(){
        guard let game = presenter?.getGame() else { return }
        titleLabel.text = game.name
        playTimeLabel.text = presenter?.getPlayTime()
    }
    func showError(error: String) {
        self.presentError(error)
    }
    
    func newsDidLoad() {
        guard let newsController = newsController else { return }
        newsController.updateNews()
    }
    func achievementsDidLoad() {
        guard let achievemenetsController = achievemenetsController else { return }
        achievemenetsController.updateAchievements()
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
