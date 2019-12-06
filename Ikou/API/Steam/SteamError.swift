//
//  APIError.swift
//  Ikou
//
//  Created by Salgara on 12/2/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

enum SteamError{
    case decode
    case network(error: Error)
    case none(error: String)
    
    var errorDesciption: String{
        switch self {
        case .none(let error):
            switch error{
            case ErrorContens.profileNotPublic.rawValue:
                return ErrorContens.profileNotPublic.rawValue
            default:
                return "Houston, we have a problem: '\(error)'"
            }
        case .decode:
            return "Sorry, we can't read data for some reason."
        case .network(let error):
            return "Oh.. server says: '\(error.localizedDescription)'"
        }
    }
    
}
enum ErrorContens: String{
    case profileNotPublic = "Profile is not public"
}
