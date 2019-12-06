//
//  GamesRouter.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class GamesRouter: GamesWireframeProtocol{
    
    var vc: UIViewController?
    
    public static func createModule() -> UIViewController{
        let steamId = CacheHelper.shared.get(.steamID) ?? ""
        let view = GamesViewController()
        let interactor = GamesInteractor()
        let router = GamesRouter()
        let presenter = GamesPresenter(interface: view, interactor: interactor, router: router, steamId: steamId)
        view.presenter = presenter
        interactor.presenter = presenter
        router.vc = view
        let nc = UINavigationController.init(rootViewController: view)
        return nc
    }
    
    func moveToGame(game: Game) {
        let vc = GameRouter.createModule(game: game)
        self.vc?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
