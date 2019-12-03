//
//  News.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

struct News: Codable{
    
    var appid: Int?
    var gid: String?
    var title: String?
    var url: String?
    var is_external_url: Bool?
    var author: String?
    var contents: String?
    var feedlabel: String?
    var date: Int?
    var feedname: String?
    var feed_type: Int?
    
    enum CodingKeys: CodingKey{
        case appid
        case gid
        case title
        case url
        case is_external_url
        case author
        case contents
        case feedlabel
        case date
        case feedname
        case feed_type
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.appid = try? container?.decode(Int.self, forKey: .appid)
        self.gid = try? container?.decode(String.self, forKey: .gid)
        self.title = try? container?.decode(String.self, forKey: .title)
        self.url = try? container?.decode(String.self, forKey: .url)
        self.is_external_url = try? container?.decode(Bool.self, forKey: .is_external_url)
        self.author = try? container?.decode(String.self, forKey: .author)
        self.contents = try? container?.decode(String.self, forKey: .contents)
        self.feedlabel = try? container?.decode(String.self, forKey: .feedlabel)
        self.date = try? container?.decode(Int.self, forKey: .date)
        self.feedname = try? container?.decode(String.self, forKey: .feedname)
        self.feed_type = try? container?.decode(Int.self, forKey: .feed_type)
    }
    
}
