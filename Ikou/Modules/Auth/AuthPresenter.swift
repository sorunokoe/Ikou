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
    
    func getAuthURL(){
        guard let url = URL(string: Constants.API.authUrl.rawValue) else { return }
        view?.didLoadAuth(url: url)
    }
    func retrieveSteamIdFrom(cookies: [HTTPCookie]) {
        var steamID: String?
        for cookie in cookies{
            if cookie.name == "steamLoginSecure" {
                steamID = String(cookie.value.split(separator: "%")[0])
                HTTPCookieStorage.shared.deleteCookie(cookie)
                break
            }
        }
        if let steamID = steamID{
            CacheHelper.shared.set(key: .steamID, value: String(steamID))
            router?.moveToMain()
        }
    }
    
}
