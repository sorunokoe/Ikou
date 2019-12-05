//
//  LastSessionsResponse.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct LastSessionsResponse: Codable{
    var total_count: Int?
    var games: [LastSession]?
    
    enum CodingKeys: CodingKey{
        case total_count
        case games
    }
    
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        total_count = try? container?.decode(Int.self, forKey: .total_count)
        games = try? container?.decode([LastSession].self, forKey: .games)
    }
}
