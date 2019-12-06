//
//  SteamResponse.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct SteamResponse<T: Codable>: Codable{
    var response: T
    
    enum CodingKeys: CodingKey{
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(T.self, forKey: .response)
    }
}
