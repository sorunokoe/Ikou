//
//  NewsStorage.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class NewsStorage {
    
    typealias T = News
    typealias K = String
        
    var realm: Realm?
    
    init(){
        realm = try? Realm()
    }
    
    func get(byKey: String) -> News? {
        guard let realm = realm else { return nil }
        if let object = realm.object(ofType: NewsObject.self, forPrimaryKey: byKey){
            return News(object: object)
        }
        return nil
    }
    
    func get(appId: Int) -> [News]? {
        guard let realm = realm else { return nil }
        let objects = realm.objects(NewsObject.self).filter{ return $0.appid == appId}
        var news = [News]()
        for object in objects{
            news.append(News(object: object))
        }
        return news
    }
    
    func set(_ model: News) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(model.object(), update: .modified)
        }
    }
    
    func set(_ models: [News]) {
        guard let realm = realm else { return }
        try? realm.write {
            for model in models{
                realm.add(model.object(), update: .modified)
            }
        }
    }
    
}
