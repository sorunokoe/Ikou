//
//  GamePresenter.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

enum GameSegment: String{
    case news = "News"
    case analytics = "Analytics"
    case achievements = "Achievements"
}
class GamePresenter: GamePresenterProtocol{
    
    var interactor: GameInputInteractorProtocol?
    private weak var view: GameViewProtocol?
    private weak var router: GameWireframeProtocol?
    
    var segments: [GameSegment] = [.analytics, .achievements, .news]
    var currentSegment: GameSegment = .analytics
    
    private var game: Game
    private var allNews = [News]()
    private var achievements = [Achievement]()
    
    private var steamId: String
    
    init(view: GameViewProtocol, interactor: GameInputInteractorProtocol, router: GameWireframeProtocol, game: Game, steamId: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.game = game
        self.steamId = steamId
    }
    
    // MARK: - Fetch orders from View
    func loadGame() {
        view?.gameDidLoad()
    }
    
    func loadNews() {
        interactor?.loadNews(appId: "\(game.appid)")
    }
    
    func loadAchievements() {
        interactor?.loadAchievements(appId: "\(game.appid)", steamId: steamId)
    }
    
    // MARK: - Prepare Data
    func getNews() -> [News] {
        return allNews
    }
    
    func gameLoad() {
        
    }
    
    func getGame() -> Game {
        return game
    }
    
    func getPlayTime() -> String{
        return String(format: "Playtime: %0.1f hrs", Double(game.playtime_forever)/60.0)
    }
    
    func getAchievements() -> [Achievement] {
        return achievements
    }
    
    func changeSegment(index: Int){
        let segment = segments[index]
        currentSegment = segment
        view?.navigate(to: segment)
    }
}
extension GamePresenter: GameOutputInteractorProtocol{
    // MARK: - Handlers from Interactor
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
    func didLoadAchievements(achievements: [Achievement]) {
        self.achievements = achievements
        view?.achievementsDidLoad()
    }
}
