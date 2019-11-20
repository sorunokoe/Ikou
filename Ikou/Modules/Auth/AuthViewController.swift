//
//  AuthViewController.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, AuthViewProtocol{
    
    
    //MARK: - UI Properties
    var titleLabel: UILabel!
    
    //MARK: - Protocol
    var presenter: AuthPresenterProtocol?
    
    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()
    }
    
}
extension AuthViewController{
    
    //MARK: - UI
    func setUI(){
        
    }
    
}
