//
//  TabBarPresenter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class TabBarPresenter: TabBarPresenterProtocol{
    
    var view: TabBarViewProtocol?
    var router: TabBarWireframeProtocol?
    
    init(interface: TabBarViewProtocol, router: TabBarWireframeProtocol){
        self.view = interface
        self.router = router
    }
    
    func didSelectTab(index: Int) {
        
    }
    
}
