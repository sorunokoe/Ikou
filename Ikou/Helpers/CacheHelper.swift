//
//  CacheHelper.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import KeychainSwift

enum CacheKeys: String{
    case steamID
}
protocol CacheHelperProtocol{
    func set(key: CacheKeys, value: String)
    func get(_ key: CacheKeys) -> String?
    func remove(_ key: CacheKeys) -> Bool
}
class CacheHelper: CacheHelperProtocol{
    
    static var shared = CacheHelper()
    private let keychain = KeychainSwift()
    
    func set(key: CacheKeys, value: String) {
        switch key {
        case .steamID:
            keychain.set(value, forKey: key.rawValue)
        }
    }
    
    func get(_ key: CacheKeys) -> String? {
        switch key {
        case .steamID:
            return keychain.get(key.rawValue)
        }
    }
    
    func remove(_ key: CacheKeys) -> Bool{
        switch key {
        case .steamID:
            return keychain.delete(key.rawValue)
        }
    }
    
}
