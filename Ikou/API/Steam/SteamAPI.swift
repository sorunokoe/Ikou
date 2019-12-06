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
    case news(appId: String)
    case achievements(appId: String, steamId: String)
    case lastSessions(steamId: String)
    case statsForGame(appId: String, steamId: String)
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
        case .news(_):
            return "ISteamNews/GetNewsForApp/v2/"
        case .achievements(_, _):
            return "ISteamUserStats/GetSchemaForGame/v2/"
        case .lastSessions(_):
            return "IPlayerService/GetRecentlyPlayedGames/v0001/"
        case .statsForGame(_, _):
            return "ISteamUserStats/GetUserStatsForGame/v2/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .profile(_), .ownedGames(_), .friends(_),
             .news(_), .achievements(_, _), .lastSessions(_), .statsForGame(_, _):
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
        case .news(let appId):
            return .requestParameters(parameters: [
                "appid": appId,
                "maxlength": 0,
                "count": 5
            ], encoding: URLEncoding.queryString)
        case .achievements(let appId, let steamId):
            return .requestParameters(parameters: [
                "appid": appId,
                "steamid": steamId,
                "key": Constants.Strings.steamKey.rawValue
            ], encoding: URLEncoding.queryString)
        case .lastSessions(let steamId):
            return .requestParameters(parameters: [
                "steamid": steamId,
                "count": 10,
                "key": Constants.Strings.steamKey.rawValue
            ], encoding: URLEncoding.queryString)
        case .statsForGame(let appId, let steamId):
            return .requestParameters(parameters: [
                "appid": appId,
                "steamid": steamId,
                "key": Constants.Strings.steamKey.rawValue
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
