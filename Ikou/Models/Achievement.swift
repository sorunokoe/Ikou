//
//  Achievement.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

struct Achievement: Codable{
    
    var name: String?
    var defaultvalue: Int?
    var displayName: String?
    var hidden: Int?
    var description: String?
    var icon: String?
    var icongray: String?
    
    enum CodingKeys: CodingKey{
        case name
        case defaultvalue
        case displayName
        case hidden
        case description
        case icon
        case icongray
    }
    
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        name = try? container?.decode(String.self, forKey: .name)
        defaultvalue = try? container?.decode(Int.self, forKey: .defaultvalue)
        displayName = try? container?.decode(String.self, forKey: .displayName)
        hidden = try? container?.decode(Int.self, forKey: .hidden)
        description = try? container?.decode(String.self, forKey: .description)
        icon = try? container?.decode(String.self, forKey: .icon)
        icongray = try? container?.decode(String.self, forKey: .icongray)
    }
    
    init(object: AchievementObject){
        self.name = object.name
        self.defaultvalue = object.defaultvalue
        self.displayName = object.displayName
        self.hidden = object.hidden
        self.description = object.descriptionValue
        self.icon = object.icon
        self.icongray = object.icongray
    }
    func object(appId: Int) -> AchievementObject{
        let object = AchievementObject()
        object.appId = appId
        object.name = name ?? ""
        object.defaultvalue = defaultvalue ?? 0
        object.displayName = displayName ?? ""
        object.hidden = hidden ?? 0
        object.descriptionValue = description ?? ""
        object.icon = icon ?? ""
        object.icongray = icongray ?? ""
        return object
    }
    
}

class AchievementObject: Object {
    
    @objc dynamic var appId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var defaultvalue: Int = 0
    @objc dynamic var displayName: String = ""
    @objc dynamic var hidden: Int = 0
    @objc dynamic var descriptionValue: String = ""
    @objc dynamic var icon: String = ""
    @objc dynamic var icongray: String = ""

    override class func primaryKey() -> String? {
        return "name"
    }
    
}
