//
//  MainProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol MainWireframe: class{
    
}
protocol MainView: class {
    var presenter: MainPresenterProtocol? { get set }
}
protocol MainPresenterProtocol: class{
    var interactor: MainInputInteractorProtocol? { get set }
}
protocol MainInputInteractorProtocol: class{
    var presenter: MainOutputInteractorProtocol? { get set }
}
protocol MainOutputInteractorProtocol: class{
    
}
