//
//  MainInteractor.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Moya
import RxSwift

class MainInteractor: MainInputInteractorProtocol{
    
    var presenter: MainOutputInteractorProtocol?
    var provider: MoyaProvider<SteamAPI>?
    
    init(){
        provider = MoyaProvider<SteamAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func loadProfile(steamId: String) {
        guard let provider = provider else { return }
        provider.request(.profile(steamId: steamId)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let profileResponse = try JSONDecoder().decode(SteamResponse<ProfileResponse>.self, from: data)
                    if let profile = profileResponse.response.players.first{
                        self?.presenter?.didLoadProfile(profile: profile)
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case let .failure(error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        }
    }
    
    func loadOwnedGames(steamId: String) {
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
    
    func loadFriends(steamId: String) {
        guard let provider = provider else { return }
        provider.request(.friends(steamId: steamId)) {[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                    self?.presenter?.didLoadFriends(friends: friendsResponse.friendslist.friends)
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case let .failure(error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        }
    }
    
    func loadProfileOf(friend: Friend, completion: @escaping ((Profile) -> Void)) {
        guard let provider = provider else { return }
        provider.request(.profile(steamId: friend.steamid)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let profileResponse = try JSONDecoder().decode(SteamResponse<ProfileResponse>.self, from: data)
                    if let profile = profileResponse.response.players.first{
                        completion(profile)
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case let .failure(error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        }
    }
    
}
