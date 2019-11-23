//
//  OwnedGamesResponse.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class OwnedGamesResponse: Codable{
    
    var game_count: Int
    var games: [Game]
    
    enum CodingKeys: CodingKey{
        case game_count, games
    }
    
    init(decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        game_count = try container.decode(Int.self, forKey: .game_count)
        games = try container.decode([Game].self, forKey: .games)
    }
    
}
