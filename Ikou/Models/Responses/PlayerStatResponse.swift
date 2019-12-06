//
//  PlayerStatResponse.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct PlayerStatResponse: Codable{
    
    var playerstats: StatResponse?
    
    enum CodingKeys: CodingKey{
        case playerstats
    }
    
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        playerstats = try? container?.decode(StatResponse.self, forKey: .playerstats)
    }
    
}
struct StatResponse: Codable{
    
    var steamID: String?
    var gameName: String?
    var stats: [StatItem]?
    
    var error: String?
    var success: Bool?
    
    enum CodingKeys: CodingKey{
        case steamID
        case gameName
        case stats
        
        case error
        case success
    }
    
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        steamID = try? container?.decode(String.self, forKey: .steamID)
        gameName = try? container?.decode(String.self, forKey: .gameName)
        stats = try? container?.decode([StatItem].self, forKey: .stats)
        
        error = try? container?.decode(String.self, forKey: .error)
        success = try? container?.decode(Bool.self, forKey: .success)
    }
    
}
