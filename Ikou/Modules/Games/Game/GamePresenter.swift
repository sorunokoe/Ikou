//
//  GamePresenter.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

enum GameSegment: String{
    case news = "News"
    case analytics = "Analytics"
    case achievements = "Achievements"
}
class GamePresenter: GamePresenterProtocol{
    
    var interactor: GameInputInteractorProtocol?
    private weak var view: GameViewProtocol?
    private var router: GameWireframeProtocol?
    
    var segments: [GameSegment] = [.analytics, .achievements, .news]
    var currentSegment: GameSegment = .analytics
    
    private var game: Game
    private var allNews = [News]()
    private var achievements = [Achievement]()
    
    private var stats = [StatItem]()
    
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
        interactor?.loadNews()
    }
    
    func loadAchievements() {
        interactor?.loadAchievements()
    }
    
    func loadStats(){
        interactor?.loadStats()
    }
    
    // MARK: - Prepare Data
    func getNews() -> [News] {
        return allNews
    }
    
    func gameLoad() {
        // Request to get info about game from server
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
    
    func getStats() -> [StatItem] {
        return stats
    }
    
    func openNews(index: Int){
        let news = allNews[index]
        router?.moveToNews(url: news.url ?? "")
    }
}

// MARK: - Handlers from Interactor
extension GamePresenter: GameOutputInteractorProtocol{
    func didLoadStats(stats: [StatItem]) {
        self.stats = stats
        view?.statsDidLoad()
    }
    func didLoadStatsWithError(){
        
    }
    func didLoadNews(news: [News]) {
        self.allNews = news
        view?.newsDidLoad()
    }
    func didLoadAchievements(achievements: [Achievement]) {
        self.achievements = achievements
        view?.achievementsDidLoad()
    }
    func didLoadWith(error: String, segment: GameSegment) {
        view?.showError(error: error, segment: segment)
    }
}
