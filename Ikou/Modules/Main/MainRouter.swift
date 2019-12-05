//
//  MainRouter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class MainRouter: MainWireframeProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController{
        let steamId = CacheHelper.shared.get(.steamID) ?? ""
        let view = MainViewController()
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter(interface: view, router: router, interactor: interactor, steamId: steamId)
        view.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        let nc = UINavigationController.init(rootViewController: view)
        return nc
    }
    
    func moveToOut(){
        NavigationHelper.shared.start()
    }
    
}
