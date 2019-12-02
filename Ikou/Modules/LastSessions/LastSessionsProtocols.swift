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
}
protocol LastSessionPresenterProtocol: class{
    var interactor: LastSessionsInputeInteractorProcol? { get set }
}
protocol LastSessionsInputeInteractorProcol: class{
    var presenter: LastSessionsOutputInteractorProtocol? { get set }
}
protocol LastSessionsOutputInteractorProtocol: class{
    
}
