//
//  UserStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class ProfileStorage: StorageInputProtocol {
    
    typealias T = Profile
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> Profile? {
        guard let realm = realm else { return nil }
        if let profileObject = realm.object(ofType: ProfileObject.self, forPrimaryKey: byKey){
            return Profile(object: profileObject)
        }
        return nil
    }
    
    func get() -> [Profile]? {
        return nil
    }
    
    func set(_ model: Profile) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(), update: .modified)
        }
    }
    
    func set(_ models: [Profile]) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(), update: .modified)
            }
        }
    }
    
}
