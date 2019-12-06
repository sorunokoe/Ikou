//
//  AchievementStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class AchievementStorage: GameStorageInputProtocol {

    typealias T = Achievement
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> Achievement? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: AchievementObject.self, forPrimaryKey: byKey){
            return Achievement(object: object)
        }
        return nil
    }
    
    func get(appId: Int) -> [Achievement]? {
        guard let realm = realm else { return nil }
        let objects = realm.objects(AchievementObject.self).filter{ return $0.appId == appId}
        var achievements = [Achievement]()
        for object in objects{
            achievements.append(Achievement(object: object))
        }
        return achievements
    }
    
    func set(_ model: Achievement, appId: Int) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(appId: appId), update: .modified)
        }
    }
    
    func set(_ models: [Achievement], appId: Int) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(appId: appId), update: .modified)
            }
        }
    }
    
}
