//
//  RealmConfiguration.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

class RealmConfiguration{
    
    func configure(){
        let config = Realm.Configuration(
            schemaVersion: 9,
            migrationBlock: { _, _ in
                
            })
        Realm.Configuration.defaultConfiguration = config
        _ = try? Realm()
    }
    
    func clearDB(){
        let realm = try? Realm()
        try? realm?.write {
            realm?.deleteAll()
        }
    }
    
}
