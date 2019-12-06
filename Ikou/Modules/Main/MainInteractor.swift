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
    private var profileStorage: ProfileStorage?
    private var gameStorage: GameStorage?
    private var friendStorage: FriendStorage?
    private var provider: MoyaProvider<SteamAPI>?
    private var steamId: String!
    
    init(steamId: String){
        provider = MoyaProvider<SteamAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        profileStorage = ProfileStorage()
        gameStorage = GameStorage()
        friendStorage = FriendStorage()
        self.steamId = steamId
    }
    
    func loadProfile() {
        self.returnProfile()
        provider?.request(.profile(steamId: steamId)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let profileResponse = try JSONDecoder().decode(SteamResponse<ProfileResponse>.self, from: data)
                    if let profile = profileResponse.response.players.first{
                        self?.profileStorage?.set(profile)
                        self?.returnProfile()
                    }
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
    
    func loadOwnedGames() {
        self.returnGames()
        provider?.request(.ownedGames(steamId: steamId)){[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let ownedGamesResponse = try JSONDecoder().decode(SteamResponse<OwnedGamesResponse>.self, from: data)
                    let games = ownedGamesResponse.response.games
                    self?.gameStorage?.set(games)
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
    
    func loadFriends() {
        self.returnFriends()
        provider?.request(.friends(steamId: steamId)) {[weak self] result in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                    let friends = friendsResponse.friendslist.friends
                    self?.friendStorage?.set(friends)
                    self?.returnFriends()
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
    
    func loadProfileOf(friend: Friend, completion: @escaping ((Profile) -> Void)) {
        if let profile = profileStorage?.get(byKey: friend.steamid){
            completion(profile)
        }
        provider?.request(.profile(steamId: friend.steamid)){[weak self] result in
            switch result{
            case .success(let response):
                let data = response.data
                do{
                    let profileResponse = try JSONDecoder().decode(SteamResponse<ProfileResponse>.self, from: data)
                    if let profile = profileResponse.response.players.first{
                        self?.profileStorage?.set(profile)
                        completion(profile)
                    }
                }catch{
                    break
                }
            case .failure(let error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption)
                }
            }
        }
    }
    
    private func returnProfile(){
        if let profile = profileStorage?.get(byKey: steamId){
            self.presenter?.didLoadProfile(profile: profile)
        }
    }
    private func returnGames(){
        if let games = gameStorage?.get(){
            self.presenter?.didLoadGames(games: games)
        }
    }
    private func returnFriends(){
        if let friends = friendStorage?.get(){
            self.presenter?.didLoadFriends(friends: friends)
        }
    }
}
