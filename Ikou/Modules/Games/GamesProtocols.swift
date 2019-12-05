//
//  GamesProtocols.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol GamesWireframeProtocol: class{
    func moveToGame(game: Game)
}
protocol GamesViewProtocol: class{
    
    var presenter: GamesPresenterProtocol? { get set }
    
    func didLoadGames()
    func showError(_ error: String)
}
protocol GamesPresenterProtocol: class{
    
    var interactor: GamesInputInteractorProtocol? { get set }
    
    func loadGames()
    func getGames() -> [Game]
    func moveToGame(index: Int)
}
protocol GamesInputInteractorProtocol: class{
    
    var presenter: GamesOutputInteractorProtocol? { get set }
    
    func loadGames(steamId: String)
}
protocol GamesOutputInteractorProtocol: class{
    
    func didLoadGames(games: [Game])
    func didLoadWith(error: SteamError)
}
