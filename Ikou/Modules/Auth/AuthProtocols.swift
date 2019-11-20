//
//  AuthProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol AuthWireframeProtocol: class{
    
}
protocol AuthViewProtocol: class{
    var presenter: AuthPresenterProtocol?  { get set }
}
protocol AuthPresenterProtocol: class{
    var interactor: AuthInteractorInputProtocol? { get set }
}
protocol AuthInteractorInputProtocol: class{
    var presenter: AuthPresenterProtocol?  { get set }
}
protocol AuthInteractorOutputProtocol: class{
    
}
