//
//  SteamAPI.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//
//http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=1D15B982E6347473E573D94F9B9F0F5E&steamids=76561198876056556
import Foundation
import Moya

enum SteamAPI{
    case profile(steamId: String)
}

extension SteamAPI: TargetType{
    var baseURL: URL {
        return URL(string: Constants.API.baseUrl.rawValue)!
    }
    
    var path: String {
        switch self {
        case .profile(_):
            return "ISteamUser/GetPlayerSummaries/v0002/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .profile(_):
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
                "key": Constants.Resources.Strings.steamKey.rawValue,
                "steamids": steamId,
                "format": "json"
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
