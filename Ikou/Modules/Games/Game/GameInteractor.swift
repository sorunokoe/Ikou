//
//  GameInteractor.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Moya

class GameInteractor: GameInputInteractorProtocol{
    
    var presenter: GameOutputInteractorProtocol?
    private var provider: MoyaProvider<SteamAPI>?
    private var newsStorage: NewsStorage?
    private var achievemensStorage: AchievementStorage?
    private var statsStorage: StatItemStorage?
    private var appId: Int
    private var steamId: String
    
    init(appId: Int, steamId: String){
        provider = MoyaProvider<SteamAPI>()
        newsStorage = NewsStorage()
        achievemensStorage = AchievementStorage()
        statsStorage = StatItemStorage()
        self.appId = appId
        self.steamId = steamId
    }
    
    func loadNews() {
        self.returnNews()
        provider?.request(.news(appId: "\(appId)"), completion: {[weak self] (result) in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    if let news = newsResponse.appnews?.newsitems{
                        self?.newsStorage?.set(news)
                        self?.returnNews()
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: SteamError.decode.errorDesciption, segment: .news)
                }
            case let .failure(error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption, segment: .news)
                }
            }
        })
    }
    
    func loadAchievements() {
        self.returnAchievements()
        provider?.request(.achievements(appId: "\(appId)", steamId: steamId), completion: {[weak self] (result) in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let achievementResponse = try JSONDecoder().decode(AchievementsResponse.self, from: data)
                    if let game = achievementResponse.game, let statsAndAch = game.availableGameStats, let achievements = statsAndAch.achievements{
                        if let appId = self?.appId{
                            self?.achievemensStorage?.set(achievements, appId: appId)
                            self?.returnAchievements()
                        }
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: SteamError.decode.errorDesciption, segment: .achievements)
                }
            case let .failure(error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption, segment: .achievements)
                }
            }
        })
    }
    
    func loadStats() {
        self.returnStats()
        provider?.request(.statsForGame(appId: "\(appId)", steamId: steamId), completion: {[weak self] (result) in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let playerStatResponse = try JSONDecoder().decode(PlayerStatResponse.self, from: data)
                    if let statsResponse = playerStatResponse.playerstats{
                        if let stats = statsResponse.stats{
                            if let appId = self?.appId{
                                self?.statsStorage?.set(stats, appId: appId)
                                self?.returnStats()
                            }
                            return
                        }
                        if let error = statsResponse.error{
                            self?.presenter?.didLoadWith(error: SteamError.none(error: error).errorDesciption, segment: .analytics)
                        }
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: SteamError.decode.errorDesciption, segment: .analytics)
                }
            case let .failure(error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption, segment: .analytics)
                }
            }
        })
    }
    
    private func returnNews(){
        if let news = newsStorage?.get(appId: appId){
            self.presenter?.didLoadNews(news: news)
        }
    }
    private func returnAchievements(){
        if let achievements = achievemensStorage?.get(appId: appId){
            self.presenter?.didLoadAchievements(achievements: achievements)
        }
    }
    private func returnStats(){
        if let stats = statsStorage?.get(appId: appId){
            var allStats = stats
            let name = "total_kills"
            var value = 120
            self.presenter?.didLoadStats(stats: stats)
        }
    }
    
}
