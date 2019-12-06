//
//  LastSession.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

struct LastSession: Codable{
    var appid: Int?
    var name: String?
    var playtime_2weeks: Int?
    var playtime_forever: Int?
    var img_icon_url: String?
    
    enum CodingKeys: CodingKey{
        case appid
        case name
        case playtime_2weeks
        case playtime_forever
        case img_icon_url
    }
    
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        appid = try? container?.decode(Int.self, forKey: .appid)
        name = try? container?.decode(String.self, forKey: .name)
        playtime_2weeks = try? container?.decode(Int.self, forKey: .playtime_2weeks)
        playtime_forever = try? container?.decode(Int.self, forKey: .playtime_forever)
        img_icon_url = try? container?.decode(String.self, forKey: .img_icon_url)
    }
    
    init(object: LastSessionObject){
        self.appid = object.appid
        self.name = object.name
        self.playtime_2weeks = object.playtime_2weeks
        self.playtime_forever = object.playtime_forever
        self.img_icon_url = object.img_icon_url
    }
    
    func object() -> LastSessionObject{
        let object = LastSessionObject()
        object.appid = appid ?? 0
        object.name = name ?? ""
        object.playtime_2weeks = playtime_2weeks ?? 0
        object.playtime_forever = playtime_forever ?? 0
        object.img_icon_url = img_icon_url ?? ""
        return object
    }
    
}
class LastSessionObject: Object {
    
    @objc dynamic var appid: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var playtime_2weeks: Int = 0
    @objc dynamic var playtime_forever: Int = 0
    @objc dynamic var img_icon_url: String = ""

    override class func primaryKey() -> String? {
        return "appid"
    }
    
}
