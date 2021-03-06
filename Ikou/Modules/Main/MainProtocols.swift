//
//  MainProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

protocol MainWireframeProtocol: class{
    func moveToOut()
    func moveToGame(game: Game)
}
protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol? { get set }
    
    func didLoadProfile()
    func didLoadOwnedGames()
    func didLoadFriends()
    func showError(_ error: String)
}
protocol MainPresenterProtocol: class{
    var interactor: MainInputInteractorProtocol? { get set }
    
    func loadProfile()
    func getAvatar(completion: @escaping ((UIImage) -> Void))
    func getUsername() -> String
    func getUserStatus() -> String?
    func getLastTimeOnline() -> String?
    func getPrivateOrPublicProfile() -> String?
    func exit()
    
    func loadOwnedGames()
    func getGames() -> [Game]
    func moveToGame(index: Int)
    
    func loadFriends()
    func getFriends() -> [Profile]
    func loadProfileOf(friend: Friend)
}
protocol MainInputInteractorProtocol: class{
    var presenter: MainOutputInteractorProtocol? { get set }
    
    func loadProfile()
    func loadOwnedGames()
    func loadFriends()
    func loadProfileOf(friend: Friend, completion: @escaping ((Profile) -> Void))
}
protocol MainOutputInteractorProtocol: class{
    func didLoadProfile(profile: Profile?)
    func didLoadGames(games: [Game])
    func didLoadFriends(friends: [Friend])
    func didLoadWith(error: String)
}
