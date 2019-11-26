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
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func hideBackButtonTitle() {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
    }

    public func hideBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    public func configureNavBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = UIColor.mainBlack()
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
            self.navigationController?.overrideUserInterfaceStyle = .light
            self.navigationController?.topViewController?.overrideUserInterfaceStyle = .light
        }
    }
    
    public func configureNavBarTitle() {
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
            self.navigationController?.overrideUserInterfaceStyle = .light
            self.navigationController?.topViewController?.overrideUserInterfaceStyle = .light
        }
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.mainBlack(),
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
    public func setTabBarItem(image: UIImage, selectedImage: UIImage, title: String) {
        tabBarItem = UITabBarItem.init(title: title, image: image, selectedImage: selectedImage)
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -2.0)
    }
    
    public func hideIconButtonRight() {
        guard let barButton = self.navigationItem.rightBarButtonItem else {
            return
        }
        if barButton.tag != 335 {
            return
        }
        self.navigationItem.rightBarButtonItem = nil
    }

    public func rightButtonEnabled(isEnabled: Bool) {
        if let button = navigationItem.rightBarButtonItem {
            button.isEnabled = isEnabled
        }
    }
    
    @objc
    func hideModalVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public var topDistance: CGFloat{
         get{
             if self.navigationController != nil && !self.navigationController!.navigationBar.isTranslucent{
                 return 0
             }else{
                let barHeight=self.navigationController?.navigationBar.frame.height ?? 0
                let statusBarHeight = UIApplication.shared.isStatusBarHidden ? CGFloat(0) : UIApplication.shared.statusBarFrame.height
                return barHeight + statusBarHeight
             }
         }
    }
    
}
