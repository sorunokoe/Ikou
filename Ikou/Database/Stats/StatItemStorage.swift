//
//  StatItemStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class StatItemStorage: GameStorageInputProtocol {
    
    typealias T = StatItem
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> StatItem? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: StatItemObject.self, forPrimaryKey: byKey){
            return StatItem(object: object)
        }
        return nil
    }
    
    func get(appId: Int) -> [StatItem]? {
        guard let realm = realm else { return nil }
        let objects = realm.objects(StatItemObject.self).filter{return $0.appId == appId}
        var statItems = [StatItem]()
        for object in objects{
            statItems.append(StatItem(object: object))
        }
        return statItems
    }
    
    func set(_ model: StatItem, appId: Int) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(appId: appId), update: .modified)
        }
    }
    
    func set(_ models: [StatItem], appId: Int) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(appId: appId), update: .modified)
            }
        }
    }
    
}
