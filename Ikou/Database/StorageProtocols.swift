//
//  StorageProtocols.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

protocol StorageInputProtocol: class{
    associatedtype T
    associatedtype K
    
    func get(byKey: K) -> T?
    func get() -> [T]?
    func set(_ model: T)
    func set(_ models: [T])
}
protocol GameStorageInputProtocol: class{
    associatedtype T
    associatedtype K
    
    func get(byKey: K) -> T?
    func get(appId: Int) -> [T]?
    func set(_ model: T, appId: Int)
    func set(_ models: [T], appId: Int)
}
