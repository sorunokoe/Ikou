//
//  TabBarProtocols.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation


protocol TabBarWireframeProtocol: class{
    
}
protocol TabBarViewProtocol: class{
    var presenter: TabBarPresenterProtocol? { get set }
}
protocol TabBarPresenterProtocol: class{
    func didSelectTab(index: Int)
}
