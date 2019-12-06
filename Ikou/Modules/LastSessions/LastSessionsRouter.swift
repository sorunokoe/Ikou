//
//  LastSessionsRouter.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class LastSessionsRouter: LastSessionsWireframe{
    
    var vc: UIViewController?
    
    static func createModule() -> UIViewController{
        let steamId = CacheHelper.shared.get(.steamID) ?? ""
        let view = LastSessionsViewController()
        let interactor = LastSessoinsInteractor()
        let router = LastSessionsRouter()
        let presenter = LastSessionsPresenter(view: view, interactor: interactor, router: router, steamId: steamId)
        view.presenter = presenter
        interactor.presenter = presenter
        router.vc = view
        let nc = UINavigationController.init(rootViewController: view)
        return nc
    }
    
}
