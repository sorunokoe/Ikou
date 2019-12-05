//
//  LastSessionsProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol LastSessionsWireframe: class{
    
}
protocol LastSessionsViewProtocol: class{
    var presenter: LastSessionPresenterProtocol? { get set }
    
    func didLoadLastSessions()
    func showError(error: String)
}
protocol LastSessionPresenterProtocol: class{
    var interactor: LastSessionsInputeInteractorProcol? { get set }
    
    func loadLastSessions()
    func getLastSessions() -> [LastSession]
}
protocol LastSessionsInputeInteractorProcol: class{
    var presenter: LastSessionsOutputInteractorProtocol? { get set }
    
    func loadLastSessions(steamId: String)
}
protocol LastSessionsOutputInteractorProtocol: class{
    
    func didLoadLastSessions(sessions: [LastSession])
    func didLoadWith(error: SteamError)
}
