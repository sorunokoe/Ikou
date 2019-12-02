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
    case none(error: Error)
}
