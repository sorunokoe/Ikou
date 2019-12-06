//
//  ChartItem.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

struct StatItem: Codable{
    
    var id: String = ""
    var value: Int
    var name: String
    var date = Date()
    
    enum CodingKeys: CodingKey{
        case value
        case name
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        value = try container.decode(Int.self, forKey: .value)
    }
    
    init(object: StatItemObject){
        self.id = object.id
        self.value = object.value
        self.name = object.name
        self.date = TimeAndDateHelper.shared.dateOf(object.date)
    }
    
    func object(appId: Int) -> StatItemObject{
        let object = StatItemObject()
        object.id = [name, TimeAndDateHelper.shared.stringOf(date)].joined(separator: "_")
        object.appId = appId
        object.value = value
        object.name = name
        object.date = TimeAndDateHelper.shared.stringOf(date)
        return object
    }
    
}
class StatItemObject: Object{
    
    @objc dynamic var id: String = ""
    @objc dynamic var appId: Int = 0
    @objc dynamic var value: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
    
}
