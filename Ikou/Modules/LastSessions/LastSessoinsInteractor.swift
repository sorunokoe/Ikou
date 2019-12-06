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
    private var storage: LastSessionStorage?
    
    init(){
        provider = MoyaProvider<SteamAPI>()
        storage = LastSessionStorage()
    }
    
    func loadLastSessions(steamId: String){
        provider?.request(.lastSessions(steamId: steamId), completion: {[weak self] (result) in
            switch result{
            case .success(let response):
                let data = response.data
                do{
                    let lastSessionsResponse = try JSONDecoder().decode(LastSessionsResponse.self, from: data)
                    if let lastSessions = lastSessionsResponse.games{
                        self?.storage?.set(lastSessions)
                        self?.returnLastSessions()
                    }
                }catch{
                    self?.presenter?.didLoadWith(error: SteamError.decode.errorDesciption)
                }
            case .failure(let error):
                if !error.localizedDescription.contains("The Internet connection appears to be offline"){
                    self?.presenter?.didLoadWith(error: SteamError.network(error: error).errorDesciption)
                }
            }
        })
    }
    
    private func returnLastSessions(){
        if let sessions = storage?.get(){
            self.presenter?.didLoadLastSessions(sessions: sessions)
        }
    }
    
}
