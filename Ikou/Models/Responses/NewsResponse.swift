//
//  NewsResponse.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct NewsResponse: Codable{
    var appnews: AppNews?
    
    enum CodingKeys: CodingKey{
        case appnews
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appnews = try? container.decode(AppNews.self, forKey: .appnews)
    }
}
struct AppNews: Codable{
    
    var appid: Int?
    var newsitems: [News]?
    
    enum CodingKeys: CodingKey{
        case appid
        case newsitems
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appid = try? container.decode(Int.self, forKey: .appid)
        self.newsitems = try? container.decode([News].self, forKey: .newsitems)
    }
}
