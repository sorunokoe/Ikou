//
//  Friend.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

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
    
    init(object: FriendObject){
        steamid = object.steamid
        relationship = object.relationship
        friend_since = object.friend_since
    }
    
    func object() -> FriendObject{
        let object = FriendObject()
        object.steamid = steamid
        object.relationship = relationship
        object.friend_since = friend_since
        return object
    }
    
}

class FriendObject: Object{
    
    @objc dynamic var steamid: String = ""
    @objc dynamic var relationship: String = ""
    @objc dynamic var friend_since: Int = 0
    
    override static func primaryKey() -> String? {
        return "steamid"
    }

}
