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
    private weak var view: MainViewProtocol?
    private weak var router: MainWireframeProtocol?
    
    private var profile: Profile?
    private var games = [Game]()
    private var steamId: String?
    
    init(interface: MainViewProtocol, router: MainWireframeProtocol, interactor: MainInputInteractorProtocol, steamId: String){
        self.view = interface
        self.router = router
        self.interactor = interactor
        self.steamId = steamId
    }
    
    // MARK: - Profile
    
    func loadProfile() {
        guard let steamId = steamId else { return }
        interactor?.loadProfile(steamId: steamId)
    }
    
    func getAvatar(completion: @escaping ((UIImage) -> Void)){
        guard let profile = profile else { return }
        ImageHelper.getImageBy(url: .avatar(url: profile.avatar), completion: completion)
    }
    func getUsername() -> String{
        return profile?.personaname ?? ""
    }
    func getUserStatus() -> String?{
        guard let profile = profile else { return nil }
        let status = ["Offline", "Online", "Busy", "Away", "Snooze", "looking to trade", "looking to play"]
        return status[profile.personastate]
    }
    
    func getLastTimeOnline() -> String?{
        guard let profile = profile else { return nil }
        return "Last online: \(TimeAndDateHelper.getTimeFrom(unix: profile.lastlogoff))"
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
        guard let steamId = steamId else { return }
        interactor?.loadOwnedGames(steamId: steamId)
    }
    
    func getGames() -> [Game]{
        return games
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
    
    func didLoadWith(error: String) {
        view?.showError(error)
    }
    
}
