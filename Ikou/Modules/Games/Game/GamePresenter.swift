//
//  GamePresenter.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class GamePresenter: GamePresenterProtocol{
    var interactor: GameInputInteractorProtocol?
    private weak var view: GameViewProtocol?
    private weak var router: GameWireframeProtocol?
    private var game: Game?
    private var allNews = [News]()
    init(view: GameViewProtocol, interactor: GameInputInteractorProtocol, router: GameWireframeProtocol, game: Game){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.game = game
    }
    
    func loadNews() {
        guard let appId = game?.appid else { return }
        interactor?.loadNews(appId: "\(appId)")
    }
}
extension GamePresenter: GameOutputInteractorProtocol{
    func didLoadNews(news: [News]) {
        self.allNews = news
        view?.newsDidLoad()
    }
    
    func didLoadWith(error: SteamError) {
        switch error {
        case .network(let error):
            view?.showError(error: error.localizedDescription)
        default:
            break
        }
    }
}
