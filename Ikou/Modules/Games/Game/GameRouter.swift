//
//  GameRouter.swift
//  Ikou
//
//  Created by Salgara on 12/4/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class GameRouter: GameWireframeProtocol{
    
    var viewController: UIViewController!
    
    static func createModule(game: Game) -> UIViewController{
        let steamId = CacheHelper.shared.get(.steamID) ?? ""
        let view = GameViewController()
        let interactor = GameInteractor(appId: game.appid, steamId: steamId)
        let router = GameRouter()
        let presenter = GamePresenter(view: view, interactor: interactor, router: router, game: game, steamId: steamId)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
        
    func moveToNews(url: String){
        if let url = URL(string: url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
