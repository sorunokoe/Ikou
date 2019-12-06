//
//  NavigationHelper.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class NavigationHelper{
    
    static var shared = NavigationHelper()
    private var window: UIWindow?
    
    func set(window: UIWindow?){
        self.window = window
    }
    
    func start(){
        guard let window = window else { return }
        var view: UIViewController!
        if CacheHelper.shared.get(.steamID) == nil{
            view = AuthRouter.createModule()
        }else{
            view = TabBarRouter.createModule()
        }
        window.rootViewController = view
    }
    
}
