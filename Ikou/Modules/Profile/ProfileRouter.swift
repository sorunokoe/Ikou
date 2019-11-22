//
//  ProfileRouter.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class ProfileRouter: ProfileWireframeProtocol{
    
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController{
        let view = ProfileViewController()
        return view
    }
    
}
