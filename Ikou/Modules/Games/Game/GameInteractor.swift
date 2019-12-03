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
    var provider: MoyaProvider<SteamAPI>?
    init(){
        provider = MoyaProvider<SteamAPI>()
    }
    
    func loadNews(appId: String) {
        provider?.request(.news(appId: appId), completion: {[weak self] (result) in
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    if let news = newsResponse.appnews?.newsitems{
                        self?.presenter?.didLoadNews(news: news)
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case let .failure(error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        })
    }
}
