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
    
    private var allGames = [Game]()
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
    func search(word: String) {
        self.games = allGames.filter { (game) -> Bool in
            if game.name.hasPrefix(word){
                return true
            }
            if game.name.hasSuffix(word){
                return true
            }
            if game.name.contains(word){
                return true
            }
            for w in game.name.split(separator: " "){
                if w.hasPrefix(word){
                    return true
                }
                if w.hasSuffix(word){
                    return true
                }
                if w.contains(word){
                    return true
                }
            }
            return false
        }
        self.view?.didLoadGames()
    }
    func cancelSearch(){
        self.games = allGames
        self.view?.didLoadGames()
    }
    func getGames() -> [Game] {
        return games
    }
    func moveToGame(index: Int) {
        let game = games[index]
        router?.moveToGame(game: game)
    }
    func isEmpty() -> Bool{
        return allGames.isEmpty
    }
    
}
extension GamesPresenter: GamesOutputInteractorProtocol{
    func didLoadGames(games: [Game]) {
        self.games = games
        self.allGames = games
        view?.didLoadGames()
    }
    
    func didLoadWith(error: String) {
        view?.showError(error)
    }
}
