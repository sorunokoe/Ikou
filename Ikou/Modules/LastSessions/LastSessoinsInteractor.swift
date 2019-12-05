//
//  LastSessoinsInteractor.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Moya

class LastSessoinsInteractor: LastSessionsInputeInteractorProcol{
    
    var presenter: LastSessionsOutputInteractorProtocol?
    private var provider: MoyaProvider<SteamAPI>?
    
    init(){
        provider = MoyaProvider<SteamAPI>()
    }
    
    func loadLastSessions(steamId: String){
        provider?.request(.lastSessions(steamId: steamId), completion: {[weak self] (result) in
            switch result{
            case .success(let response):
                let data = response.data
                do{
                    let lastSessionsResponse = try JSONDecoder().decode(LastSessionsResponse.self, from: data)
                    if let lastSessions = lastSessionsResponse.games{
                        self?.presenter?.didLoadLastSessions(sessions: lastSessions)
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: .decode)
                }
            case .failure(let error):
                self?.presenter?.didLoadWith(error: .network(error: error))
            }
        })
    }
}
