//
//  FriendStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class FriendStorage: StorageInputProtocol {
    
    typealias T = Friend
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> Friend? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: FriendObject.self, forPrimaryKey: byKey){
            return Friend(object: object)
        }
        return nil
    }
    
    func get() -> [Friend]? {
        guard let realm = realm else { return nil }
        let friendObjects = realm.objects(FriendObject.self)
        var friends = [Friend]()
        for object in friendObjects{
            friends.append(Friend(object: object))
        }
        return friends
    }
    
    func set(_ model: Friend) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(), update: .modified)
        }
    }
    
    func set(_ models: [Friend]) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(), update: .modified)
            }
        }
    }
    
}
