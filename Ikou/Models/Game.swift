//
//  GAme.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct Game: Codable{
    
    var appid: Int
    var name: String
    var playtime_forever: Int
    var img_icon_url: String
    var img_logo_url: String
    var has_community_visible_stats: Bool
    var playtime_windows_forever: Int
    var playtime_mac_forever: Int
    var playtime_linux_forever: Int
    
    enum CodingKeys: CodingKey{
        case appid
        case name
        case playtime_forever
        case img_icon_url
        case img_logo_url
        case has_community_visible_stats
        case playtime_windows_forever
        case playtime_mac_forever
        case playtime_linux_forever
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        appid = try container.decode(Int.self, forKey: .appid)
        name = try container.decode(String.self, forKey: .name)
        playtime_forever = try container.decode(Int.self, forKey: .playtime_forever)
        img_icon_url = try container.decode(String.self, forKey: .img_icon_url)
        img_logo_url = try container.decode(String.self, forKey: .img_logo_url)
        has_community_visible_stats = try container.decode(Bool.self, forKey: .has_community_visible_stats)
        playtime_windows_forever = try container.decode(Int.self, forKey: .playtime_windows_forever)
        playtime_mac_forever = try container.decode(Int.self, forKey: .playtime_mac_forever)
        playtime_linux_forever = try container.decode(Int.self, forKey: .playtime_linux_forever)
    }
    
}
