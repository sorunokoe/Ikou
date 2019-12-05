//
//  GameProtocols.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol GameWireframeProtocol: class{
    
}
protocol GameViewProtocol: class{
    var presenter: GamePresenterProtocol? { get set }
    
    func gameDidLoad()
    func newsDidLoad()
    func achievementsDidLoad()
    func navigate(to: GameSegment)
    func showError(error: String)
}
protocol GamePresenterProtocol: class{
    var interactor: GameInputInteractorProtocol? { get set }
    
    var segments: [GameSegment] { get }
    var currentSegment: GameSegment { get }
    
    func loadGame()
    func loadNews()
    func loadAchievements()
    
    func getPlayTime() -> String
    func getGame() -> Game
    func getNews() -> [News]
    func getAchievements() -> [Achievement]
    func changeSegment(index: Int)
}
protocol GameInputInteractorProtocol: class{
    var presenter: GameOutputInteractorProtocol? { get set }
    
    func loadNews(appId: String)
    func loadAchievements(appId: String, steamId: String)
}
protocol GameOutputInteractorProtocol: class{
    func didLoadNews(news: [News])
    func didLoadAchievements(achievements: [Achievement])
    func didLoadWith(error: SteamError)
}
