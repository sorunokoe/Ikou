//
//  LastSessionsPresenter.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class LastSessionsPresenter: LastSessionPresenterProtocol{
    
    var interactor: LastSessionsInputeInteractorProcol?
    var view: LastSessionsViewProtocol?
    var router: LastSessionsWireframe?
    
    private var steamId: String
    
    var lastSessions = [LastSession]()
    
    init(view: LastSessionsViewProtocol, interactor: LastSessionsInputeInteractorProcol, router: LastSessionsWireframe, steamId: String){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.steamId = steamId
    }
    
    func loadLastSessions(){
        interactor?.loadLastSessions(steamId: steamId)
    }
    func getLastSessions() -> [LastSession]{
        return lastSessions
    }
}
extension LastSessionsPresenter: LastSessionsOutputInteractorProtocol{
    func didLoadWith(error: SteamError) {
        switch error {
        case .network(let error):
            view?.showError(error: error.localizedDescription)
        default:
            break
        }
    }
    func didLoadLastSessions(sessions: [LastSession]){
        self.lastSessions = sessions
    }
}
