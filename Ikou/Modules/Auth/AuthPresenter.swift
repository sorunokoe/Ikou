//
//  AuthPresenter.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class AuthPresenter: AuthPresenterProtocol, AuthInteractorOutputProtocol{
    
    weak private var view: AuthViewProtocol?
    var interactor: AuthInteractorInputProtocol?
    var router: AuthWireframeProtocol?
    
    init(interface: AuthViewProtocol, interactor: AuthInteractorInputProtocol, router: AuthWireframeProtocol){
        self.interactor = interactor
        self.view = interface
        self.router = router
    }
}
