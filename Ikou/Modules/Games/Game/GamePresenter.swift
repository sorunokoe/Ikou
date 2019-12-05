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
    private weak var router: GameWireframeProtocol?
    
    var segments: [GameSegment] = [.analytics, .achievements, .news]
    var currentSegment: GameSegment = .analytics
    
    private var game: Game
    private var allNews = [News]()
    private var achievements = [Achievement]()
    
    var maxValueOfChart = 0
    private var charts = [ChartItem]()
    
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
    
    func loadCharts(){
        var charts = [ChartItem]()
        let today = Date()
        let nextDate = Calendar.current.date(byAdding: .day, value: -1, to: today)
        let nextDateYesterday = Calendar.current.date(byAdding: .day, value: -2, to: today)
        charts.append(ChartItem(value: 500, name: "total kills", date: Date()))
        charts.append(ChartItem(value: 200, name: "total kills", date: nextDate!))
        charts.append(ChartItem(value: 50, name: "total kills", date: nextDateYesterday!))
        self.charts = charts
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
    
    func getCharts() -> [ChartItem] {
        return charts
    }
    func getHeight(index: Int) -> CGFloat{
        maxValueOfChart = 0
        charts.forEach {
            if maxValueOfChart < $0.value{
                maxValueOfChart = $0.value
            }
        }
        let item = charts[index]
        let itemProcent = Double(item.value)/100.0
        let maxProcent = Double(maxValueOfChart)/100.0
        let height = CGFloat((itemProcent/maxProcent)*200.0)
        return height
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
