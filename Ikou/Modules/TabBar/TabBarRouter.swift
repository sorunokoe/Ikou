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
        mainPager.setTabBarItem(image: icons[0], selectedImage: icons[1], title: "Profile")
        return [mainPager]
    }
    private static func moduleImages() -> [UIImage]{
        let gameIconImage = UIImage(named: Constants.Images.gameIcon.rawValue) ?? UIImage()
        let gameIconImageTapped = UIImage(named: Constants.Images.gameIconTapped.rawValue) ?? UIImage()
        return [gameIconImage, gameIconImageTapped]
    }
    
}
