//
//  FriendPresenter.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class FriendPresenter: FriendPresenterProtocol{
    var view: FriendViewProtocol?
    var router: FriendWireframeProtocol?
    var interactor: FriendInputInteractorProtocol?
    
    private var friend: Friend
    
    init(view: FriendViewProtocol, interactor: FriendInputInteractorProtocol, router: FriendWireframeProtocol, friend: Friend){
        self.interactor = interactor
        self.view = view
        self.router = router
        self.friend = friend
    }
    
    func loadFriend() {
        didLoadFriend(friend: friend)
    }
    
    func getFriend() -> Friend{
        return friend
    }
    
}
extension FriendPresenter: FriendOutputInteractorProtocol{
    func didLoadFriend(friend: Friend){
        view?.didLoadFriend()
    }
}
