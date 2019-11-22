//
//  MainProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

protocol MainWireframeProtocol: class{
    
}
protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol? { get set }
    
    func didLoadProfile()
    func showError(_ error: String)
}
protocol MainPresenterProtocol: class{
    var interactor: MainInputInteractorProtocol? { get set }
    
    func loadProfile()
    func getAvatar(completion: @escaping ((UIImage) -> Void))
    func getUsername() -> String
    func getUserStatus() -> String?
    func getLastTimeOnline() -> String?
    func getPrivateOrPublicProfile() -> String?
}
protocol MainInputInteractorProtocol: class{
    var presenter: MainOutputInteractorProtocol? { get set }
    
    func loadProfile()
}
protocol MainOutputInteractorProtocol: class{
    func didLoadProfile(profile: Profile)
    func didLoadWith(error: String)
}
