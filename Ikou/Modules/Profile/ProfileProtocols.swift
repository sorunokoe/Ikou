//
//  ProfileProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol ProfileWireframeProtocol: class{
    
}
protocol ProfileViewProtocol: class{
    var presenter: ProfilePresenterProtocol? { get set }
}
protocol ProfilePresenterProtocol: class{
    var interactor: ProfileInputInteractorProtocol? { get set }
}
protocol ProfileInputInteractorProtocol: class{
    var presenter: ProfileOutputInteractorProtocol? { get set }
}
protocol ProfileOutputInteractorProtocol: class{
    
}
