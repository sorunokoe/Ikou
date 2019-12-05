//
//  UIViewController+Extension.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func setTabBarItem(image: UIImage, title: String, tag: Int) {
        tabBarItem = UITabBarItem.init(title: title, image: image, tag: tag)
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -2.0)
    }
    
    func presentError(_ error: String){
        let ac = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(ac, animated: true, completion: nil)
    }
    
}
