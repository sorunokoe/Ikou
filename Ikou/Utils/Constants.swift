//
//  Constants.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Hue

struct Constants{
    
    enum API: String {
        case baseUrl = "http://api.steampowered.com/"
        case authUrl = "https://steamcommunity.com/login/home/"
    }
    
    struct Resources{
        enum Images: String{
            case gameIcon = "game-icon"
            case gameIconTapped = "game-icon-ed"
        }
        enum Strings: String{
            case steamKey = "1D15B982E6347473E573D94F9B9F0F5E"
        }
    }
    
    struct Colors {
        static var blueOcean = UIColor(hex: "#00A2E8")
    }
}
