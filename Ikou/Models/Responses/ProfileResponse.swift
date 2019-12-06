//
//  ProfileResponse.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct ProfileResponse: Codable{
    var players: [Profile]
    
    enum CodingKeys: CodingKey{
        case players
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        players = try container.decode([Profile].self, forKey: .players)
    }
    
}
