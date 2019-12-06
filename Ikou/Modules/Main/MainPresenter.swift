//
//  MainViewPresenter.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol{
    
    var interactor: MainInputInteractorProtocol?
    private var view: MainViewProtocol?
    private var router: MainWireframeProtocol?
    
    private var profile: Profile?
    private var games = [Game]()
    private var friends = [Friend]()
    private var friendsProfile = [String: Profile]()
    private var steamId: String?
    
    init(interface: MainViewProtocol, router: MainWireframeProtocol, interactor: MainInputInteractorProtocol, steamId: String){
        self.view = interface
        self.router = router
        self.interactor = interactor
        self.steamId = steamId
    }
    
    // MARK: - Profile
    
    func exit(){
        if CacheHelper.shared.remove(.steamID){
            router?.moveToOut()
        }
    }
    
    func loadProfile() {
        interactor?.loadProfile()
    }
    
    func getAvatar(completion: @escaping ((UIImage) -> Void)){
        guard let profile = profile else { return }
        ImageHelper.shared.getImageBy(url: .avatar(url: profile.avatar), completion: completion)
    }
    func getUsername() -> String{
        return profile?.personaname ?? ""
    }
    func getUserStatus() -> String?{
        guard let profile = profile else { return nil }
        return Constants.Steam.status[profile.personastate]
    }
    
    func getLastTimeOnline() -> String?{
        guard let profile = profile else { return nil }
        return "Last online: \(TimeAndDateHelper.shared.getTimeFrom(unix: profile.lastlogoff))"
    }
    func getPrivateOrPublicProfile() -> String?{
        guard let profile = profile else { return nil }
        switch profile.communityvisibilitystate {
        case 0:
            return "This account is private"
        case 3:
            return "This account is publie"
        default:
            return nil
        }
    }
    
    // MARK: - Owned Games
    
    func loadOwnedGames() {
        interactor?.loadOwnedGames()
    }
    
    func getGames() -> [Game]{
        return games
    }
    func moveToGame(index: Int) {
        let game = games[index]
        router?.moveToGame(game: game)
    }
    // MARK: - Friends
    
    func loadFriends() {
        interactor?.loadFriends()
    }
    
    func getFriends() -> [Profile] {
        let friends = Array(friendsProfile.values)
        return friends
    }
    
    func loadProfileOf(friend: Friend){
        if friendsProfile[friend.steamid] != nil{
            view?.didLoadFriends()
            return
        }
        interactor?.loadProfileOf(friend: friend, completion: {[weak self] profile in
            self?.friendsProfile[friend.steamid] = profile
            self?.view?.didLoadFriends()
        })
    }
    
}
extension MainPresenter: MainOutputInteractorProtocol{
    
    func didLoadProfile(profile: Profile?) {
        self.profile = profile
        view?.didLoadProfile()
    }
    
    func didLoadGames(games: [Game]) {
        self.games = games
        view?.didLoadOwnedGames()
    }
    
    func didLoadFriends(friends: [Friend]) {
        self.friends = friends
        for friend in friends{
            loadProfileOf(friend: friend)
        }
    }
    
    func didLoadWith(error: String) {
        view?.showError(error)
    }
    
}
