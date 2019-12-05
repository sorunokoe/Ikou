//
//  FriendRouter.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class FriendRouter: FriendWireframeProtocol{
    
    var viewController: UIViewController?
    
    static func createModule(friend: Friend) -> UIViewController{
        let view = FriendViewController()
        let interactor = FriendInteractor()
        let router = FriendRouter()
        let presenter = FriendPresenter(view: view, interactor: interactor, router: router, friend: friend)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
