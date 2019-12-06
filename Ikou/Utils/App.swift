//
//  App.swift
//  Ikou
//
//  Created by Salgara on 12/7/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class App{
    
    static var shared = App()
    private var databaseConfig: RealmConfiguration?
    
    init(){
        databaseConfig = RealmConfiguration()
    }
    func configure(){
        
    }
    func clear(){
        databaseConfig?.clearDB()
        CacheHelper.shared.clear()
    }
    
}
