//
//  Achievement.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

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
    
}
