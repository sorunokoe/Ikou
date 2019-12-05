//
//  TabBarRouter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarWireframeProtocol{
    
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController{
        let view = TabBarViewController()
        let router = TabBarRouter()
        view.viewControllers = combineModules()
        let presenter = TabBarPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
    private static func combineModules() -> [UIViewController]{
        let icons = moduleImages()
        
        let mainPager = MainRouter.createModule()
        mainPager.setTabBarItem(image: icons[0], title: "Profile", tag: 0)
        
        let gamesPager = GamesRouter.createModule()
        gamesPager.setTabBarItem(image: icons[1], title: "Games", tag: 1)
       
       let sessionsPager = LastSessionsRouter.createModule()
       sessionsPager.setTabBarItem(image: icons[2], title: "Sessions", tag: 2)
        
        return [mainPager, gamesPager, sessionsPager]
    }
    private static func moduleImages() -> [UIImage]{
        let profileIconImage = UIImage(named: Constants.Images.profileIconTapped.rawValue) ?? UIImage()
        let gameIconImage = UIImage(named: Constants.Images.gameIconTapped.rawValue) ?? UIImage()
        let sessionsIconImage = UIImage(named: Constants.Images.sessionsIcon.rawValue) ?? UIImage()
        return [profileIconImage, gameIconImage, sessionsIconImage]
    }
    
}
