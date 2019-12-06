//
//  GameStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class GameStorage: StorageInputProtocol {
    
    typealias T = Game
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> Game? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: GameObject.self, forPrimaryKey: byKey){
            return Game(object: object)
        }
        return nil
    }
    
    func get() -> [Game]? {
        guard let realm = realm else { return nil }
        let gameObjects = realm.objects(GameObject.self)
        var games = [Game]()
        for object in gameObjects{
            games.append(Game(object: object))
        }
        return games
    }
    
    func set(_ model: Game) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(), update: .modified)
        }
    }
    
    func set(_ models: [Game]) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(), update: .modified)
            }
        }
    }
    
}
