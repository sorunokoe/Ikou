//
//  AuthProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol AuthWireframeProtocol: class{
    func moveToMain()
}
protocol AuthViewProtocol: class{
    var presenter: AuthPresenterProtocol?  { get set }
    
    func didLoadAuth(url: URL)
}
protocol AuthPresenterProtocol: class{
    var interactor: AuthInteractorInputProtocol? { get set }
    
    func getAuthURL()
    func retrieveSteamIdFrom(cookies: [HTTPCookie])
}
protocol AuthInteractorInputProtocol: class{
    var presenter: AuthPresenterProtocol?  { get set }
}
protocol AuthInteractorOutputProtocol: class{
    
}
