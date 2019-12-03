//
//  GameViewController.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController{
    
    var presenter: GamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
}
extension GameViewController: GameViewProtocol{
    func showError(error: String) {
        // TODO: shhow error
    }
    
    func newsDidLoad() {
        
    }
}
