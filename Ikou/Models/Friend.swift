//
//  Friend.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation


struct Friend: Codable{
    
    var steamid: String
    var relationship: String
    var friend_since: Int
    
    enum CodingKeys: CodingKey{
        case steamid
        case relationship
        case friend_since
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        steamid = try container.decode(String.self, forKey: .steamid)
        relationship = try container.decode(String.self, forKey: .relationship)
        friend_since = try container.decode(Int.self, forKey: .friend_since)
    }
    
}
