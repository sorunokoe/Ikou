//
//  Constants.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Hue
import UIKit

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
    
    enum Colors{
        case background(view: UIView)
        case title(view: UIView)
        case status
        case block(view: UIView)
        
        var color: UIColor{
            switch self {
            case .background(let view):
                if #available(iOS 12.0, *) {
                    switch view.traitCollection.userInterfaceStyle{
                    case .unspecified, .dark:
                        return UIColor(hex: "#1d1d1d")
                    case .light:
                        return .white
                    default:
                        return UIColor(hex: "#1d1d1d")
                    }
                } else {
                    return UIColor(hex: "#1d1d1d")
                }
            case .status:
                return .systemBlue
            case .title(let view):
                if #available(iOS 12.0, *) {
                    switch view.traitCollection.userInterfaceStyle{
                    case .unspecified, .dark:
                        return .white
                    case .light:
                        return .black
                    default:
                        return .black
                    }
                } else {
                    return .black
                }
            case .block(let view):
                if #available(iOS 12.0, *) {
                    switch view.traitCollection.userInterfaceStyle{
                    case .unspecified, .dark:
                        return UIColor(hex: "#242424")
                    case .light:
                        return UIColor(hex: "#FBFBFB")
                    default:
                        return UIColor(hex: "#242424")
                    }
                } else {
                    return UIColor(hex: "#242424")
                }
            }
        }
    }
    
}
