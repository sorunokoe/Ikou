//
//  GameProtocols.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol GameWireframeProtocol: class{
    
}
protocol GameViewProtocol: class{
    var presenter: GamePresenterProtocol? { get set }
    
    func newsDidLoad()
    func showError(error: String)
}
protocol GamePresenterProtocol: class{
    var interactor: GameInputInteractorProtocol? { get set }
    
    func loadNews()
}
protocol GameInputInteractorProtocol: class{
    var presenter: GameOutputInteractorProtocol? { get set }
    
    func loadNews(appId: String)
}
protocol GameOutputInteractorProtocol: class{
    func didLoadNews(news: [News])
    func didLoadWith(error: SteamError)
}
