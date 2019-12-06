//
//  Profile.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

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
    var locstatecode: String?
    var loccityid: Int?
    
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
        locstatecode = try? container.decode(String.self, forKey: .locstatecode)
        loccityid = try? container.decode(Int.self, forKey: .loccityid)
    }
    
    init(object: ProfileObject){
        steamid = object.steamid
        communityvisibilitystate = object.communityvisibilitystate
        profilestate = object.profilestate
        personaname = object.personaname
        lastlogoff = object.lastlogoff
        profileurl = object.profileurl
        avatar = object.avatar
        avatarmedium = object.avatarmedium
        avatarfull = object.avatarfull
        personastate = object.personastate
        primaryclanid = object.primaryclanid
        timecreated = object.timecreated
        personastateflags = object.personastateflags
        loccountrycode = object.loccountrycode
        locstatecode = object.locstatecode
        loccityid = object.loccityid
    }
    
    func object() -> ProfileObject {
        let object = ProfileObject()
        object.steamid = steamid
        object.communityvisibilitystate = communityvisibilitystate
        object.profilestate = profilestate
        object.personaname = personaname
        object.lastlogoff = lastlogoff
        object.profileurl = profileurl
        object.avatar = avatar
        object.avatarmedium = avatarmedium
        object.avatarfull = avatarfull
        object.personastate = personastate
        object.primaryclanid = primaryclanid
        object.timecreated = timecreated
        object.personastateflags = personastateflags
        object.loccountrycode = loccountrycode
        object.locstatecode = locstatecode ?? ""
        object.loccityid = loccityid ?? 0
        return object
    }
    
}

class ProfileObject: Object{
    @objc dynamic var steamid: String = ""
    @objc dynamic var communityvisibilitystate: Int = 0
    @objc dynamic var profilestate: Int = 0
    @objc dynamic var personaname: String = ""
    @objc dynamic var lastlogoff: Int = 0
    @objc dynamic var profileurl: String = ""
    @objc dynamic var avatar: String = ""
    @objc dynamic var avatarmedium: String = ""
    @objc dynamic var avatarfull: String = ""
    @objc dynamic var personastate: Int = 0
    @objc dynamic var primaryclanid: String = ""
    @objc dynamic var timecreated: Int = 0
    @objc dynamic var personastateflags: Int = 0
    @objc dynamic var loccountrycode: String = ""
    @objc dynamic var locstatecode: String = ""
    @objc dynamic var loccityid: Int = 0
    
    override static func primaryKey() -> String? {
        return "steamid"
    }
}
