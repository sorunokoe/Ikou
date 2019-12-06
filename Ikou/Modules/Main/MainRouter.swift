//
//  MainRouter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class MainRouter: MainWireframeProtocol{
    
    weak var vc: UIViewController?
    
    static func createModule() -> UIViewController{
        let steamId = CacheHelper.shared.get(.steamID) ?? ""
        let view = MainViewController()
        let router = MainRouter()
        let interactor = MainInteractor(steamId: steamId)
        let presenter = MainPresenter(interface: view, router: router, interactor: interactor, steamId: steamId)
        view.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.vc = view
        let nc = UINavigationController.init(rootViewController: view)
        return nc
    }
    
    func moveToGame(game: Game){
        let vc = GameRouter.createModule(game: game)
        self.vc?.navigationController?.pushViewController(vc, animated: true)
    }
    func moveToOut(){
        App.shared.clear()
        NavigationHelper.shared.start()
    }
    
}
