//
//  SteamAPI.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Moya

enum SteamAPI{
    case profile(steamId: String)
    case ownedGames(steamId: String)
    case friends(steamId: String)
}

extension SteamAPI: TargetType{
    var baseURL: URL {
        return URL(string: Constants.API.baseUrl.rawValue)!
    }
    
    var path: String {
        switch self {
        case .profile(_):
            return "ISteamUser/GetPlayerSummaries/v0002/"
        case .ownedGames(_):
            return "IPlayerService/GetOwnedGames/v0001/"
        case .friends(_):
            return "ISteamUser/GetFriendList/v0001/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .profile(_), .ownedGames(_), .friends(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return "No data yet".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .profile(let steamId):
            return .requestParameters(parameters: [
                "key": Constants.Strings.steamKey.rawValue,
                "steamids": steamId,
                "format": "json"
            ], encoding: URLEncoding.queryString)
        case .ownedGames(let steamId):
            return .requestParameters(parameters: [
                "key": Constants.Strings.steamKey.rawValue,
                "steamid": steamId,
                "format": "json",
                "include_appinfo": true
            ], encoding: URLEncoding.queryString)
        case .friends(let steamId):
            return .requestParameters(parameters: [
                "key": Constants.Strings.steamKey.rawValue,
                "steamid": steamId
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
