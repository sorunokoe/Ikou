//
//  FriendProtocols.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol FriendWireframeProtocol: class {
    
}
protocol FriendViewProtocol: class {
    var presenter: FriendPresenterProtocol? { get set }
    
    func didLoadFriend()
}
protocol FriendPresenterProtocol: class {
    var interactor: FriendInputInteractorProtocol? { get set }
    
    func loadFriend()
    func getFriend() -> Friend
}
protocol FriendInputInteractorProtocol: class {
    var presenter: FriendOutputInteractorProtocol? { get set }
}
protocol FriendOutputInteractorProtocol: class {
    func didLoadFriend(friend: Friend)
}
