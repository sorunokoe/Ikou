//
//  LastSession.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

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
}
