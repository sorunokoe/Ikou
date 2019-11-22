//
//  Profile.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct Profile: Codable{
    
    var steamid: String
    var communityvisibilitystate: Int
    var profilestate: Int
    var personaname: String
    var lastlogoff: Int
    var profileurl: String
    var avatar: String
    var avatarmedium: String
    var avatarfull: String
    var personastate: Int
    var primaryclanid: String
    var timecreated: Int
    var personastateflags: Int
    var loccountrycode: String
    var locstatecode: String
    var loccityid: Int
    
    enum CodingKeys: CodingKey{
        case steamid
        case communityvisibilitystate
        case profilestate
        case personaname
        case lastlogoff
        case profileurl
        case avatar
        case avatarmedium
        case avatarfull
        case personastate
        case primaryclanid
        case timecreated
        case personastateflags
        case loccountrycode
        case locstatecode
        case loccityid
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(steamid, forKey: .steamid)
        try container.encode(communityvisibilitystate, forKey: .communityvisibilitystate)
        try container.encode(profilestate, forKey: .profilestate)
        try container.encode(personaname, forKey: .personaname)
        try container.encode(lastlogoff, forKey: .lastlogoff)
        try container.encode(profileurl, forKey: .profileurl)
        try container.encode(avatar, forKey: .avatar)
        try container.encode(avatarmedium, forKey: .avatarmedium)
        try container.encode(avatarfull, forKey: .avatarfull)
        try container.encode(personastate, forKey: .personastate)
        try container.encode(primaryclanid, forKey: .primaryclanid)
        try container.encode(timecreated, forKey: .timecreated)
        try container.encode(personastateflags, forKey: .personastateflags)
        try container.encode(loccountrycode, forKey: .loccountrycode)
        try container.encode(locstatecode, forKey: .locstatecode)
        try container.encode(loccityid, forKey: .loccityid)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        steamid = try container.decode(String.self, forKey: .steamid)
        communityvisibilitystate = try container.decode(Int.self, forKey: .communityvisibilitystate)
        profilestate = try container.decode(Int.self, forKey: .profilestate)
        personaname = try container.decode(String.self, forKey: .personaname)
        lastlogoff = try container.decode(Int.self, forKey: .lastlogoff)
        profileurl = try container.decode(String.self, forKey: .profileurl)
        avatar = try container.decode(String.self, forKey: .avatar)
        avatarmedium = try container.decode(String.self, forKey: .avatarmedium)
        avatarfull = try container.decode(String.self, forKey: .avatarfull)
        personastate = try container.decode(Int.self, forKey: .personastate)
        primaryclanid = try container.decode(String.self, forKey: .primaryclanid)
        timecreated = try container.decode(Int.self, forKey: .timecreated)
        personastateflags = try container.decode(Int.self, forKey: .personastateflags)
        loccountrycode = try container.decode(String.self, forKey: .loccountrycode)
        locstatecode = try container.decode(String.self, forKey: .locstatecode)
        loccityid = try container.decode(Int.self, forKey: .loccityid)
    }
    
}
