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
    private var cacheHelper: CacheHelper?
    var interactor: AuthInteractorInputProtocol?
    var router: AuthWireframeProtocol?
    
    init(interface: AuthViewProtocol, interactor: AuthInteractorInputProtocol, router: AuthWireframeProtocol){
        self.interactor = interactor
        self.view = interface
        self.router = router
        self.cacheHelper = CacheHelper()
    }
    
    func getAuthURL(){
        guard let url = URL(string: Constants.API.authUrl.rawValue) else { return }
        view?.didLoadAuth(url: url)
    }
    func retrieveSteamIdFrom(_ url: String?) {
        guard let url = url, let cacheHelper = cacheHelper else { return }
        let list = url.split(separator: "/")
        let steamID = list.first { (part) -> Bool in
            return part.count == 17
        }
        if let steamID = steamID{
            cacheHelper.set(key: .steamID, value: String(steamID))
            router?.moveToMain()
        }
    }
}
