//
//  GamesPresenter.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class GamesPresenter: GamesPresenterProtocol{
    
    var interactor: GamesInputInteractorProtocol?
    private weak var view: GamesViewProtocol?
    private var router: GamesWireframeProtocol?
    private var steamId: String?
    private var games = [Game]()
    
    init(interface: GamesViewProtocol, interactor: GamesInputInteractorProtocol, router: GamesWireframeProtocol, steamId: String){
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.steamId = steamId
    }
    
    func loadGames() {
        guard let steamId = steamId else { return }
        interactor?.loadGames(steamId: steamId)
    }
    func getGames() -> [Game] {
        return games
    }
    func moveToGame(index: Int) {
        let game = games[index]
        router?.moveToGame(game: game)
    }
    
}
extension GamesPresenter: GamesOutputInteractorProtocol{
    func didLoadGames(games: [Game]) {
        self.games = games
        view?.didLoadGames()
    }
    
    func didLoadWith(error: String) {
        view?.showError(error)
    }
}
