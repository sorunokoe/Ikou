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
    
    init(){
        self.provider = MoyaProvider<SteamAPI>()
    }
    
    func loadGames(steamId: String) {
        guard let provider = provider else { return }
        provider.request(.ownedGames(steamId: steamId)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let ownedGamesResponse = try JSONDecoder().decode(SteamResponse<OwnedGamesResponse>.self, from: data)
                    self?.presenter?.didLoadGames(games: ownedGamesResponse.response.games)
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case let .failure(error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        }
    }
    
}
