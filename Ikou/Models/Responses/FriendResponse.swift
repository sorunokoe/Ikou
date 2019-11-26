//
//  FriendResponse.swift
//  Ikou
//
//  Created by Salgara on 11/26/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct FriendsResponse: Codable{
    
    var friendslist: FriendResponse
    
    enum CodingKeys: CodingKey{
        case friendslist
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        friendslist = try container.decode(FriendResponse.self, forKey: .friendslist)
    }
    
}
struct FriendResponse: Codable{
    
    var friends: [Friend]
    
    enum CodingKeys: CodingKey{
        case friends
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        friends = try container.decode([Friend].self, forKey: .friends)
    }
    
}
