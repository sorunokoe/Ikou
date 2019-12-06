//
//  GamesInteractor.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Moya

class GamesInteractor: GamesInputInteractorProtocol{
    
    weak var presenter: GamesOutputInteractorProtocol?
    private var provider: MoyaProvider<SteamAPI>?
    private var storage: GameStorage?
    
    init(){
        provider = MoyaProvider<SteamAPI>()
        storage = GameStorage()
    }
    
    func loadGames(steamId: String) {
        self.returnGames()
        provider?.request(.ownedGames(steamId: steamId)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let ownedGamesResponse = try JSONDecoder().decode(SteamResponse<OwnedGamesResponse>.self, from: data)
                    let games = ownedGamesResponse.response.games
                    self?.storage?.set(games)
                    self?.returnGames()
                }catch{
                    self?.presenter?.didLoadWith(error: SteamError.decode.errorDesciption)
                }
            case let .failure(error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption)
                }
            }
        }
    }
    
    private func returnGames(){
        if let games = storage?.get(){
            self.presenter?.didLoadGames(games: games)
        }
    }
    
}
