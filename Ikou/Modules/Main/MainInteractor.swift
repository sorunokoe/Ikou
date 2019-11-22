//
//  MainInteractor.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Moya

class MainInteractor: MainInputInteractorProtocol{
    var presenter: MainOutputInteractorProtocol?
    var provider: MoyaProvider<SteamAPI>?
    var cacheHelper: CacheHelper?
    
    init(){
        cacheHelper = CacheHelper()
        provider = MoyaProvider<SteamAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func loadProfile() {
        guard let provider = provider, let cacheHelper = cacheHelper else { return }
        let steamId = cacheHelper.get(.steamID) ?? ""
        provider.request(.profile(steamId: steamId)){[weak self] result in
            guard let `self` = self else { return }
            switch result{
            case let .success(response):
                let data = response.data
                do{
                    let profileResponse: ProfileResponse = try JSONDecoder().decode(ProfileResponse.self, from: data)
                    if let profile = profileResponse.response.players.first{
                        self.presenter?.didLoadProfile(profile: profile)
                    }
                }catch{
                    self.presenter?.didLoadWith(error: "Error while decoding body: \(error.localizedDescription)")
                }
            case let .failure(error):
                self.presenter?.didLoadWith(error: error.failureReason ?? error.localizedDescription)
            }
        }
    }
    
}
