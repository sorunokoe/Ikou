//
//  AchievementsResponse.swift
//  Ikou
//
//  Created by Salgara on 12/5/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct AchievementsResponse: Codable{
    var game: AchievementsGameResponse?
    enum CodingKeys: CodingKey{
        case game
    }
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        game = try? container?.decode(AchievementsGameResponse.self, forKey: .game)
    }
}
struct AchievementsGameResponse: Codable{
    var gameName: String?
    var gameVersion: String?
    var availableGameStats: AvailableGameStats?
    enum CodingKeys: CodingKey{
        case gameName
        case gameVersion
        case availableGameStats
    }
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        gameName = try? container?.decode(String.self, forKey: .gameName)
        gameVersion = try? container?.decode(String.self, forKey: .gameVersion)
        availableGameStats = try? container?.decode(AvailableGameStats.self, forKey: .availableGameStats)
    }
}
struct AvailableGameStats: Codable {
    var achievements: [Achievement]?
    enum CodingKeys: CodingKey{
        case achievements
    }
    init(from decoder: Decoder) throws{
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        achievements = try? container?.decode([Achievement].self, forKey: .achievements)
    }
}
