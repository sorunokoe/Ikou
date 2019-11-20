//
//  AuthRouter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class AuthRouter: AuthWireframeProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
       let view = AuthViewController()
       let interactor = AuthInteractor()
       let router = AuthRouter()
       let presenter = AuthPresenter(interface: view, interactor: interactor, router: router)

       view.presenter = presenter
       interactor.presenter = presenter
       router.viewController = view
       
       return view
    }

}
