//
//  LastSessionStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class LastSessionStorage: StorageInputProtocol {
    
    typealias T = LastSession
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> LastSession? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: LastSessionObject.self, forPrimaryKey: byKey){
            return LastSession(object: object)
        }
        return nil
    }
    
    func get() -> [LastSession]? {
        guard let realm = realm else { return nil }
        let objects = realm.objects(LastSessionObject.self)
        var sessions = [LastSession]()
        for object in objects{
            sessions.append(LastSession(object: object))
        }
        return sessions
    }
    
    func set(_ model: LastSession) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(), update: .modified)
        }
    }
    
    func set(_ models: [LastSession]) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(), update: .modified)
            }
        }
    }
    
}
