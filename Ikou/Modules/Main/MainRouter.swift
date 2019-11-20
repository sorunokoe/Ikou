//
//  MainRouter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class MainRouter: MainWireframe{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController{
        let view = MainViewController()
        let nc = UINavigationController.init(rootViewController: view)
        return nc
    }
    
}
